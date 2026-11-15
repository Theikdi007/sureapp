// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhoneCheckDto _$PhoneCheckDtoFromJson(Map<String, dynamic> json) =>
    _PhoneCheckDto(
      status: $enumDecode(
        _$PhoneCheckStatusEnumMap,
        json['status'],
        unknownValue: PhoneCheckStatus.unknown,
      ),
      phone: json['phone'] as String,
      phoneDisplay: json['phoneDisplay'] as String,
      purpose: $enumDecodeNullable(_$OtpPurposeEnumMap, json['purpose']),
      resendAfterSeconds: (json['resendAfterSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PhoneCheckDtoToJson(_PhoneCheckDto instance) =>
    <String, dynamic>{
      'status': _$PhoneCheckStatusEnumMap[instance.status]!,
      'phone': instance.phone,
      'phoneDisplay': instance.phoneDisplay,
      'purpose': _$OtpPurposeEnumMap[instance.purpose],
      'resendAfterSeconds': instance.resendAfterSeconds,
    };

const _$PhoneCheckStatusEnumMap = {
  PhoneCheckStatus.password: 'password',
  PhoneCheckStatus.otpSent: 'otp_sent',
  PhoneCheckStatus.unknown: 'unknown',
};

const _$OtpPurposeEnumMap = {
  OtpPurpose.signup: 'signup',
  OtpPurpose.reset: 'reset',
};

_OtpSentDto _$OtpSentDtoFromJson(Map<String, dynamic> json) => _OtpSentDto(
  phone: json['phone'] as String,
  phoneDisplay: json['phoneDisplay'] as String,
  purpose: $enumDecode(_$OtpPurposeEnumMap, json['purpose']),
  resendAfterSeconds: (json['resendAfterSeconds'] as num).toInt(),
  expiresInSeconds: (json['expiresInSeconds'] as num).toInt(),
);

Map<String, dynamic> _$OtpSentDtoToJson(_OtpSentDto instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'phoneDisplay': instance.phoneDisplay,
      'purpose': _$OtpPurposeEnumMap[instance.purpose]!,
      'resendAfterSeconds': instance.resendAfterSeconds,
      'expiresInSeconds': instance.expiresInSeconds,
    };

_OtpTicketDto _$OtpTicketDtoFromJson(Map<String, dynamic> json) =>
    _OtpTicketDto(
      ticket: json['ticket'] as String,
      purpose: $enumDecode(_$OtpPurposeEnumMap, json['purpose']),
      expiresAt: json['expiresAt'] as String,
    );

Map<String, dynamic> _$OtpTicketDtoToJson(_OtpTicketDto instance) =>
    <String, dynamic>{
      'ticket': instance.ticket,
      'purpose': _$OtpPurposeEnumMap[instance.purpose]!,
      'expiresAt': instance.expiresAt,
    };

_MemberBriefDto _$MemberBriefDtoFromJson(Map<String, dynamic> json) =>
    _MemberBriefDto(
      memberId: json['memberId'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      phoneDisplay: json['phoneDisplay'] as String,
      tier: json['tier'] as String,
      tierLabel: json['tierLabel'] as String,
    );

Map<String, dynamic> _$MemberBriefDtoToJson(_MemberBriefDto instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'name': instance.name,
      'phone': instance.phone,
      'phoneDisplay': instance.phoneDisplay,
      'tier': instance.tier,
      'tierLabel': instance.tierLabel,
    };

_AuthTokensDto _$AuthTokensDtoFromJson(Map<String, dynamic> json) =>
    _AuthTokensDto(
      accessToken: json['accessToken'] as String,
      accessTokenExpiresAt: json['accessTokenExpiresAt'] as String,
      refreshToken: json['refreshToken'] as String,
      refreshTokenExpiresAt: json['refreshTokenExpiresAt'] as String,
      member: MemberBriefDto.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthTokensDtoToJson(_AuthTokensDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'accessTokenExpiresAt': instance.accessTokenExpiresAt,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiresAt': instance.refreshTokenExpiresAt,
      'member': instance.member,
    };
