// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Who is signed in. Restored from the keychain at launch; ends when the
/// refresh token is rejected ([sessionEndedProvider]) or on sign-out.

@ProviderFor(Session)
final sessionProvider = SessionProvider._();

/// Who is signed in. Restored from the keychain at launch; ends when the
/// refresh token is rejected ([sessionEndedProvider]) or on sign-out.
final class SessionProvider
    extends $AsyncNotifierProvider<Session, SessionState> {
  /// Who is signed in. Restored from the keychain at launch; ends when the
  /// refresh token is rejected ([sessionEndedProvider]) or on sign-out.
  SessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionHash();

  @$internal
  @override
  Session create() => Session();
}

String _$sessionHash() => r'0d01fc51349dec0ca2308bbf85a9b8cf9b4b9dea';

/// Who is signed in. Restored from the keychain at launch; ends when the
/// refresh token is rejected ([sessionEndedProvider]) or on sign-out.

abstract class _$Session extends $AsyncNotifier<SessionState> {
  FutureOr<SessionState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SessionState>, SessionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SessionState>, SessionState>,
              AsyncValue<SessionState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(OnboardingDone)
final onboardingDoneProvider = OnboardingDoneProvider._();

final class OnboardingDoneProvider
    extends $AsyncNotifierProvider<OnboardingDone, bool> {
  OnboardingDoneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingDoneProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingDoneHash();

  @$internal
  @override
  OnboardingDone create() => OnboardingDone();
}

String _$onboardingDoneHash() => r'6f97d7cf6e80a3938448749e04ea0a1d37c1cade';

abstract class _$OnboardingDone extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(SignInFlow)
final signInFlowProvider = SignInFlowProvider._();

final class SignInFlowProvider
    extends $NotifierProvider<SignInFlow, SignInFlowState> {
  SignInFlowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInFlowProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInFlowHash();

  @$internal
  @override
  SignInFlow create() => SignInFlow();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInFlowState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInFlowState>(value),
    );
  }
}

String _$signInFlowHash() => r'10e267ff90253d8f0c33a4796733ef8a14218ca3';

abstract class _$SignInFlow extends $Notifier<SignInFlowState> {
  SignInFlowState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SignInFlowState, SignInFlowState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignInFlowState, SignInFlowState>,
              SignInFlowState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
