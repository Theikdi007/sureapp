// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreDto _$StoreDtoFromJson(Map<String, dynamic> json) => _StoreDto(
  code: json['code'] as String,
  name: json['name'] as String,
  address: json['address'] as String?,
  city: json['city'] as String?,
  phone: json['phone'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  distance: json['distance'] as String?,
  openNow: json['openNow'] as bool,
  hoursToday: json['hoursToday'] as String?,
  pickup: json['pickup'] as bool,
);

Map<String, dynamic> _$StoreDtoToJson(_StoreDto instance) => <String, dynamic>{
  'code': instance.code,
  'name': instance.name,
  'address': instance.address,
  'city': instance.city,
  'phone': instance.phone,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'distance': instance.distance,
  'openNow': instance.openNow,
  'hoursToday': instance.hoursToday,
  'pickup': instance.pickup,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storesRepository)
final storesRepositoryProvider = StoresRepositoryProvider._();

final class StoresRepositoryProvider
    extends
        $FunctionalProvider<
          StoresRepository,
          StoresRepository,
          StoresRepository
        >
    with $Provider<StoresRepository> {
  StoresRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storesRepositoryHash();

  @$internal
  @override
  $ProviderElement<StoresRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StoresRepository create(Ref ref) {
    return storesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoresRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoresRepository>(value),
    );
  }
}

String _$storesRepositoryHash() => r'c5c26fd56eef4e5a8c1547c1a1826c39614fad6c';
