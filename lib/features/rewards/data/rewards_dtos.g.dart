// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RewardCardDto _$RewardCardDtoFromJson(Map<String, dynamic> json) =>
    _RewardCardDto(
      id: json['id'] as String,
      title: json['title'] as String,
      partner: json['partner'] as String?,
      benefit: json['benefit'] as String?,
      cost: (json['cost'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
      validUntil: json['validUntil'] as String?,
      stockLeft: (json['stockLeft'] as num?)?.toInt(),
      featured: json['featured'] as bool? ?? false,
      birthday: json['birthday'] as bool? ?? false,
      state: json['state'] as String? ?? 'available',
      methods:
          (json['methods'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      kind: json['kind'] as String? ?? 'coupon',
    );

Map<String, dynamic> _$RewardCardDtoToJson(_RewardCardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'partner': instance.partner,
      'benefit': instance.benefit,
      'cost': instance.cost,
      'imageUrl': instance.imageUrl,
      'validUntil': instance.validUntil,
      'stockLeft': instance.stockLeft,
      'featured': instance.featured,
      'birthday': instance.birthday,
      'state': instance.state,
      'methods': instance.methods,
      'kind': instance.kind,
    };

_RewardSectionDto _$RewardSectionDtoFromJson(Map<String, dynamic> json) =>
    _RewardSectionDto(
      key: json['key'] as String,
      title: json['title'] as String,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => RewardCardDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RewardSectionDtoToJson(_RewardSectionDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'items': instance.items,
    };

_RewardsHomeDto _$RewardsHomeDtoFromJson(Map<String, dynamic> json) =>
    _RewardsHomeDto(
      points: (json['points'] as num).toInt(),
      expiringPoints: (json['expiringPoints'] as num?)?.toInt(),
      expiringOn: json['expiringOn'] as String?,
      birthdayToday: json['birthdayToday'] as bool? ?? false,
      featured:
          (json['featured'] as List<dynamic>?)
              ?.map((e) => RewardCardDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sections:
          (json['sections'] as List<dynamic>?)
              ?.map((e) => RewardSectionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RewardsHomeDtoToJson(_RewardsHomeDto instance) =>
    <String, dynamic>{
      'points': instance.points,
      'expiringPoints': instance.expiringPoints,
      'expiringOn': instance.expiringOn,
      'birthdayToday': instance.birthdayToday,
      'featured': instance.featured,
      'sections': instance.sections,
    };

_RewardDetailDto _$RewardDetailDtoFromJson(Map<String, dynamic> json) =>
    _RewardDetailDto(
      card: RewardCardDto.fromJson(json['card'] as Map<String, dynamic>),
      description: json['description'] as String?,
      terms: json['terms'] as String?,
      claimedCount: (json['claimedCount'] as num?)?.toInt() ?? 0,
      availableCount: (json['availableCount'] as num?)?.toInt(),
      supportPhone: json['supportPhone'] as String?,
      shops:
          (json['shops'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      ctaLabel: json['ctaLabel'] as String,
      ctaEnabled: json['ctaEnabled'] as bool? ?? false,
      hint: json['hint'] as String?,
      shortBy: (json['shortBy'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RewardDetailDtoToJson(_RewardDetailDto instance) =>
    <String, dynamic>{
      'card': instance.card,
      'description': instance.description,
      'terms': instance.terms,
      'claimedCount': instance.claimedCount,
      'availableCount': instance.availableCount,
      'supportPhone': instance.supportPhone,
      'shops': instance.shops,
      'ctaLabel': instance.ctaLabel,
      'ctaEnabled': instance.ctaEnabled,
      'hint': instance.hint,
      'shortBy': instance.shortBy,
    };

_RewardClaimDto _$RewardClaimDtoFromJson(Map<String, dynamic> json) =>
    _RewardClaimDto(
      rewardId: json['rewardId'] as String,
      method: json['method'] as String,
      title: json['title'] as String,
      code: json['code'] as String?,
      claimingId: json['claimingId'] as String?,
      shopName: json['shopName'] as String?,
      pointsUsed: (json['pointsUsed'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$RewardClaimDtoToJson(_RewardClaimDto instance) =>
    <String, dynamic>{
      'rewardId': instance.rewardId,
      'method': instance.method,
      'title': instance.title,
      'code': instance.code,
      'claimingId': instance.claimingId,
      'shopName': instance.shopName,
      'pointsUsed': instance.pointsUsed,
      'balance': instance.balance,
      'note': instance.note,
    };

_ShopCheckDto _$ShopCheckDtoFromJson(Map<String, dynamic> json) =>
    _ShopCheckDto(
      shopCode: json['shopCode'] as String,
      shopName: json['shopName'] as String,
      allowed: json['allowed'] as bool? ?? false,
    );

Map<String, dynamic> _$ShopCheckDtoToJson(_ShopCheckDto instance) =>
    <String, dynamic>{
      'shopCode': instance.shopCode,
      'shopName': instance.shopName,
      'allowed': instance.allowed,
    };

_MemberBenefitDto _$MemberBenefitDtoFromJson(Map<String, dynamic> json) =>
    _MemberBenefitDto(
      id: json['id'] as String,
      title: json['title'] as String,
      partner: json['partner'] as String?,
      code: json['code'] as String?,
      instruction: json['instruction'] as String?,
      imageUrl: json['imageUrl'] as String?,
      terms: json['terms'] as String?,
      shops:
          (json['shops'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$MemberBenefitDtoToJson(_MemberBenefitDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'partner': instance.partner,
      'code': instance.code,
      'instruction': instance.instruction,
      'imageUrl': instance.imageUrl,
      'terms': instance.terms,
      'shops': instance.shops,
    };
