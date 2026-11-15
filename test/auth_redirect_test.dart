import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/router/routes.dart';

RedirectInputs inputs({
  bool loading = false,
  bool configFailed = false,
  bool updateRequired = false,
  bool signedIn = false,
  bool onboardingDone = true,
  bool phone = false,
  bool awaitingCode = false,
  bool ticket = false,
}) => RedirectInputs(
  loading: loading,
  configFailed: configFailed,
  updateRequired: updateRequired,
  signedIn: signedIn,
  onboardingDone: onboardingDone,
  flowHasPhone: phone,
  flowAwaitingCode: awaitingCode,
  flowHasTicket: ticket,
);

void main() {
  test('update gate wins over everything', () {
    expect(
      resolveRedirect(
        AppRoutes.home,
        inputs(updateRequired: true, signedIn: true),
      ),
      AppRoutes.update,
    );
    expect(
      resolveRedirect(AppRoutes.update, inputs(updateRequired: true)),
      isNull,
    );
  });

  test('splash while loading or when app-config failed', () {
    expect(
      resolveRedirect(AppRoutes.home, inputs(loading: true)),
      AppRoutes.splash,
    );
    expect(
      resolveRedirect(AppRoutes.login, inputs(configFailed: true)),
      AppRoutes.splash,
    );
    expect(resolveRedirect(AppRoutes.splash, inputs(loading: true)), isNull);
  });

  test('signed out: onboarding first, then login', () {
    expect(
      resolveRedirect(AppRoutes.splash, inputs(onboardingDone: false)),
      AppRoutes.onboarding,
    );
    expect(resolveRedirect(AppRoutes.onboarding, inputs()), AppRoutes.login);
    expect(resolveRedirect(AppRoutes.home, inputs()), AppRoutes.login);
    expect(resolveRedirect(AppRoutes.login, inputs()), isNull);
  });

  test('sign-in steps need the step before them', () {
    expect(resolveRedirect(AppRoutes.loginPassword, inputs()), AppRoutes.login);
    expect(
      resolveRedirect(AppRoutes.loginPassword, inputs(phone: true)),
      isNull,
    );
    expect(
      resolveRedirect(AppRoutes.loginOtp, inputs(phone: true)),
      AppRoutes.login,
    );
    expect(
      resolveRedirect(
        AppRoutes.loginOtp,
        inputs(phone: true, awaitingCode: true),
      ),
      isNull,
    );
    expect(
      resolveRedirect(AppRoutes.loginCreatePassword, inputs(phone: true)),
      AppRoutes.login,
    );
    expect(
      resolveRedirect(
        AppRoutes.loginCreatePassword,
        inputs(phone: true, ticket: true),
      ),
      isNull,
    );
  });

  test('signed in leaves auth screens and stays on tabs', () {
    for (final loc in [
      AppRoutes.splash,
      AppRoutes.onboarding,
      AppRoutes.login,
      AppRoutes.loginPassword,
    ]) {
      expect(resolveRedirect(loc, inputs(signedIn: true)), AppRoutes.home);
    }
    expect(resolveRedirect(AppRoutes.orders, inputs(signedIn: true)), isNull);
  });
}
