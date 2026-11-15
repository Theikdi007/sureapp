// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appConfigRepository)
final appConfigRepositoryProvider = AppConfigRepositoryProvider._();

final class AppConfigRepositoryProvider
    extends
        $FunctionalProvider<
          AppConfigRepository,
          AppConfigRepository,
          AppConfigRepository
        >
    with $Provider<AppConfigRepository> {
  AppConfigRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppConfigRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppConfigRepository create(Ref ref) {
    return appConfigRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppConfigRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppConfigRepository>(value),
    );
  }
}

String _$appConfigRepositoryHash() =>
    r'4f594a231abba313bd50cc2dd20f53417e55ed0b';

/// Loaded once at launch; the splash screen waits for it.

@ProviderFor(remoteAppConfig)
final remoteAppConfigProvider = RemoteAppConfigProvider._();

/// Loaded once at launch; the splash screen waits for it.

final class RemoteAppConfigProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppConfigDto>,
          AppConfigDto,
          FutureOr<AppConfigDto>
        >
    with $FutureModifier<AppConfigDto>, $FutureProvider<AppConfigDto> {
  /// Loaded once at launch; the splash screen waits for it.
  RemoteAppConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteAppConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteAppConfigHash();

  @$internal
  @override
  $FutureProviderElement<AppConfigDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppConfigDto> create(Ref ref) {
    return remoteAppConfig(ref);
  }
}

String _$remoteAppConfigHash() => r'2a6cd6e595f7dd8479f5d0ccd24e79b3bbbe7c0e';
