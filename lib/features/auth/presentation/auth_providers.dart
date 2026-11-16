import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/push/push_registration.dart';
import '../../../core/storage/token_storage.dart';
import '../data/auth_dtos.dart';
import '../data/auth_repository.dart';

part 'auth_providers.g.dart';

sealed class SessionState {
  const SessionState();
}

class SignedOut extends SessionState {
  const SignedOut();
}

class SignedIn extends SessionState {
  const SignedIn(this.member);

  /// Last known brief profile; null if it couldn't be read back.
  final MemberBriefDto? member;
}

/// Who is signed in. Restored from the keychain at launch; ends when the
/// refresh token is rejected ([sessionEndedProvider]) or on sign-out.
@Riverpod(keepAlive: true)
class Session extends _$Session {
  @override
  Future<SessionState> build() async {
    ref.listen(sessionEndedProvider, (_, _) {
      state = const AsyncData(SignedOut());
    });
    final storage = ref.read(tokenStorageProvider);
    if (await storage.read() == null) return const SignedOut();
    return SignedIn(await _readMember(storage));
  }

  Future<MemberBriefDto?> _readMember(TokenStorage storage) async {
    final raw = await storage.readMember();
    if (raw == null) return null;
    try {
      return MemberBriefDto.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } on Object {
      return null;
    }
  }

  Future<void> signIn(AuthTokensDto tokens) async {
    final storage = ref.read(tokenStorageProvider);
    await storage.save(
      AuthTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      ),
    );
    await storage.saveMember(jsonEncode(tokens.member.toJson()));
    // Session first, so the router leaves the sign-in screens before the
    // flow they depend on is cleared.
    state = AsyncData(SignedIn(tokens.member));
    ref.read(signInFlowProvider.notifier).clear();
  }

  /// Signs out this install. Local sign-out always happens, even offline.
  Future<void> signOut() async {
    final storage = ref.read(tokenStorageProvider);
    final tokens = await storage.read();
    if (tokens != null) {
      // While still signed in: `DELETE devices/{token}` needs the session.
      await ref.read(pushTokensProvider).unregister();
      try {
        await ref
            .read(authRepositoryProvider)
            .logout(refreshToken: tokens.refreshToken);
      } on Object {
        // The server session expires on its own.
      }
    }
    await storage.clear();
    state = const AsyncData(SignedOut());
  }
}

@Riverpod(keepAlive: true)
class OnboardingDone extends _$OnboardingDone {
  @override
  Future<bool> build() => ref.read(appPrefsProvider).onboardingDone();

  Future<void> complete() async {
    await ref.read(appPrefsProvider).setOnboardingDone();
    state = const AsyncData(true);
  }
}

/// What the sign-in screens share: the number being signed in and where
/// the OTP step stands.
class SignInFlowState {
  const SignInFlowState({
    this.phone,
    this.phoneDisplay,
    this.purpose,
    this.resendAfterSeconds,
    this.codeSentAt,
    this.ticket,
  });

  /// As the API returned it (`09…`).
  final String? phone;
  final String? phoneDisplay;
  final OtpPurpose? purpose;
  final int? resendAfterSeconds;
  final DateTime? codeSentAt;
  final String? ticket;

  bool get hasPhone => phone != null;
  bool get awaitingCode => phone != null && purpose != null;
  bool get hasTicket => ticket != null;
}

@Riverpod(keepAlive: true)
class SignInFlow extends _$SignInFlow {
  @override
  SignInFlowState build() => const SignInFlowState();

  void phoneChecked(PhoneCheckDto dto) => state = SignInFlowState(
    phone: dto.phone,
    phoneDisplay: dto.phoneDisplay,
    purpose: dto.status == PhoneCheckStatus.otpSent
        ? (dto.purpose ?? OtpPurpose.signup)
        : null,
    resendAfterSeconds: dto.resendAfterSeconds,
    codeSentAt: dto.status == PhoneCheckStatus.otpSent ? DateTime.now() : null,
  );

  void codeSent(OtpSentDto dto) => state = SignInFlowState(
    phone: dto.phone,
    phoneDisplay: dto.phoneDisplay,
    purpose: dto.purpose,
    resendAfterSeconds: dto.resendAfterSeconds,
    codeSentAt: DateTime.now(),
  );

  void verified(OtpTicketDto dto) => state = SignInFlowState(
    phone: state.phone,
    phoneDisplay: state.phoneDisplay,
    purpose: dto.purpose,
    ticket: dto.ticket,
  );

  void clear() => state = const SignInFlowState();
}
