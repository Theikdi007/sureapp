// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfigDto _$AppConfigDtoFromJson(
  Map<String, dynamic> json,
) => _AppConfigDto(
  minimumVersion: json['minimumVersion'] as String,
  latestVersion: json['latestVersion'] as String,
  updateRequired: json['updateRequired'] as bool,
  supportPhone: json['supportPhone'] as String,
  supportChatUrl: json['supportChatUrl'] as String?,
  currency: json['currency'] as String,
  pointValueMmk: (json['pointValueMmk'] as num).toInt(),
  checkoutPayments:
      (json['checkoutPayments'] as List<dynamic>?)
          ?.map((e) => PayMethodOptionDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  onboarding:
      (json['onboarding'] as List<dynamic>?)
          ?.map((e) => OnboardingSlideDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  serverTime: json['serverTime'] as String?,
);

Map<String, dynamic> _$AppConfigDtoToJson(_AppConfigDto instance) =>
    <String, dynamic>{
      'minimumVersion': instance.minimumVersion,
      'latestVersion': instance.latestVersion,
      'updateRequired': instance.updateRequired,
      'supportPhone': instance.supportPhone,
      'supportChatUrl': instance.supportChatUrl,
      'currency': instance.currency,
      'pointValueMmk': instance.pointValueMmk,
      'checkoutPayments': instance.checkoutPayments,
      'onboarding': instance.onboarding,
      'serverTime': instance.serverTime,
    };

_PayMethodOptionDto _$PayMethodOptionDtoFromJson(Map<String, dynamic> json) =>
    _PayMethodOptionDto(
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      enabled: json['enabled'] as bool,
      disabledReason: json['disabledReason'] as String?,
    );

Map<String, dynamic> _$PayMethodOptionDtoToJson(_PayMethodOptionDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'enabled': instance.enabled,
      'disabledReason': instance.disabledReason,
    };

_OnboardingSlideDto _$OnboardingSlideDtoFromJson(Map<String, dynamic> json) =>
    _OnboardingSlideDto(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
    );

Map<String, dynamic> _$OnboardingSlideDtoToJson(_OnboardingSlideDto instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };
