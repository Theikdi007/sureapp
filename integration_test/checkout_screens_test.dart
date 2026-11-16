// Screenshots the catalog screens (signed in, mock flavor).
//
//   flutter drive --driver=test_driver/screenshot_driver.dart \
//     --target=integration_test/catalog_screens_test.dart -d <device>

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sure_app/app.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/core/router/app_router.dart';
import 'package:sure_app/design_system/components/sheet_components.dart';

import '../test/support/mock_overrides.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> settle(WidgetTester tester, [int ms = 1500]) async {
    for (var i = 0; i < ms ~/ 250; i++) {
      await tester.pump(const Duration(milliseconds: 250));
    }
  }

  testWidgets('checkout', (tester) async {
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

    Future<void> tapText(String t) async {
      await tester.tap(find.text(t).last);
      await settle(tester, 1500);
    }

    // Add to bag from Home → bag sheet.
    await tester.drag(find.byType(Scrollable).first, const Offset(0, -900));
    await settle(tester);
    await tester.tap(find.text('Add to bag').first);
    await settle(tester, 1500);
    await binding.takeScreenshot('cart_sheet');
    await tapText('Checkout');
    await settle(tester, 1500);
    await binding.takeScreenshot('co_0');
    await tester.tap(find.byType(SureSwitch).first);
    await settle(tester, 1500);
    await tester.drag(find.byType(Scrollable).first, const Offset(0, -500));
    await settle(tester);
    await binding.takeScreenshot('co_1');
    await tester.drag(find.byType(Scrollable).first, const Offset(0, -1500));
    await settle(tester);
    await binding.takeScreenshot('co_bottom');
    await tester.drag(find.byType(Scrollable).first, const Offset(0, 1000));
    await settle(tester);
    await tester.drag(find.byType(Scrollable).first, const Offset(0, 500));
    await settle(tester);
    await tapText('Change');
    await binding.takeScreenshot('co_loc');
    await tapText('Office');
    await tapText('Pick up');
    await binding.takeScreenshot('co_pickup');
    await tester.drag(find.byType(Scrollable).first, const Offset(0, -1500));
    await settle(tester);
    await binding.takeScreenshot('co_pickup2');
    await tester.drag(find.byType(Scrollable).first, const Offset(0, 1500));
    await settle(tester);
    await tapText('Delivery');
    await tapText('Place Order');
    await settle(tester, 1500);
    await binding.takeScreenshot('co_placed');
    await tapText('Track order');
    await binding.takeScreenshot('after_order');

    // Bag page with one item.
    router.push(AppRoutes.product('VG-IPH-17P'));
    await settle(tester, 2500);
    await tapText('Add to Cart');
    await binding.takeScreenshot('pdp_added_sheet');
    await tester.tapAt(const Offset(200, 80));
    await settle(tester);
    router.push(AppRoutes.cart);
    await settle(tester, 1500);
    await binding.takeScreenshot('cart_page');
    await settle(tester, 3000);
  });
}
