// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repairs_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RepairDto _$RepairDtoFromJson(Map<String, dynamic> json) => _RepairDto(
  number: json['number'] as String,
  device: json['device'] as String,
  serial: json['serial'] as String?,
  issue: json['issue'] as String,
  state: json['state'] as String,
  statusLabel: json['statusLabel'] as String,
  active: json['active'] as bool,
  storeName: json['storeName'] as String?,
  meta: json['meta'] as String,
  receivedAt: json['receivedAt'] as String,
  promisedAt: json['promisedAt'] as String?,
);

Map<String, dynamic> _$RepairDtoToJson(_RepairDto instance) =>
    <String, dynamic>{
      'number': instance.number,
      'device': instance.device,
      'serial': instance.serial,
      'issue': instance.issue,
      'state': instance.state,
      'statusLabel': instance.statusLabel,
      'active': instance.active,
      'storeName': instance.storeName,
      'meta': instance.meta,
      'receivedAt': instance.receivedAt,
      'promisedAt': instance.promisedAt,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(repairsRepository)
final repairsRepositoryProvider = RepairsRepositoryProvider._();

final class RepairsRepositoryProvider
    extends
        $FunctionalProvider<
          RepairsRepository,
          RepairsRepository,
          RepairsRepository
        >
    with $Provider<RepairsRepository> {
  RepairsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'repairsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$repairsRepositoryHash();

  @$internal
  @override
  $ProviderElement<RepairsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RepairsRepository create(Ref ref) {
    return repairsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RepairsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RepairsRepository>(value),
    );
  }
}

String _$repairsRepositoryHash() => r'ef52d8b17b517900c5538a565b74b75252000ca7';

@ProviderFor(repairList)
final repairListProvider = RepairListProvider._();

final class RepairListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RepairDto>>,
          List<RepairDto>,
          FutureOr<List<RepairDto>>
        >
    with $FutureModifier<List<RepairDto>>, $FutureProvider<List<RepairDto>> {
  RepairListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'repairListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$repairListHash();

  @$internal
  @override
  $FutureProviderElement<List<RepairDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RepairDto>> create(Ref ref) {
    return repairList(ref);
  }
}

String _$repairListHash() => r'd813704e4a6eb60d309bb252daf037aca903aaf1';
