import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import 'auth_providers.dart';

part 'app_lock.g.dart';

/// What the device can unlock with, for labels and icons.
enum LockMethod { face, fingerprint, biometrics, screenLock, none }

/// Wraps `local_auth` so tests can swap it.
class DeviceAuth {
  DeviceAuth([LocalAuthentication? auth])
    : _auth = auth ?? LocalAuthentication();

  final LocalAuthentication _auth;

  Future<LockMethod> method() async {
    try {
      final types = await _auth.getAvailableBiometrics();
      if (types.contains(BiometricType.face)) return LockMethod.face;
      if (types.contains(BiometricType.fingerprint)) {
        return LockMethod.fingerprint;
      }
      if (types.isNotEmpty) return LockMethod.biometrics;
      return await _auth.isDeviceSupported()
          ? LockMethod.screenLock
          : LockMethod.none;
    } on Object {
      return LockMethod.none;
    }
  }

  /// True when the member proved it's them. The phone's passcode is
  /// allowed as a fallback so a failed face or finger never locks them out.
  Future<bool> authenticate(String reason) async {
    try {
      return await _auth.authenticate(
        localizedReason: reason,
        persistAcrossBackgrounding: true,
      );
    } on LocalAuthException {
      return false;
    }
  }
}

@Riverpod(keepAlive: true)
DeviceAuth deviceAuth(Ref ref) => DeviceAuth();

class AppLockState {
  const AppLockState({
    required this.loaded,
    required this.enabled,
    required this.locked,
    this.method = LockMethod.none,
  });

  /// False until the saved setting has been read; the app stays covered
  /// meanwhile so nothing shows before a lock engages.
  final bool loaded;
  final bool enabled;
  final bool locked;
  final LockMethod method;

  AppLockState copyWith({
    bool? loaded,
    bool? enabled,
    bool? locked,
    LockMethod? method,
  }) => AppLockState(
    loaded: loaded ?? this.loaded,
    enabled: enabled ?? this.enabled,
    locked: locked ?? this.locked,
    method: method ?? this.method,
  );
}

enum AppLockChange { done, unavailable, cancelled }

/// App Lock (prototype "App Lock"): Face ID / fingerprint before the app
/// shows, at launch and after [relockAfter] in the background. Per device;
/// turned off when the member signs out.
@Riverpod(keepAlive: true)
class AppLock extends _$AppLock {
  static const relockAfter = Duration(minutes: 2);

  DateTime? _backgroundedAt;
  bool _authenticating = false;

  @override
  AppLockState build() {
    final listener = AppLifecycleListener(
      onPause: () => _backgroundedAt = DateTime.now(),
      onResume: _onResume,
    );
    ref.onDispose(listener.dispose);
    ref.listen(sessionProvider, (prev, next) {
      if (prev?.value is SignedIn && next.value is SignedOut) _disable();
    });
    Future.microtask(_load);
    return const AppLockState(loaded: false, enabled: false, locked: true);
  }

  Future<void> _load() async {
    final enabled = await ref.read(appPrefsProvider).appLockEnabled();
    if (!enabled) {
      // Off: show the app at once; nothing to ask the device.
      state = const AppLockState(loaded: true, enabled: false, locked: false);
      return;
    }
    final method = await ref.read(deviceAuthProvider).method();
    // Biometrics and screen lock removed since: don't trap the member.
    final usable = method != LockMethod.none;
    state = AppLockState(
      loaded: true,
      enabled: usable,
      locked: usable,
      method: method,
    );
  }

  void _onResume() {
    final since = _backgroundedAt;
    _backgroundedAt = null;
    if (_authenticating || !state.enabled || since == null) return;
    if (DateTime.now().difference(since) >= relockAfter) {
      state = state.copyWith(locked: true);
    }
  }

  Future<bool> _auth(String reason) async {
    _authenticating = true;
    try {
      return await ref.read(deviceAuthProvider).authenticate(reason);
    } finally {
      _authenticating = false;
      _backgroundedAt = null;
    }
  }

  Future<bool> unlock() async {
    if (!state.locked || _authenticating) return !state.locked;
    final ok = await _auth('Unlock Sure');
    if (ok) state = state.copyWith(locked: false);
    return ok;
  }

  /// Turning it on or off both need the member's face or finger.
  Future<AppLockChange> setEnabled(bool on) async {
    final method = await ref.read(deviceAuthProvider).method();
    state = state.copyWith(method: method);
    if (on && method == LockMethod.none) return AppLockChange.unavailable;
    final ok = await _auth(on ? 'Turn on App Lock' : 'Turn off App Lock');
    if (!ok) return AppLockChange.cancelled;
    await ref.read(appPrefsProvider).setAppLockEnabled(on);
    state = state.copyWith(enabled: on, locked: false);
    return AppLockChange.done;
  }

  Future<void> _disable() async {
    state = state.copyWith(enabled: false, locked: false);
    await ref.read(appPrefsProvider).setAppLockEnabled(false);
  }
}
