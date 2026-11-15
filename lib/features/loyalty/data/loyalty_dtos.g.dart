// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TierDto _$TierDtoFromJson(Map<String, dynamic> json) => _TierDto(
  key: json['key'] as String,
  label: json['label'] as String,
  clubScoreFrom: (json['clubScoreFrom'] as num).toInt(),
  clubScoreTo: (json['clubScoreTo'] as num?)?.toInt(),
  earnRatePer100Ks: json['earnRatePer100Ks'] as num,
  dailyRedeemLimit: (json['dailyRedeemLimit'] as num?)?.toInt(),
  current: json['current'] as bool? ?? false,
);

Map<String, dynamic> _$TierDtoToJson(_TierDto instance) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'clubScoreFrom': instance.clubScoreFrom,
  'clubScoreTo': instance.clubScoreTo,
  'earnRatePer100Ks': instance.earnRatePer100Ks,
  'dailyRedeemLimit': instance.dailyRedeemLimit,
  'current': instance.current,
};

_BenefitDto _$BenefitDtoFromJson(Map<String, dynamic> json) => _BenefitDto(
  title: json['title'] as String,
  description: json['description'] as String,
  photoUrl: json['photoUrl'] as String?,
);

Map<String, dynamic> _$BenefitDtoToJson(_BenefitDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
    };

_EarnRuleDto _$EarnRuleDtoFromJson(Map<String, dynamic> json) => _EarnRuleDto(
  condition: json['condition'] as String,
  rewardPoints: (json['rewardPoints'] as num).toInt(),
  clubScore: (json['clubScore'] as num).toInt(),
);

Map<String, dynamic> _$EarnRuleDtoToJson(_EarnRuleDto instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'rewardPoints': instance.rewardPoints,
      'clubScore': instance.clubScore,
    };

