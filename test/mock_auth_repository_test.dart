import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/features/auth/data/auth_dtos.dart';
import 'package:sure_app/features/auth/data/auth_repository.dart';

Matcher throwsApi(String code) =>
    throwsA(isA<ApiException>().having((e) => e.code, 'code', code));

void main() {
  late MockAuthRepository repo;
  setUp(() => repo = MockAuthRepository(latency: Duration.zero));

  test('known member gets the password step', () async {
    final r = await repo.checkPhone('9 776 234 118');
    expect(r.status, PhoneCheckStatus.password);
    expect(r.phone, '09776234118');
    expect(r.phoneDisplay, '+95 9 776 234 118');
  });

  test('invalid number has a phone field error', () async {
    await expectLater(
      repo.checkPhone('123'),
      throwsApi('mobile.phone_invalid'),
    );
  });

  test('wrong and right password', () async {
    await expectLater(
      repo.login(phone: MockAuthRepository.demoPhone, password: 'nope'),
      throwsApi('isure.password_wrong'),
    );
    final tokens = await repo.login(
      phone: MockAuthRepository.demoPhone,
      password: MockAuthRepository.demoPassword,
    );
    expect(tokens.member.name, 'Thiri Aung');
  });

  test('signup: otp → ticket → password → can log in', () async {
    const phone = '09791234567';
    final check = await repo.checkPhone(phone);
    expect(check.status, PhoneCheckStatus.otpSent);
    expect(check.purpose, OtpPurpose.signup);

    await expectLater(
      repo.verifyOtp(phone: phone, purpose: OtpPurpose.signup, code: '111111'),
      throwsApi('isure.otp_wrong'),
    );
    await expectLater(
      repo.verifyOtp(phone: phone, purpose: OtpPurpose.signup, code: '000000'),
      throwsApi('isure.otp_expired'),
    );
    final ticket = await repo.verifyOtp(
      phone: phone,
      purpose: OtpPurpose.signup,
      code: MockAuthRepository.demoOtp,
    );

    await expectLater(
      repo.setPassword(
        ticket: ticket.ticket,
        password: 'short',
        confirm: 'short',
      ),
      throwsA(
        isA<ApiException>()
            .having((e) => e.code, 'code', 'mobile.password_weak')
            .having((e) => e.errors, 'errors', isNotEmpty),
      ),
    );
    await repo.setPassword(
      ticket: ticket.ticket,
      password: 'sure2026y',
      confirm: 'sure2026y',
    );
    expect((await repo.checkPhone(phone)).status, PhoneCheckStatus.password);
    await repo.login(phone: phone, password: 'sure2026y');
  });

  test('ticket is single use', () async {
    final t = await repo.verifyOtp(
      phone: MockAuthRepository.demoPhone,
      purpose: OtpPurpose.reset,
      code: MockAuthRepository.demoOtp,
    );
    await repo.setPassword(
      ticket: t.ticket,
      password: 'abc12345',
      confirm: 'abc12345',
    );
    await expectLater(
      repo.setPassword(
        ticket: t.ticket,
        password: 'abc12345',
        confirm: 'abc12345',
      ),
      throwsApi('mobile.otp_ticket_invalid'),
    );
  });

  test('reset for an unknown number', () async {
    await expectLater(
      repo.sendOtp(phone: '09790000000', purpose: OtpPurpose.reset),
      throwsApi('isure.not_registered'),
    );
  });
}
