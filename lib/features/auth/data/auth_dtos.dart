import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dtos.freezed.dart';
part 'auth_dtos.g.dart';

/// `PhoneCheckStatuses`.
@JsonEnum(fieldRename: FieldRename.snake)
enum PhoneCheckStatus {
  /// Member has a password: show Enter password.
  password,

  /// iSure sent an SMS: show the code screen.
  otpSent,
  unknown,
}

/// `OtpPurposes`: `signup` for a new member, `reset` for a forgotten password.
enum OtpPurpose { signup, reset }

@freezed
abstract class PhoneCheckDto with _$PhoneCheckDto {
  const factory PhoneCheckDto({
    @JsonKey(unknownEnumValue: PhoneCheckStatus.unknown)
    required PhoneCheckStatus status,
    required String phone,
    required String phoneDisplay,
    OtpPurpose? purpose,
    int? resendAfterSeconds,
  }) = _PhoneCheckDto;

  factory PhoneCheckDto.fromJson(Map<String, dynamic> json) =>
      _$PhoneCheckDtoFromJson(json);
}

@freezed
abstract class OtpSentDto with _$OtpSentDto {
  const factory OtpSentDto({
    required String phone,
    required String phoneDisplay,
    required OtpPurpose purpose,
    required int resendAfterSeconds,
    required int expiresInSeconds,
  }) = _OtpSentDto;

  factory OtpSentDto.fromJson(Map<String, dynamic> json) =>
      _$OtpSentDtoFromJson(json);
}

/// 10-minute proof that the phone was verified; goes to `auth/password`.
@freezed
abstract class OtpTicketDto with _$OtpTicketDto {
  const factory OtpTicketDto({
    required String ticket,
    required OtpPurpose purpose,
    required String expiresAt,
  }) = _OtpTicketDto;

  factory OtpTicketDto.fromJson(Map<String, dynamic> json) =>
      _$OtpTicketDtoFromJson(json);
}

@freezed
abstract class MemberBriefDto with _$MemberBriefDto {
  const factory MemberBriefDto({
    required String memberId,
    required String name,
    required String phone,
    required String phoneDisplay,
    required String tier,
    required String tierLabel,
  }) = _MemberBriefDto;

  factory MemberBriefDto.fromJson(Map<String, dynamic> json) =>
      _$MemberBriefDtoFromJson(json);
}

@freezed
abstract class AuthTokensDto with _$AuthTokensDto {
  const factory AuthTokensDto({
    required String accessToken,
    required String accessTokenExpiresAt,
    required String refreshToken,
    required String refreshTokenExpiresAt,
    required MemberBriefDto member,
  }) = _AuthTokensDto;

  factory AuthTokensDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensDtoFromJson(json);
}
