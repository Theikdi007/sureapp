import 'package:freezed_annotation/freezed_annotation.dart';

part 'rewards_dtos.freezed.dart';
part 'rewards_dtos.g.dart';

/// A reward card. `state`: available, claimed, insufficient_points,
/// out_of_stock, expired, birthday_locked. `kind`: coupon, goods,
/// engraving. `methods`: code, shop, direct, delivery.
@freezed
abstract class RewardCardDto with _$RewardCardDto {
  const RewardCardDto._();

  const factory RewardCardDto({
    required String id,
    required String title,
    String? partner,
    String? benefit,
    required int cost,
    String? imageUrl,
    String? validUntil,
    int? stockLeft,
    @Default(false) bool featured,
    @Default(false) bool birthday,
    @Default('available') String state,
    @Default([]) List<String> methods,
    @Default('coupon') String kind,
  }) = _RewardCardDto;

  factory RewardCardDto.fromJson(Map<String, dynamic> json) =>
      _$RewardCardDtoFromJson(json);

  bool get claimed => state == 'claimed';
}

/// A Rewards row; `key` is the kind of its items.
@freezed
abstract class RewardSectionDto with _$RewardSectionDto {
  const factory RewardSectionDto({
    required String key,
    required String title,
    @Default([]) List<RewardCardDto> items,
  }) = _RewardSectionDto;

  factory RewardSectionDto.fromJson(Map<String, dynamic> json) =>
      _$RewardSectionDtoFromJson(json);
}

@freezed
abstract class RewardsHomeDto with _$RewardsHomeDto {
  const factory RewardsHomeDto({
    required int points,
    int? expiringPoints,
    String? expiringOn,
    @Default(false) bool birthdayToday,
    @Default([]) List<RewardCardDto> featured,
    @Default([]) List<RewardSectionDto> sections,
  }) = _RewardsHomeDto;

  factory RewardsHomeDto.fromJson(Map<String, dynamic> json) =>
      _$RewardsHomeDtoFromJson(json);
}

/// Reward detail: show `ctaLabel`, disabled with `hint` when
/// `ctaEnabled` is false.
@freezed
abstract class RewardDetailDto with _$RewardDetailDto {
  const factory RewardDetailDto({
    required RewardCardDto card,
    String? description,
    String? terms,
    @Default(0) int claimedCount,
    int? availableCount,
    String? supportPhone,
    @Default([]) List<String> shops,
    required String ctaLabel,
    @Default(false) bool ctaEnabled,
    String? hint,
    @Default(0) int shortBy,
  }) = _RewardDetailDto;

  factory RewardDetailDto.fromJson(Map<String, dynamic> json) =>
      _$RewardDetailDtoFromJson(json);
}

@freezed
abstract class RewardClaimDto with _$RewardClaimDto {
  const factory RewardClaimDto({
    required String rewardId,
    required String method,
    required String title,
    String? code,
    String? claimingId,
    String? shopName,
    required int pointsUsed,
    required int balance,
    @Default('') String note,
  }) = _RewardClaimDto;

  factory RewardClaimDto.fromJson(Map<String, dynamic> json) =>
      _$RewardClaimDtoFromJson(json);
}

@freezed
abstract class ShopCheckDto with _$ShopCheckDto {
  const factory ShopCheckDto({
    required String shopCode,
    required String shopName,
    @Default(false) bool allowed,
  }) = _ShopCheckDto;

  factory ShopCheckDto.fromJson(Map<String, dynamic> json) =>
      _$ShopCheckDtoFromJson(json);
}

/// Member (tier) coupon code.
@freezed
abstract class MemberBenefitDto with _$MemberBenefitDto {
  const factory MemberBenefitDto({
    required String id,
    required String title,
    String? partner,
    String? code,
    String? instruction,
    String? imageUrl,
    String? terms,
    @Default([]) List<String> shops,
  }) = _MemberBenefitDto;

  factory MemberBenefitDto.fromJson(Map<String, dynamic> json) =>
      _$MemberBenefitDtoFromJson(json);
}
