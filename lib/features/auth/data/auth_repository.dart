import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import 'auth_dtos.dart';

part 'auth_repository.g.dart';

/// Sign-in endpoints (API doc → "Sign-in and session").
abstract interface class AuthRepository {
  Future<PhoneCheckDto> checkPhone(String phone);
  Future<OtpSentDto> sendOtp({
    required String phone,
    required OtpPurpose purpose,
  });
  Future<OtpTicketDto> verifyOtp({
    required String phone,
    required OtpPurpose purpose,
    required String code,
  });

  /// Creates (signup) or resets the password with an OTP ticket, and signs in.
  Future<AuthTokensDto> setPassword({
    required String ticket,
    required String password,
    required String confirm,
  });
  Future<AuthTokensDto> login({
    required String phone,
    required String password,
  });
  Future<void> logout({required String refreshToken});
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    ApiAuthRepository(ref.watch(dioProvider));

class ApiAuthRepository implements AuthRepository {
  ApiAuthRepository(this._dio);

  final Dio _dio;

  static final _public = Options(extra: {RequestFlags.skipAuth: true});

  Future<Map<String, dynamic>> _post(
    String path,
    Map<String, dynamic> body, {
    Options? options,
  }) async {
    final res = await _dio.post<Map<String, dynamic>>(
      path,
      data: body,
      options: options ?? _public,
    );
    return res.data ?? const {};
  }

  @override
  Future<PhoneCheckDto> checkPhone(String phone) => apiCall(
    () async => PhoneCheckDto.fromJson(
      await _post('auth/phone/check', {'phone': phone}),
    ),
  );

  @override
  Future<OtpSentDto> sendOtp({
    required String phone,
    required OtpPurpose purpose,
  }) => apiCall(
    () async => OtpSentDto.fromJson(
      await _post('auth/otp', {'phone': phone, 'purpose': purpose.name}),
    ),
  );

  @override
  Future<OtpTicketDto> verifyOtp({
    required String phone,
    required OtpPurpose purpose,
    required String code,
  }) => apiCall(
    () async => OtpTicketDto.fromJson(
      await _post('auth/otp/verify', {
        'phone': phone,
        'purpose': purpose.name,
        'code': code,
      }),
    ),
  );

  @override
  Future<AuthTokensDto> setPassword({
    required String ticket,
    required String password,
    required String confirm,
  }) => apiCall(
    () async => AuthTokensDto.fromJson(
      await _post(
        'auth/password',
        {'ticket': ticket, 'password': password, 'confirm': confirm},
        options: Options(
          extra: {
            RequestFlags.skipAuth: true,
            RequestFlags.sendDeviceName: true,
          },
        ),
      ),
    ),
  );

  @override
  Future<AuthTokensDto> login({
    required String phone,
    required String password,
  }) => apiCall(
    () async => AuthTokensDto.fromJson(
      await _post(
        'auth/login',
        {'phone': phone, 'password': password},
        options: Options(
          extra: {
            RequestFlags.skipAuth: true,
            RequestFlags.sendDeviceName: true,
          },
        ),
      ),
    ),
  );

  @override
  Future<void> logout({required String refreshToken}) =>
      apiCall(() => _post('auth/logout', {'refreshToken': refreshToken}));
}
