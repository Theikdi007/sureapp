/// Route paths. Kept apart from the router so screens can import them
/// without an import cycle.
abstract final class AppRoutes {
  static const splash = '/splash';
  static const update = '/update';
  static const onboarding = '/onboarding';

  static const login = '/login';
  static const loginPassword = '/login/password';
  static const loginOtp = '/login/otp';
  static const loginCreatePassword = '/login/create-password';

  static const home = '/home';
  static const orders = '/orders';
  static const rewards = '/rewards';
  static const support = '/support';
  static const profile = '/profile';

  // Catalog (full screen, over the tabs).
  static const products = '/products';
  static const brands = '/brands';
  static const stores = '/stores';
  static const wishlist = '/wishlist';
  static const cart = '/cart';
  static const checkout = '/checkout';

  // Rewards and loyalty (full screen, over the tabs).
  static const memberCoupons = '/member-coupons';
  static const points = '/points';
  static const transfer = '/points/transfer';
  static const topUp = '/points/top-up';
  static const tiers = '/tiers';

  // Support (full screen, over the tabs).
  static const warranty = '/warranty';
  static const findStore = '/find-store';
  static const repairs = '/repairs';

  // Profile and notifications (full screen, over the tabs).
  static const account = '/account';
  static const paymentMethods = '/payment-methods';
  static const about = '/about';
  static const notifications = '/notifications';

  static String product(String id) => '/product/${Uri.encodeComponent(id)}';
  static String order(String number) => '/order/${Uri.encodeComponent(number)}';
  static String track(String number) =>
      '/order/${Uri.encodeComponent(number)}/track';
  static String reward(String id) => '/reward/${Uri.encodeComponent(id)}';
  static String store(String id) => '/stores/${Uri.encodeComponent(id)}';

  static String notification(String id) =>
      '/notifications/${Uri.encodeComponent(id)}';

  /// A text page from `GET content/{slug}` (terms, privacy, return-policy).
  static String content(String slug) => '/content/${Uri.encodeComponent(slug)}';

  /// Browse with optional filters.
  static String browse({
    String? q,
    String? category,
    String? brand,
    String? brandName,
    bool focusSearch = false,
  }) => Uri(
    path: products,
    queryParameters: {
      'q': ?q,
      'category': ?category,
      'brand': ?brand,
      'brandName': ?brandName,
      if (focusSearch) 'focus': '1',
    },
  ).toString();
}

/// Everything the redirect needs, read from providers.
class RedirectInputs {
  const RedirectInputs({
    required this.loading,
    required this.configFailed,
    required this.updateRequired,
    required this.signedIn,
    required this.onboardingDone,
    required this.flowHasPhone,
    required this.flowAwaitingCode,
    required this.flowHasTicket,
  });

  /// app-config, session or the onboarding flag still loading.
  final bool loading;
  final bool configFailed;
  final bool updateRequired;
  final bool signedIn;
  final bool onboardingDone;
  final bool flowHasPhone;
  final bool flowAwaitingCode;
  final bool flowHasTicket;
}

/// Where to send [location], or null to stay. Pure, so it is unit-tested.
///
/// Order: update gate → splash while loading → signed in leaves the auth
/// screens → signed out: onboarding once, then login; each sign-in step
/// needs the data from the step before it.
String? resolveRedirect(String location, RedirectInputs s) {
  String? go(String target) => location == target ? null : target;
  bool under(String root) => location == root || location.startsWith('$root/');

  if (s.updateRequired) return go(AppRoutes.update);
  if (s.loading || s.configFailed) return go(AppRoutes.splash);

  final inAuth =
      under(AppRoutes.login) ||
      location == AppRoutes.onboarding ||
      location == AppRoutes.splash ||
      location == AppRoutes.update;

  if (s.signedIn) return inAuth ? AppRoutes.home : null;

  if (!s.onboardingDone) return go(AppRoutes.onboarding);
  if (!under(AppRoutes.login)) return AppRoutes.login;

  return switch (location) {
    AppRoutes.loginPassword when !s.flowHasPhone => AppRoutes.login,
    AppRoutes.loginOtp when !s.flowAwaitingCode => AppRoutes.login,
    AppRoutes.loginCreatePassword when !s.flowHasTicket => AppRoutes.login,
    _ => null,
  };
}
