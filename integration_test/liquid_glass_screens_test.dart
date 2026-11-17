// Screenshots the iOS 26 Liquid Glass controls (signed in, mock data):
// pinned glass headers, glass tabs, bottom bars, sheets, toast, dialog.
// Run on an iOS 26+ simulator or device:
//
//   flutter drive --driver=test_driver/screenshot_driver.dart \
//     --target=integration_test/liquid_glass_screens_test.dart -d <device>

import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sure_app/app.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/core/router/app_router.dart';

import '../test/support/mock_overrides.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> settle(WidgetTester tester, [int ms = 1500]) async {
    for (var i = 0; i < ms ~/ 250; i++) {
      await tester.pump(const Duration(milliseconds: 250));
    }
  }

  testWidgets('liquid glass', (tester) async {
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
          ...mockOverrides(),
          deviceCapsProvider.overrideWithValue(caps),
        ],
        child: const SureApp(),
      ),
    );
    await settle(tester, 3000);
    final router = ProviderScope.containerOf(
      tester.element(find.byType(SureApp)),
    ).read(appRouterProvider);
    final size = tester.view.physicalSize / tester.view.devicePixelRatio;

    Future<void> scrollUp([double by = 500]) async {
      await tester.dragFrom(
        Offset(size.width / 2, size.height * 0.65),
        Offset(0, -by),
      );
      await settle(tester, 1000);
    }

    Future<void> reveal(String t) async {
      for (var i = 0; i < 12; i++) {
        final f = find.text(t).hitTestable();
        if (f.evaluate().isNotEmpty &&
            tester.getCenter(f.last).dy < size.height - 160) {
          return;
        }
        await scrollUp(300);
      }
    }

    // Orders: pinned glass header with glass tabs; rows scroll under it.
    router.go(AppRoutes.orders);
    await settle(tester, 2000);
    await binding.takeScreenshot('lg_orders');
    await scrollUp(260);
    await binding.takeScreenshot('lg_orders_scrolled');

    // Notifications: header + tab capsule.
    router.push(AppRoutes.notifications);
    await settle(tester, 2000);
    await scrollUp(200);
    await binding.takeScreenshot('lg_notifications');
    router.pop();
    await settle(tester);

    // Product: glass buy bar over the content.
    router.push(AppRoutes.product('VG-IPH-17P'));
    await settle(tester, 2500);
    await scrollUp(700);
    await binding.takeScreenshot('lg_product');
    await tester.tap(find.text('Add to Cart').last);
    await settle(tester, 2000);
    await binding.takeScreenshot('lg_cart_sheet');
    await tester.tapAt(Offset(size.width / 2, 120));
    await settle(tester);
    router.pop();
    await settle(tester);

    // Checkout: glass header, Delivery / Pick up capsule, glass Place bar.
    router.push(AppRoutes.checkout);
    await settle(tester, 2500);
    await binding.takeScreenshot('lg_checkout');
    await scrollUp(500);
    await binding.takeScreenshot('lg_checkout_scrolled');
    router.pop();
    await settle(tester);

    // Profile: glass toast (Language) and glass dialog (Log out).
    router.go(AppRoutes.profile);
    await settle(tester, 2000);
    await reveal('Language');
    await tester.tap(find.text('Language').last);
    await settle(tester, 1000);
    await binding.takeScreenshot('lg_toast');
    await settle(tester, 3000);
    await reveal('Log out');
    await tester.tap(find.text('Log out').last);
    await settle(tester);
    await binding.takeScreenshot('lg_dialog');
    await tester.tap(find.text('Cancel').last);
    await settle(tester);

    // Home: glass status strip over scrolled content.
    router.go(AppRoutes.home);
    await settle(tester, 2000);
    await scrollUp(250);
    await binding.takeScreenshot('lg_tier_card');
    await scrollUp(150);
    await binding.takeScreenshot('lg_home');
  });
}
