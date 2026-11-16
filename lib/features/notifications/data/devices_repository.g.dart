// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(devicesRepository)
final devicesRepositoryProvider = DevicesRepositoryProvider._();

final class DevicesRepositoryProvider
    extends
        $FunctionalProvider<
          DevicesRepository,
          DevicesRepository,
          DevicesRepository
        >
    with $Provider<DevicesRepository> {
  DevicesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'devicesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$devicesRepositoryHash();

  @$internal
  @override
  $ProviderElement<DevicesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DevicesRepository create(Ref ref) {
    return devicesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DevicesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DevicesRepository>(value),
    );
  }
}

String _$devicesRepositoryHash() => r'24894b43cce3a64c6d413022892810763224faf0';
