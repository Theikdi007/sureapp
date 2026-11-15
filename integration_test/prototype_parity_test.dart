// Screenshots every signed-in screen (mock flavor) with the same names the
// prototype capture uses, so each pair can be compared side by side.
// Sign-in screens come from auth_screens_test.dart.
//
//   flutter drive --driver=test_driver/screenshot_driver.dart \
//     --target=integration_test/prototype_parity_test.dart -d <device>
//
// Screenshots land in build/screenshots/<screen>_<n>.png (n = scroll step).

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sure_app/app.dart';
import 'package:sure_app/core/config/app_config.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/core/router/app_router.dart';
import 'package:sure_app/features/catalog/data/catalog_repository.dart';
import 'package:sure_app/features/catalog/data/wishlist_repository.dart';
import 'package:sure_app/features/catalog/presentation/shop_state.dart';
import 'package:sure_app/features/notifications/data/notifications_repository.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('prototype parity', (tester) async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    await storage.write(key: 'app.onboarding_done', value: 'true');
    await storage.write(key: 'auth.access_token', value: 'mock-access');
    await storage.write(key: 'auth.refresh_token', value: 'mock-refresh');
    await storage.write(
      key: 'auth.member',
      value: jsonEncode({
        'memberId': 'mock',
        'name': 'Thiri Aung',
        'phone': '+959776234118',
        'phoneDisplay': '+95 9 776 234 118',
        'tier': 'exclusive',
        'tierLabel': 'Exclusive',
      }),
    );
    final caps = await DeviceCaps.load();
    if (Platform.isAndroid) await binding.convertFlutterSurfaceToImage();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(
            const AppConfig(flavor: AppFlavor.mock, apiBaseUrl: ''),
          ),
          deviceCapsProvider.overrideWithValue(caps),
        ],
        child: const SureApp(),
      ),
    );
    await tester.pumpAndSettle();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(SureApp)),
    );
    final GoRouter router = container.read(appRouterProvider);
    final catalog = container.read(catalogRepositoryProvider);
    final products = (await catalog.search(const ProductQuery())).items;
    final vendors = await catalog.vendors();
    final notifs = await container
        .read(notificationsRepositoryProvider)
        .list(NotificationTab.all);
    final wishlist = container.read(wishlistRepositoryProvider);
    for (final p in products.take(2)) {
      await wishlist.add(p.id);
    }

    Future<void> settle() async {
      for (var i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 300));
      }
    }

    Future<void> capture(String name, String location) async {
      router.go(location);
      await settle();
      await binding.takeScreenshot('${name}_0');
      final scrollables = find.byType(Scrollable);
      if (scrollables.evaluate().isEmpty) return;
      for (var i = 1; i <= 2; i++) {
        await tester.drag(scrollables.first, const Offset(0, -640),
            warnIfMissed: false);
        await settle();
        await binding.takeScreenshot('${name}_$i');
      }
    }

    await capture('home', AppRoutes.home);
    await capture('orders', AppRoutes.orders);
    await capture('rewards', AppRoutes.rewards);
    await capture('support', AppRoutes.support);
    await capture('profile', AppRoutes.profile);
    await capture('product_list', AppRoutes.products);
    await capture('product_detail', AppRoutes.product(products.first.id));
    await capture('brands', AppRoutes.brands);
    await capture('vendors', AppRoutes.stores);
    await capture('vendor', AppRoutes.store(vendors.first.id));
    await capture('wishlist', AppRoutes.wishlist);

    // Through the bag notifier so the cached bag state sees the items.
    final bag = container.read(bagProvider.notifier);
    for (final p in products.take(2)) {
      await bag.add(productId: p.id, key: IdempotencyKey.generate());
    }
    await capture('cart', AppRoutes.cart);
    await capture('checkout', AppRoutes.checkout);
    await capture('order_detail', AppRoutes.order('APP-26-1046'));
    await capture('track', AppRoutes.track('APP-26-1046'));
    await capture('points', AppRoutes.points);
    await capture('tiers', AppRoutes.tiers);
    await capture('transfer', AppRoutes.transfer);
    await capture('top_up', AppRoutes.topUp);
    await capture('member_coupons', AppRoutes.memberCoupons);
    await capture('reward_detail', AppRoutes.reward('rw1'));
    await capture('warranty', AppRoutes.warranty);
    await capture('find_store', AppRoutes.findStore);
    await capture('account', AppRoutes.account);
    await capture('payment_methods', AppRoutes.paymentMethods);
    await capture('about', AppRoutes.about);
    await capture('notifications', AppRoutes.notifications);
    if (notifs.items.isNotEmpty) {
      await capture(
        'notification_detail',
        AppRoutes.notification(notifs.items.first.id),
      );
    }
  });
}
