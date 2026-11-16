import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/auth_providers.dart';
import '../../features/notifications/data/devices_repository.dart';
import '../core_providers.dart';
import 'firebase_options.dart';

part 'push_registration.g.dart';

/// The push token source. Firebase in the app; tests override it.
abstract interface class PushMessaging {
  /// Asks for permission and returns the FCM token, or null when the device
  /// can't receive pushes (denied, no APNs token on a simulator, no Play
  /// services, Firebase unavailable).
  Future<String?> token();

  Stream<String> get tokenRefresh;
}

@Riverpod(keepAlive: true)
PushMessaging pushMessaging(Ref ref) => FirebasePushMessaging();

class FirebasePushMessaging implements PushMessaging {
  Future<FirebaseMessaging?>? _ready;

  Future<FirebaseMessaging?> _init() => _ready ??= () async {
    final options = SureFirebaseOptions.currentPlatform;
    if (options == null) return null;
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(options: options);
      }
      return FirebaseMessaging.instance;
    } on Object catch (e) {
      debugPrint('Push: Firebase unavailable ($e)');
      return null;
    }
  }();

  @override
  Future<String?> token() async {
    final fm = await _init();
    if (fm == null) return null;
    try {
      final settings = await fm.requestPermission();
      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        return null;
      }
      if (defaultTargetPlatform == TargetPlatform.iOS &&
          await fm.getAPNSToken() == null) {
        // Simulator, or APNs not configured for this build.
        return null;
      }
      // The API (and iSure, which sends the loyalty pushes) wants the FCM
      // registration token. `register()`/`onRegistered` give a Firebase
      // Installation ID for FCM direct-send instead, which they don't use.
      // ignore: deprecated_member_use
      return await fm.getToken();
    } on Object catch (e) {
      debugPrint('Push: no token ($e)');
      return null;
    }
  }

  @override
  Stream<String> get tokenRefresh => Stream.fromFuture(_init()).asyncExpand(
    // Registration token, see [token].
    // ignore: deprecated_member_use
    (fm) => fm?.onTokenRefresh ?? const Stream<String>.empty(),
  );
}

/// Sends and removes this install's token (`POST devices`,
/// `DELETE devices/{token}`). No session dependency, so sign-out can use it.
class PushTokens {
  PushTokens(this._ref);

  final Ref _ref;

  Future<void> send(String token) async {
    try {
      await _ref
          .read(devicesRepositoryProvider)
          .register(
            token: token,
            platform: _ref.read(deviceCapsProvider).platform,
          );
      await _ref.read(appPrefsProvider).setPushToken(token);
    } on Object catch (e) {
      // Tried again on the next launch or token change.
      debugPrint('Push: register failed ($e)');
    }
  }

  /// Removes this install's token from the API. Never throws.
  Future<void> unregister() async {
    final prefs = _ref.read(appPrefsProvider);
    final token = await prefs.pushToken();
    if (token == null) return;
    try {
      await _ref.read(devicesRepositoryProvider).unregister(token);
    } on Object {
      // The server drops stale tokens when FCM rejects them.
    }
    await prefs.setPushToken(null);
  }
}

@Riverpod(keepAlive: true)
PushTokens pushTokens(Ref ref) => PushTokens(ref);

/// Keeps this install's push token registered with the API while signed in
/// (`POST devices` after sign-in and on every new token). Sign-out removes
/// it through [PushTokens.unregister] before the session ends.
@Riverpod(keepAlive: true)
class PushRegistration extends _$PushRegistration {
  StreamSubscription<String>? _refresh;

  @override
  void build() {
    ref.onDispose(() => _refresh?.cancel());
    ref.listen(sessionProvider, (_, next) {
      switch (next.value) {
        case SignedIn():
          unawaited(_register());
        case SignedOut():
          _refresh?.cancel();
          _refresh = null;
        case null:
          break;
      }
    }, fireImmediately: true);
  }

  bool get _signedIn => ref.read(sessionProvider).value is SignedIn;

  Future<void> _register() async {
    final push = ref.read(pushMessagingProvider);
    final token = await push.token();
    if (token != null && _signedIn) {
      await ref.read(pushTokensProvider).send(token);
    }
    _refresh ??= push.tokenRefresh.listen((t) {
      if (_signedIn) ref.read(pushTokensProvider).send(t);
    });
  }
}
