import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config_dto.freezed.dart';
part 'app_config_dto.g.dart';

/// `GET app-config`: version gate, support phone, onboarding, payments.
@freezed
abstract class AppConfigDto with _$AppConfigDto {
  const factory AppConfigDto({
    required String minimumVersion,
    required String latestVersion,
    required bool updateRequired,
    required String supportPhone,
    String? supportChatUrl,
    required String currency,
    required int pointValueMmk,
    @Default([]) List<PayMethodOptionDto> checkoutPayments,
    @Default([]) List<OnboardingSlideDto> onboarding,
    String? serverTime,
  }) = _AppConfigDto;

  factory AppConfigDto.fromJson(Map<String, dynamic> json) =>
      _$AppConfigDtoFromJson(json);
}

@freezed
abstract class PayMethodOptionDto with _$PayMethodOptionDto {
  const factory PayMethodOptionDto({
    required String code,
    required String title,
    required String description,
    required bool enabled,
    String? disabledReason,
  }) = _PayMethodOptionDto;

  factory PayMethodOptionDto.fromJson(Map<String, dynamic> json) =>
      _$PayMethodOptionDtoFromJson(json);
}

@freezed
abstract class OnboardingSlideDto with _$OnboardingSlideDto {
  const factory OnboardingSlideDto({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) = _OnboardingSlideDto;

  factory OnboardingSlideDto.fromJson(Map<String, dynamic> json) =>
      _$OnboardingSlideDtoFromJson(json);
}
