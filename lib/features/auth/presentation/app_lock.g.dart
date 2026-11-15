// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_lock.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deviceAuth)
final deviceAuthProvider = DeviceAuthProvider._();

final class DeviceAuthProvider
    extends $FunctionalProvider<DeviceAuth, DeviceAuth, DeviceAuth>
    with $Provider<DeviceAuth> {
  DeviceAuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceAuthProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceAuthHash();

  @$internal
  @override
  $ProviderElement<DeviceAuth> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceAuth create(Ref ref) {
    return deviceAuth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceAuth value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceAuth>(value),
    );
  }
}

String _$deviceAuthHash() => r'c366e8e55ba062884a8370895c46bd424cb5697d';

/// App Lock (prototype "App Lock"): Face ID / fingerprint before the app
/// shows, at launch and after [relockAfter] in the background. Per device;
/// turned off when the member signs out.

@ProviderFor(AppLock)
final appLockProvider = AppLockProvider._();

/// App Lock (prototype "App Lock"): Face ID / fingerprint before the app
/// shows, at launch and after [relockAfter] in the background. Per device;
/// turned off when the member signs out.
final class AppLockProvider extends $NotifierProvider<AppLock, AppLockState> {
  /// App Lock (prototype "App Lock"): Face ID / fingerprint before the app
  /// shows, at launch and after [relockAfter] in the background. Per device;
  /// turned off when the member signs out.
  AppLockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLockProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLockHash();

  @$internal
  @override
  AppLock create() => AppLock();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLockState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLockState>(value),
    );
  }
}

String _$appLockHash() => r'98d28131206d93b610855e78f0421c3cac9849a5';

/// App Lock (prototype "App Lock"): Face ID / fingerprint before the app
/// shows, at launch and after [relockAfter] in the background. Per device;
/// turned off when the member signs out.

abstract class _$AppLock extends $Notifier<AppLockState> {
  AppLockState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppLockState, AppLockState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLockState, AppLockState>,
              AppLockState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
