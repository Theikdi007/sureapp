// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warranty_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarrantyPlanDto _$WarrantyPlanDtoFromJson(Map<String, dynamic> json) =>
    _WarrantyPlanDto(
      id: json['id'] as String,
      source: json['source'] as String,
      planName: json['planName'] as String,
      device: json['device'] as String,
      serial: json['serial'] as String?,
      endsOn: json['endsOn'] as String?,
      active: json['active'] as bool,
      expiryText: json['expiryText'] as String,
      policyUrl: json['policyUrl'] as String?,
    );

Map<String, dynamic> _$WarrantyPlanDtoToJson(_WarrantyPlanDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'planName': instance.planName,
      'device': instance.device,
      'serial': instance.serial,
      'endsOn': instance.endsOn,
      'active': instance.active,
      'expiryText': instance.expiryText,
      'policyUrl': instance.policyUrl,
    };

_WarrantyCoverDto _$WarrantyCoverDtoFromJson(Map<String, dynamic> json) =>
    _WarrantyCoverDto(
      name: json['name'] as String,
      description: json['description'] as String?,
      policy: json['policy'] as String?,
      endsOn: json['endsOn'] as String?,
    );

Map<String, dynamic> _$WarrantyCoverDtoToJson(_WarrantyCoverDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'policy': instance.policy,
      'endsOn': instance.endsOn,
    };

_WarrantyPlanDetailDto _$WarrantyPlanDetailDtoFromJson(
  Map<String, dynamic> json,
) => _WarrantyPlanDetailDto(
  plan: WarrantyPlanDto.fromJson(json['plan'] as Map<String, dynamic>),
  variant: json['variant'] as String?,
  covers:
      (json['covers'] as List<dynamic>?)
          ?.map((e) => WarrantyCoverDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$WarrantyPlanDetailDtoToJson(
  _WarrantyPlanDetailDto instance,
) => <String, dynamic>{
  'plan': instance.plan,
  'variant': instance.variant,
  'covers': instance.covers,
};

_WarrantyClaimDto _$WarrantyClaimDtoFromJson(Map<String, dynamic> json) =>
    _WarrantyClaimDto(
      number: json['number'] as String,
      planId: json['planId'] as String,
      planName: json['planName'] as String,
      device: json['device'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      statusLabel: json['statusLabel'] as String,
      filedAt: json['filedAt'] as String,
      meta: json['meta'] as String,
      photoUrl: json['photoUrl'] as String?,
      staffNote: json['staffNote'] as String?,
    );

Map<String, dynamic> _$WarrantyClaimDtoToJson(_WarrantyClaimDto instance) =>
    <String, dynamic>{
      'number': instance.number,
      'planId': instance.planId,
      'planName': instance.planName,
      'device': instance.device,
      'description': instance.description,
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'filedAt': instance.filedAt,
      'meta': instance.meta,
      'photoUrl': instance.photoUrl,
      'staffNote': instance.staffNote,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(warrantyRepository)
final warrantyRepositoryProvider = WarrantyRepositoryProvider._();

final class WarrantyRepositoryProvider
    extends
        $FunctionalProvider<
          WarrantyRepository,
          WarrantyRepository,
          WarrantyRepository
        >
    with $Provider<WarrantyRepository> {
  WarrantyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'warrantyRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$warrantyRepositoryHash();

  @$internal
  @override
  $ProviderElement<WarrantyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WarrantyRepository create(Ref ref) {
    return warrantyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WarrantyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WarrantyRepository>(value),
    );
  }
}

String _$warrantyRepositoryHash() =>
    r'a33b7203c0787c16281c2ff9effe634bcd789193';
