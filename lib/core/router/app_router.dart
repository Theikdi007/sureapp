import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../design_system/adaptive/adaptive_shell.dart';
import '../../features/app_config/data/app_config_repository.dart';
import '../../features/auth/presentation/auth_providers.dart';
import '../../features/auth/presentation/create_password_screen.dart';
import '../../features/auth/presentation/launch_screens.dart';
import '../../features/auth/presentation/onboarding_screen.dart';
import '../../features/auth/presentation/otp_screen.dart';
import '../../features/auth/presentation/password_screen.dart';
import '../../features/auth/presentation/phone_screen.dart';
import '../../features/cart/presentation/cart_fab.dart';
import '../../features/cart/presentation/cart_sheet.dart';
import '../../features/cart/presentation/checkout_screen.dart';
import '../../features/catalog/data/catalog_repository.dart';
import '../../features/catalog/presentation/product_detail_screen.dart';
import '../../features/catalog/presentation/product_list_screen.dart';
import '../../features/catalog/presentation/store_screens.dart';
import '../../features/content/presentation/content_page_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/loyalty/presentation/points_screen.dart';
import '../../features/loyalty/presentation/tier_benefits_screen.dart';
import '../../features/loyalty/presentation/top_up_screen.dart';
import '../../features/loyalty/presentation/transfer_screen.dart';
import '../../features/orders/presentation/order_detail_screen.dart';
import '../../features/rewards/presentation/member_coupons_screen.dart';
import '../../features/rewards/presentation/reward_detail_screen.dart';
import '../../features/rewards/presentation/rewards_screen.dart';
import '../../features/orders/presentation/orders_screen.dart';
import '../../features/notifications/presentation/notifications_screen.dart';
import '../../features/profile/presentation/about_screen.dart';
import '../../features/profile/presentation/account_screen.dart';
import '../../features/profile/presentation/payment_methods_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/repairs/presentation/repairs_screen.dart';
import '../../features/stores/presentation/find_store_screen.dart';
import '../../features/support/presentation/support_screen.dart';
import '../../features/warranty/presentation/warranty_screen.dart';
import '../core_providers.dart';
import 'routes.dart';

export 'routes.dart';

part 'app_router.g.dart';

/// Tabs from the prototype (`navCells`): home · order · reward · support ·
/// profile, Lucide house / package / gift / headset / user.
const shellDestinations = [
  ShellDestination(
    label: 'Home',
    icon: LucideIcons.house,
    selectedIcon: LucideIcons.house,
  ),
  ShellDestination(
    label: 'Order',
    icon: LucideIcons.package,
    selectedIcon: LucideIcons.package,
  ),
  ShellDestination(
    label: 'Rewards',
    icon: LucideIcons.gift,
    selectedIcon: LucideIcons.gift,
  ),
  ShellDestination(
    label: 'Support',
    icon: LucideIcons.headset,
    selectedIcon: LucideIcons.headset,
  ),
  ShellDestination(
    label: 'Profile',
    icon: LucideIcons.user,
    selectedIcon: LucideIcons.user,
  ),
];

const _startRoute = String.fromEnvironment('START_ROUTE');
bool startRouteUsed = false;

