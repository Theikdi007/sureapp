import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
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
AuthRepository authRepository(Ref ref) => ref.watch(appConfigProvider).isMock
    ? MockAuthRepository()
    : ApiAuthRepository(ref.watch(dioProvider));

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

/// In-memory iSure stand-in for the `mock` flavor.
///
/// * `09776234118` (the doc's member) has the password `sure2026x`.
/// * Any other valid number is a new member: an SMS code is "sent".
/// * OTP `123456` is right, `000000` has expired, anything else is wrong.
class MockAuthRepository implements AuthRepository {
  MockAuthRepository({this.latency = const Duration(milliseconds: 600)});

  final Duration latency;

  static const demoPhone = '09776234118';
  static const demoPassword = 'sure2026x';
  static const demoOtp = '123456';
  static const _expiredOtp = '000000';

  /// phone → password. New members are added when they create a password.
  final _passwords = <String, String>{demoPhone: demoPassword};
  final _tickets = <String, ({String phone, OtpPurpose purpose})>{};
  final _names = <String, String>{demoPhone: 'Thiri Aung'};
  int _seq = 0;

  Future<void> _wait() => Future<void>.delayed(latency);

  static ApiException _problem(
    String code,
    int status,
    String detail, {
    List<ApiFieldError> errors = const [],
  }) =>
      ApiException(code: code, message: detail, status: status, errors: errors);

  /// `09…` with 7–9 digits after the 9, spaces/dashes and +95 allowed.
  static String _normalize(String raw) {
    var digits = raw.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.startsWith('95')) digits = '0${digits.substring(2)}';
    if (!digits.startsWith('0')) digits = '0$digits';
    if (!RegExp(r'^09\d{7,9}$').hasMatch(digits)) {
      throw _problem(
        'mobile.phone_invalid',
        400,
        'Enter a Myanmar mobile number, like 09 7xx xxx xxx.',
        errors: const [
          ApiFieldError(
            field: 'phone',
            code: 'mobile.phone_invalid',
            message: 'Enter a Myanmar mobile number, like 09 7xx xxx xxx.',
          ),
        ],
      );
    }
    return digits;
  }

  static String _display(String phone) {
    final rest = phone.substring(1); // 9xxxxxxxxx
    final groups = <String>[rest.substring(0, 1)];
    for (var i = 1; i < rest.length; i += 3) {
      groups.add(rest.substring(i, i + 3 > rest.length ? rest.length : i + 3));
    }
    return '+95 ${groups.join(' ')}';
  }

  AuthTokensDto _tokensFor(String phone) {
    final now = DateTime.now().toUtc();
    _seq++;
    return AuthTokensDto(
      accessToken: 'mock-access-$_seq',
      accessTokenExpiresAt: now
          .add(const Duration(minutes: 15))
          .toIso8601String(),
      refreshToken: 'mock-refresh-$_seq',
      refreshTokenExpiresAt: now
          .add(const Duration(days: 30))
          .toIso8601String(),
      member: MemberBriefDto(
        memberId: 'mock-$phone',
        name: _names[phone] ?? '',
        phone: '+95${phone.substring(1)}',
        phoneDisplay: _display(phone),
        tier: 'newbie',
        tierLabel: 'Newbie',
      ),
    );
  }

  @override
  Future<PhoneCheckDto> checkPhone(String phone) async {
    await _wait();
    final p = _normalize(phone);
    final known = _passwords.containsKey(p);
    return PhoneCheckDto(
      status: known ? PhoneCheckStatus.password : PhoneCheckStatus.otpSent,
      phone: p,
      phoneDisplay: _display(p),
      purpose: known ? null : OtpPurpose.signup,
      resendAfterSeconds: known ? null : 30,
    );
  }

  @override
  Future<OtpSentDto> sendOtp({
    required String phone,
    required OtpPurpose purpose,
  }) async {
    await _wait();
    final p = _normalize(phone);
    if (purpose == OtpPurpose.reset && !_passwords.containsKey(p)) {
      throw _problem(
        'isure.not_registered',
        404,
        "There's no member with that number. Sign up with it first.",
      );
    }
    return OtpSentDto(
      phone: p,
      phoneDisplay: _display(p),
      purpose: purpose,
      resendAfterSeconds: 30,
      expiresInSeconds: 300,
    );
  }

  @override
  Future<OtpTicketDto> verifyOtp({
    required String phone,
    required OtpPurpose purpose,
    required String code,
  }) async {
    await _wait();
    final p = _normalize(phone);
    if (code == _expiredOtp) {
      throw _problem(
        'isure.otp_expired',
        400,
        'That code has expired. Ask for a new one.',
      );
    }
    if (code != demoOtp) {
      throw _problem(
        'isure.otp_wrong',
        400,
        "That code isn't right. Check the SMS and try again.",
      );
    }
    final ticket = 'otp_mock_${++_seq}';
    _tickets[ticket] = (phone: p, purpose: purpose);
    return OtpTicketDto(
      ticket: ticket,
      purpose: purpose,
      expiresAt: DateTime.now()
          .toUtc()
          .add(const Duration(minutes: 10))
          .toIso8601String(),
    );
  }

  @override
  Future<AuthTokensDto> setPassword({
    required String ticket,
    required String password,
    required String confirm,
  }) async {
    await _wait();
    final t = _tickets[ticket];
    if (t == null) {
      throw _problem(
        'mobile.otp_ticket_invalid',
        401,
        'That code has expired. Ask for a new one.',
      );
    }
    if (password != confirm) {
      throw _problem('mobile.password_mismatch', 400, "Passwords don't match.");
    }
    final unmet = [
      if (password.length < 8) 'At least 8 characters.',
      if (!RegExp('[A-Za-z]').hasMatch(password)) 'Include a letter.',
      if (!RegExp(r'\d').hasMatch(password)) 'Include a number.',
    ];
    if (unmet.isNotEmpty) {
      throw _problem(
        'mobile.password_weak',
        400,
        'Use at least 8 characters with a letter and a number.',
        errors: [
          for (final m in unmet)
            ApiFieldError(
              field: 'password',
              code: 'mobile.password_weak',
              message: m,
            ),
        ],
      );
    }
    if (t.purpose == OtpPurpose.signup && _passwords.containsKey(t.phone)) {
      throw _problem(
        'isure.already_registered',
        409,
        'This number already has an account. Sign in instead.',
      );
    }
    _tickets.remove(ticket);
    _passwords[t.phone] = password;
    return _tokensFor(t.phone);
  }

  @override
  Future<AuthTokensDto> login({
    required String phone,
    required String password,
  }) async {
    await _wait();
    final p = _normalize(phone);
    final stored = _passwords[p];
    if (stored == null) {
      throw _problem(
        'isure.not_registered',
        404,
        "There's no member with that number. Sign up with it first.",
      );
    }
    if (stored != password) {
      throw _problem(
        'isure.password_wrong',
        400,
        'Incorrect password. Try again.',
      );
    }
    return _tokensFor(p);
  }

  @override
  Future<void> logout({required String refreshToken}) => _wait();
}