_TierBenefitsDto _$TierBenefitsDtoFromJson(Map<String, dynamic> json) =>
    _TierBenefitsDto(
      tiers:
          (json['tiers'] as List<dynamic>?)
              ?.map((e) => TierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentBenefits:
          (json['currentBenefits'] as List<dynamic>?)
              ?.map((e) => BenefitDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      earnRules:
          (json['earnRules'] as List<dynamic>?)
              ?.map((e) => EarnRuleDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TierBenefitsDtoToJson(_TierBenefitsDto instance) =>
    <String, dynamic>{
      'tiers': instance.tiers,
      'currentBenefits': instance.currentBenefits,
      'earnRules': instance.earnRules,
    };

_PointEntryDto _$PointEntryDtoFromJson(Map<String, dynamic> json) =>
    _PointEntryDto(
      transactionId: json['transactionId'] as String?,
      label: json['label'] as String,
      type: json['type'] as String,
      at: json['at'] as String,
      amount: (json['amount'] as num).toInt(),
      opens: json['opens'] as bool? ?? false,
    );

Map<String, dynamic> _$PointEntryDtoToJson(_PointEntryDto instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'label': instance.label,
      'type': instance.type,
      'at': instance.at,
      'amount': instance.amount,
      'opens': instance.opens,
    };

_PointDetailRowDto _$PointDetailRowDtoFromJson(Map<String, dynamic> json) =>
    _PointDetailRowDto(
      label: json['label'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$PointDetailRowDtoToJson(_PointDetailRowDto instance) =>
    <String, dynamic>{'label': instance.label, 'value': instance.value};

_PointDetailDto _$PointDetailDtoFromJson(Map<String, dynamic> json) =>
    _PointDetailDto(
      transactionId: json['transactionId'] as String,
      label: json['label'] as String,
      type: json['type'] as String,
      at: json['at'] as String,
      amount: (json['amount'] as num).toInt(),
      unit: json['unit'] as String? ?? 'Shopping Points',
      rows:
          (json['rows'] as List<dynamic>?)
              ?.map(
                (e) => PointDetailRowDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      note: json['note'] as String?,
    );

Map<String, dynamic> _$PointDetailDtoToJson(_PointDetailDto instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'label': instance.label,
      'type': instance.type,
      'at': instance.at,
      'amount': instance.amount,
      'unit': instance.unit,
      'rows': instance.rows,
      'note': instance.note,
    };

_TransferPreviewDto _$TransferPreviewDtoFromJson(Map<String, dynamic> json) =>
    _TransferPreviewDto(
      recipientName: json['recipientName'] as String,
      recipientPhoneDisplay: json['recipientPhoneDisplay'] as String,
      recipientTier: json['recipientTier'] as String?,
      amount: (json['amount'] as num).toInt(),
      balanceAfter: (json['balanceAfter'] as num).toInt(),
      note: json['note'] as String? ?? '',
    );

Map<String, dynamic> _$TransferPreviewDtoToJson(_TransferPreviewDto instance) =>
    <String, dynamic>{
      'recipientName': instance.recipientName,
      'recipientPhoneDisplay': instance.recipientPhoneDisplay,
      'recipientTier': instance.recipientTier,
      'amount': instance.amount,
      'balanceAfter': instance.balanceAfter,
      'note': instance.note,
    };

_TransferResultDto _$TransferResultDtoFromJson(Map<String, dynamic> json) =>
    _TransferResultDto(
      transactionId: json['transactionId'] as String,
      recipientName: json['recipientName'] as String,
      amount: (json['amount'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
      at: json['at'] as String,
    );

Map<String, dynamic> _$TransferResultDtoToJson(_TransferResultDto instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'recipientName': instance.recipientName,
      'amount': instance.amount,
      'balance': instance.balance,
      'at': instance.at,
    };

_TopupCodeDto _$TopupCodeDtoFromJson(Map<String, dynamic> json) =>
    _TopupCodeDto(
      code: json['code'] as String,
      points: (json['points'] as num).toInt(),
      pointsExpireOn: json['pointsExpireOn'] as String?,
      owner: json['owner'] as String?,
      terms: json['terms'] as String?,
      redeemed: json['redeemed'] as bool? ?? false,
      balance: (json['balance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TopupCodeDtoToJson(_TopupCodeDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'points': instance.points,
      'pointsExpireOn': instance.pointsExpireOn,
      'owner': instance.owner,
      'terms': instance.terms,
      'redeemed': instance.redeemed,
      'balance': instance.balance,
    };

_MemberQrDto _$MemberQrDtoFromJson(Map<String, dynamic> json) => _MemberQrDto(
  payload: json['payload'] as String,
  expiresAt: json['expiresAt'] as String,
  memberName: json['memberName'] as String,
  tierLabel: json['tierLabel'] as String,
  phoneDisplay: json['phoneDisplay'] as String,
  points: (json['points'] as num).toInt(),
);

Map<String, dynamic> _$MemberQrDtoToJson(_MemberQrDto instance) =>
    <String, dynamic>{
      'payload': instance.payload,
      'expiresAt': instance.expiresAt,
      'memberName': instance.memberName,
      'tierLabel': instance.tierLabel,
      'phoneDisplay': instance.phoneDisplay,
      'points': instance.points,
    };

_CounterRequestDto _$CounterRequestDtoFromJson(Map<String, dynamic> json) =>
    _CounterRequestDto(
      code: json['code'] as String,
      points: (json['points'] as num).toInt(),
      discountMmk: json['discountMmk'] as num,
      shopName: json['shopName'] as String?,
      expiresAt: json['expiresAt'] as String?,
    );

Map<String, dynamic> _$CounterRequestDtoToJson(_CounterRequestDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'points': instance.points,
      'discountMmk': instance.discountMmk,
      'shopName': instance.shopName,
      'expiresAt': instance.expiresAt,
    };

_CounterResultDto _$CounterResultDtoFromJson(Map<String, dynamic> json) =>
    _CounterResultDto(
      pointsUsed: (json['pointsUsed'] as num).toInt(),
      discountMmk: json['discountMmk'] as num,
      invoiceNo: json['invoiceNo'] as String?,
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$CounterResultDtoToJson(_CounterResultDto instance) =>
    <String, dynamic>{
      'pointsUsed': instance.pointsUsed,
      'discountMmk': instance.discountMmk,
      'invoiceNo': instance.invoiceNo,
      'balance': instance.balance,
    };