/// Kept alive so navigation state survives rebuilds (theme, fold, rotation).
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  // Re-run the redirect whenever anything it reads changes.
  final refresh = ValueNotifier<int>(0);
  void bump(Object? _, Object? _) => refresh.value++;
  ref
    ..listen(remoteAppConfigProvider, bump)
    ..listen(updateRequiredProvider, bump)
    ..listen(sessionProvider, bump)
    ..listen(onboardingDoneProvider, bump)
    ..listen(signInFlowProvider, bump);

  RedirectInputs inputs() {
    final config = ref.read(remoteAppConfigProvider);
    final session = ref.read(sessionProvider);
    final onboarding = ref.read(onboardingDoneProvider);
    final flow = ref.read(signInFlowProvider);
    return RedirectInputs(
      loading:
          (config.isLoading && !config.hasValue) ||
          !session.hasValue ||
          !onboarding.hasValue,
      configFailed: config.hasError && !config.hasValue,
      updateRequired:
          ref.read(updateRequiredProvider) ||
          (config.value?.updateRequired ?? false),
      signedIn: session.value is SignedIn,
      onboardingDone: onboarding.value ?? false,
      flowHasPhone: flow.hasPhone,
      flowAwaitingCode: flow.awaitingCode,
      flowHasTicket: flow.hasTicket,
    );
  }

  StatefulShellBranch branch(String path, Widget screen) => StatefulShellBranch(
    routes: [GoRoute(path: path, builder: (_, _) => screen)],
  );

  final router = GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refresh,
    redirect: (context, state) {
      final target = resolveRedirect(state.matchedLocation, inputs());
      // Debug QA: `--dart-define=START_ROUTE=/product/VG-WATCH-3` opens that
      // screen once, right after a signed-in launch.
      if (kDebugMode &&
          !startRouteUsed &&
          _startRoute.isNotEmpty &&
          target == AppRoutes.home) {
        startRouteUsed = true;
        return _startRoute;
      }
      return target;
    },
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (_, _) => const SplashScreen()),
      GoRoute(
        path: AppRoutes.update,
        builder: (_, _) => const UpdateRequiredScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (_, _) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (_, _) => const PhoneScreen(),
        routes: [
          GoRoute(path: 'password', builder: (_, _) => const PasswordScreen()),
          GoRoute(path: 'otp', builder: (_, _) => const OtpScreen()),
          GoRoute(
            path: 'create-password',
            builder: (_, _) => const CreatePasswordScreen(),
          ),
        ],
      ),
      // Catalog screens cover the tabs (no tab bar, like the prototype).
      GoRoute(
        path: AppRoutes.products,
        builder: (_, state) {
          final q = state.uri.queryParameters;
          return WithCartFab(
            child: ProductListScreen(
              key: ValueKey(state.uri.toString()),
              initialQuery: ProductQuery(
                q: q['q'],
                category: q['category'] ?? 'all',
                brand: q['brand'],
              ),
              brandName: q['brandName'],
              focusSearch: q['focus'] == '1',
            ),
          );
        },
      ),
      GoRoute(
        path: '/product/:id',
        builder: (_, state) =>
            ProductDetailScreen(productId: state.pathParameters['id']!),
      ),
      GoRoute(path: AppRoutes.brands, builder: (_, _) => const BrandsScreen()),
      GoRoute(
        path: AppRoutes.stores,
        builder: (_, _) => const StoresScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (_, state) =>
                VendorStoreScreen(vendorId: state.pathParameters['id']!),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.wishlist,
        builder: (_, _) => const WishlistScreen(),
      ),
      GoRoute(path: AppRoutes.cart, builder: (_, _) => const CartScreen()),
      GoRoute(
        path: AppRoutes.checkout,
        builder: (_, _) => const CheckoutScreen(),
      ),
      GoRoute(
        path: '/order/:number',
        builder: (_, state) =>
            OrderDetailScreen(number: state.pathParameters['number']!),
        routes: [
          GoRoute(
            path: 'track',
            builder: (_, state) =>
                TrackOrderScreen(number: state.pathParameters['number']!),
          ),
        ],
      ),
      GoRoute(
        path: '/reward/:id',
        builder: (_, state) =>
            RewardDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: AppRoutes.memberCoupons,
        builder: (_, _) => const MemberCouponsScreen(),
      ),
      GoRoute(
        path: AppRoutes.points,
        builder: (_, _) => const PointsScreen(),
        routes: [
          GoRoute(path: 'transfer', builder: (_, _) => const TransferScreen()),
          GoRoute(path: 'top-up', builder: (_, _) => const TopUpScreen()),
        ],
      ),
      GoRoute(
        path: AppRoutes.tiers,
        builder: (_, _) => const TierBenefitsScreen(),
      ),
      GoRoute(
        path: AppRoutes.warranty,
        builder: (_, _) => const WarrantyScreen(),
      ),
      GoRoute(
        path: AppRoutes.findStore,
        builder: (_, _) => const FindStoreScreen(),
      ),
      GoRoute(
        path: AppRoutes.repairs,
        builder: (_, _) => const RepairsScreen(),
      ),
      GoRoute(
        path: AppRoutes.account,
        builder: (_, _) => const AccountScreen(),
      ),
      GoRoute(
        path: AppRoutes.paymentMethods,
        builder: (_, _) => const PaymentMethodsScreen(),
      ),
      GoRoute(path: AppRoutes.about, builder: (_, _) => const AboutScreen()),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (_, _) => const NotificationsScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (_, state) =>
                NotificationDetailScreen(id: state.pathParameters['id']!),
          ),
        ],
      ),
      GoRoute(
        path: '/content/:slug',
        builder: (_, state) =>
            ContentPageScreen(slug: state.pathParameters['slug']!),
      ),
      // Indexed stack: each tab keeps its own navigation stack and state.
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => WithCartFab(
          child: AdaptiveShell(
            destinations: shellDestinations,
            selectedIndex: shell.currentIndex,
            onSelect: (i) =>
                shell.goBranch(i, initialLocation: i == shell.currentIndex),
            body: shell,
            onSearch: () => context.push(AppRoutes.browse(focusSearch: true)),
          ),
        ),
        branches: [
          branch(AppRoutes.home, const HomeScreen()),
          branch(AppRoutes.orders, const OrdersScreen()),
          branch(AppRoutes.rewards, const RewardsScreen()),
          branch(AppRoutes.support, const SupportScreen()),
          branch(AppRoutes.profile, const ProfileScreen()),
        ],
      ),
    ],
  );
  ref.onDispose(() {
    router.dispose();
    refresh.dispose();
  });
  return router;
}
