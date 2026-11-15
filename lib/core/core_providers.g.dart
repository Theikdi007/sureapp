// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Overridden in `main()` with the value read before `runApp`.

@ProviderFor(appConfig)
final appConfigProvider = AppConfigProvider._();

/// Overridden in `main()` with the value read before `runApp`.

final class AppConfigProvider
    extends $FunctionalProvider<AppConfig, AppConfig, AppConfig>
    with $Provider<AppConfig> {
  /// Overridden in `main()` with the value read before `runApp`.
  AppConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigHash();

  @$internal
  @override
  $ProviderElement<AppConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppConfig create(Ref ref) {
    return appConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppConfig>(value),
    );
  }
}

String _$appConfigHash() => r'a42994ff05e3b10eba964807393ef7b775792de4';

/// Overridden in `main()` with the value read before `runApp`.

@ProviderFor(deviceCaps)
final deviceCapsProvider = DeviceCapsProvider._();

/// Overridden in `main()` with the value read before `runApp`.

final class DeviceCapsProvider
    extends $FunctionalProvider<DeviceCaps, DeviceCaps, DeviceCaps>
    with $Provider<DeviceCaps> {
  /// Overridden in `main()` with the value read before `runApp`.
  DeviceCapsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceCapsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceCapsHash();

  @$internal
  @override
  $ProviderElement<DeviceCaps> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceCaps create(Ref ref) {
    return deviceCaps(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceCaps value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceCaps>(value),
    );
  }
}

String _$deviceCapsHash() => r'95d50616a0a64e9e98e42d51b6d5492d401cee18';

/// Live iOS Reduce Transparency setting (starts with the launch value).

@ProviderFor(reduceTransparency)
final reduceTransparencyProvider = ReduceTransparencyProvider._();

/// Live iOS Reduce Transparency setting (starts with the launch value).

final class ReduceTransparencyProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Live iOS Reduce Transparency setting (starts with the launch value).
  ReduceTransparencyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reduceTransparencyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reduceTransparencyHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return reduceTransparency(ref);
  }
}

String _$reduceTransparencyHash() =>
    r'418be7c5988b8f4b3a1603ba2726890fc073943b';

/// `Accept-Language` value: `en` now, `my` is reserved by the API.

@ProviderFor(AppLanguage)
final appLanguageProvider = AppLanguageProvider._();

/// `Accept-Language` value: `en` now, `my` is reserved by the API.
final class AppLanguageProvider extends $NotifierProvider<AppLanguage, String> {
  /// `Accept-Language` value: `en` now, `my` is reserved by the API.
  AppLanguageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLanguageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLanguageHash();

  @$internal
  @override
  AppLanguage create() => AppLanguage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$appLanguageHash() => r'acbd4c467a50e59d71f22ea698dfba2ee0b7c09f';

/// `Accept-Language` value: `en` now, `my` is reserved by the API.

abstract class _$AppLanguage extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(tokenStorage)
final tokenStorageProvider = TokenStorageProvider._();

final class TokenStorageProvider
    extends $FunctionalProvider<TokenStorage, TokenStorage, TokenStorage>
    with $Provider<TokenStorage> {
  TokenStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenStorageHash();

  @$internal
  @override
  $ProviderElement<TokenStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TokenStorage create(Ref ref) {
    return tokenStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenStorage>(value),
    );
  }
}

String _$tokenStorageHash() => r'a42816fb1cf5af728e44ff5c48bfcaf5dc6b12aa';

/// Bumped when the session ends (refresh failed / signed out remotely). The
/// router listens to it and sends the user to sign-in.

@ProviderFor(SessionEnded)
final sessionEndedProvider = SessionEndedProvider._();

/// Bumped when the session ends (refresh failed / signed out remotely). The
/// router listens to it and sends the user to sign-in.
final class SessionEndedProvider extends $NotifierProvider<SessionEnded, int> {
  /// Bumped when the session ends (refresh failed / signed out remotely). The
  /// router listens to it and sends the user to sign-in.
  SessionEndedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionEndedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionEndedHash();

  @$internal
  @override
  SessionEnded create() => SessionEnded();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$sessionEndedHash() => r'33456dd5ec1bd26c29d911a3274e93df57583a7a';

/// Bumped when the session ends (refresh failed / signed out remotely). The
/// router listens to it and sends the user to sign-in.

abstract class _$SessionEnded extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Set when any call answers `410 mobile.update_required`.

@ProviderFor(UpdateRequired)
final updateRequiredProvider = UpdateRequiredProvider._();

/// Set when any call answers `410 mobile.update_required`.
final class UpdateRequiredProvider
    extends $NotifierProvider<UpdateRequired, bool> {
  /// Set when any call answers `410 mobile.update_required`.
  UpdateRequiredProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateRequiredProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateRequiredHash();

  @$internal
  @override
  UpdateRequired create() => UpdateRequired();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$updateRequiredHash() => r'66b4b58e5c14b263508ff0db276da43ce50e0c80';

/// Set when any call answers `410 mobile.update_required`.

abstract class _$UpdateRequired extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(appPrefs)
final appPrefsProvider = AppPrefsProvider._();

final class AppPrefsProvider
    extends $FunctionalProvider<AppPrefs, AppPrefs, AppPrefs>
    with $Provider<AppPrefs> {
  AppPrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appPrefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appPrefsHash();

  @$internal
  @override
  $ProviderElement<AppPrefs> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppPrefs create(Ref ref) {
    return appPrefs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppPrefs value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppPrefs>(value),
    );
  }
}

String _$appPrefsHash() => r'a2af5812fa75474dbd5c5a1fef52519fe09d4002';

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'81c280f5e13368d84dda6aae517acd9a151d3387';
