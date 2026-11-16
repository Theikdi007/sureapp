// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoyaltySummaryDto _$LoyaltySummaryDtoFromJson(Map<String, dynamic> json) =>
    _LoyaltySummaryDto(
      points: (json['points'] as num).toInt(),
      earnedThisMonth: (json['earnedThisMonth'] as num?)?.toInt() ?? 0,
      expiringPoints: (json['expiringPoints'] as num?)?.toInt(),
      expiringOn: json['expiringOn'] as String?,
      equivalentMmk: json['equivalentMmk'] as num,
      tier: json['tier'] as String,
      tierLabel: json['tierLabel'] as String,
      clubScore: (json['clubScore'] as num).toInt(),
      nextTier: json['nextTier'] as String?,
      nextTierLabel: json['nextTierLabel'] as String?,
      nextTierThreshold: (json['nextTierThreshold'] as num?)?.toInt(),
      progressPercent: (json['progressPercent'] as num?)?.toInt() ?? 0,
      dailyRedeemLimit: (json['dailyRedeemLimit'] as num?)?.toInt(),
      earnRatePer100Ks: json['earnRatePer100Ks'] as num,
    );

Map<String, dynamic> _$LoyaltySummaryDtoToJson(_LoyaltySummaryDto instance) =>
    <String, dynamic>{
      'points': instance.points,
      'earnedThisMonth': instance.earnedThisMonth,
      'expiringPoints': instance.expiringPoints,
      'expiringOn': instance.expiringOn,
      'equivalentMmk': instance.equivalentMmk,
      'tier': instance.tier,
      'tierLabel': instance.tierLabel,
      'clubScore': instance.clubScore,
      'nextTier': instance.nextTier,
      'nextTierLabel': instance.nextTierLabel,
      'nextTierThreshold': instance.nextTierThreshold,
      'progressPercent': instance.progressPercent,
      'dailyRedeemLimit': instance.dailyRedeemLimit,
      'earnRatePer100Ks': instance.earnRatePer100Ks,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loyaltyRepository)
final loyaltyRepositoryProvider = LoyaltyRepositoryProvider._();

final class LoyaltyRepositoryProvider
    extends
        $FunctionalProvider<
          LoyaltyRepository,
          LoyaltyRepository,
          LoyaltyRepository
        >
    with $Provider<LoyaltyRepository> {
  LoyaltyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loyaltyRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loyaltyRepositoryHash();

  @$internal
  @override
  $ProviderElement<LoyaltyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoyaltyRepository create(Ref ref) {
    return loyaltyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoyaltyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoyaltyRepository>(value),
    );
  }
}

String _$loyaltyRepositoryHash() => r'ea98d833cdc74ea47bdcee85d7aaaf9af1279fd3';

/// Signed-in member's points and tier.

@ProviderFor(loyaltySummary)
final loyaltySummaryProvider = LoyaltySummaryProvider._();

/// Signed-in member's points and tier.

final class LoyaltySummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<LoyaltySummaryDto>,
          LoyaltySummaryDto,
          FutureOr<LoyaltySummaryDto>
        >
    with
        $FutureModifier<LoyaltySummaryDto>,
        $FutureProvider<LoyaltySummaryDto> {
  /// Signed-in member's points and tier.
  LoyaltySummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loyaltySummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loyaltySummaryHash();

  @$internal
  @override
  $FutureProviderElement<LoyaltySummaryDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LoyaltySummaryDto> create(Ref ref) {
    return loyaltySummary(ref);
  }
}

String _$loyaltySummaryHash() => r'650f81643e217cc391b28ac01f7786047778ddc3';
