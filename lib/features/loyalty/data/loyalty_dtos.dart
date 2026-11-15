import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_dtos.freezed.dart';
part 'loyalty_dtos.g.dart';

@freezed
abstract class TierDto with _$TierDto {
  const factory TierDto({
    required String key,
    required String label,
    required int clubScoreFrom,
    int? clubScoreTo,
    required num earnRatePer100Ks,
    int? dailyRedeemLimit,
    @Default(false) bool current,
  }) = _TierDto;

  factory TierDto.fromJson(Map<String, dynamic> json) =>
      _$TierDtoFromJson(json);
}

@freezed
abstract class BenefitDto with _$BenefitDto {
  const factory BenefitDto({
    required String title,
    required String description,
    String? photoUrl,
  }) = _BenefitDto;

  factory BenefitDto.fromJson(Map<String, dynamic> json) =>
      _$BenefitDtoFromJson(json);
}

@freezed
abstract class EarnRuleDto with _$EarnRuleDto {
  const factory EarnRuleDto({
    required String condition,
    required int rewardPoints,
    required int clubScore,
  }) = _EarnRuleDto;

  factory EarnRuleDto.fromJson(Map<String, dynamic> json) =>
      _$EarnRuleDtoFromJson(json);
}

/// `GET loyalty/tiers`.
@freezed
abstract class TierBenefitsDto with _$TierBenefitsDto {
  const factory TierBenefitsDto({
    @Default([]) List<TierDto> tiers,
    @Default([]) List<BenefitDto> currentBenefits,
    @Default([]) List<EarnRuleDto> earnRules,
  }) = _TierBenefitsDto;

  factory TierBenefitsDto.fromJson(Map<String, dynamic> json) =>
      _$TierBenefitsDtoFromJson(json);
}

/// One points or club-score movement; `amount` is signed.
@freezed
abstract class PointEntryDto with _$PointEntryDto {
  const factory PointEntryDto({
    String? transactionId,
    required String label,
    required String type,
    required String at,
    required int amount,
    @Default(false) bool opens,
  }) = _PointEntryDto;

  factory PointEntryDto.fromJson(Map<String, dynamic> json) =>
      _$PointEntryDtoFromJson(json);
}

@freezed
abstract class PointDetailRowDto with _$PointDetailRowDto {
  const factory PointDetailRowDto({
    required String label,
    required String value,
  }) = _PointDetailRowDto;

  factory PointDetailRowDto.fromJson(Map<String, dynamic> json) =>
      _$PointDetailRowDtoFromJson(json);
}

@freezed
abstract class PointDetailDto with _$PointDetailDto {
  const factory PointDetailDto({
    required String transactionId,
    required String label,
    required String type,
    required String at,
    required int amount,
    @Default('Shopping Points') String unit,
    @Default([]) List<PointDetailRowDto> rows,
    String? note,
  }) = _PointDetailDto;

  factory PointDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PointDetailDtoFromJson(json);
}

@freezed
abstract class TransferPreviewDto with _$TransferPreviewDto {
  const factory TransferPreviewDto({
    required String recipientName,
    required String recipientPhoneDisplay,
    String? recipientTier,
    required int amount,
    required int balanceAfter,
    @Default('') String note,
  }) = _TransferPreviewDto;

  factory TransferPreviewDto.fromJson(Map<String, dynamic> json) =>
      _$TransferPreviewDtoFromJson(json);
}

@freezed
abstract class TransferResultDto with _$TransferResultDto {
  const factory TransferResultDto({
    required String transactionId,
    required String recipientName,
    required int amount,
    required int balance,
    required String at,
  }) = _TransferResultDto;

  factory TransferResultDto.fromJson(Map<String, dynamic> json) =>
      _$TransferResultDtoFromJson(json);
}

@freezed
abstract class TopupCodeDto with _$TopupCodeDto {
  const factory TopupCodeDto({
    required String code,
    required int points,
    String? pointsExpireOn,
    String? owner,
    String? terms,
    @Default(false) bool redeemed,
    int? balance,
  }) = _TopupCodeDto;

  factory TopupCodeDto.fromJson(Map<String, dynamic> json) =>
      _$TopupCodeDtoFromJson(json);
}

/// Member QR for Pay in store; expires (fetch again when the sheet opens).
@freezed
abstract class MemberQrDto with _$MemberQrDto {
  const factory MemberQrDto({
    required String payload,
    required String expiresAt,
    required String memberName,
    required String tierLabel,
    required String phoneDisplay,
    required int points,
  }) = _MemberQrDto;

  factory MemberQrDto.fromJson(Map<String, dynamic> json) =>
      _$MemberQrDtoFromJson(json);
}

/// A cashier's pending pay-with-points request.
@freezed
abstract class CounterRequestDto with _$CounterRequestDto {
  const factory CounterRequestDto({
    required String code,
    required int points,
    required num discountMmk,
    String? shopName,
    String? expiresAt,
  }) = _CounterRequestDto;

  factory CounterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CounterRequestDtoFromJson(json);
}

@freezed
abstract class CounterResultDto with _$CounterResultDto {
  const factory CounterResultDto({
    required int pointsUsed,
    required num discountMmk,
    String? invoiceNo,
    required int balance,
  }) = _CounterResultDto;

  factory CounterResultDto.fromJson(Map<String, dynamic> json) =>
      _$CounterResultDtoFromJson(json);
}
