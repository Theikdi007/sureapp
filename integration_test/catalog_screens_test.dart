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
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sure_app/app.dart';
import 'package:sure_app/core/config/app_config.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/core/router/app_router.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> settle(WidgetTester tester, [int ms = 1500]) async {
    for (var i = 0; i < ms ~/ 250; i++) {
      await tester.pump(const Duration(milliseconds: 250));
    }
  }

  testWidgets('catalog', (tester) async {
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
    await settle(tester, 3000);
    final router = ProviderScope.containerOf(
      tester.element(find.byType(SureApp)),
    ).read(appRouterProvider);

    Future<void> scrollShots(String name, int count) async {
      await binding.takeScreenshot('${name}_0');
      for (var i = 1; i < count; i++) {
        await tester.drag(find.byType(Scrollable).first, const Offset(0, -600));
        await settle(tester, 1000);
        await binding.takeScreenshot('${name}_$i');
      }
    }

    // Browse: deals, with the filter panel open.
    router.push(AppRoutes.browse(category: 'on_sale'));
    await settle(tester, 2500);
    await binding.takeScreenshot('plp_0');
    await tester.tap(find.byIcon(LucideIcons.slidersHorizontal).last);
    await settle(tester);
    await binding.takeScreenshot('plp_filter');
    router.pop();
    await settle(tester);

    // Product detail.
    router.push(AppRoutes.product('VG-WATCH-3'));
    await settle(tester, 3000);
    await scrollShots('pdp', 5);
    router.pop();
    await settle(tester);

    router.push(AppRoutes.stores);
    await settle(tester);
    await binding.takeScreenshot('stores');
    router.push(AppRoutes.store('isure'));
    await settle(tester, 2500);
    await binding.takeScreenshot('vendor');
    await tester.tap(find.text('Store Rating').last);
    await settle(tester, 2000);
    await binding.takeScreenshot('vendor_rating');
    await tester.tapAt(const Offset(200, 60));
    await settle(tester);
    router.pop();
    router.pop();
    await settle(tester);

    router.push(AppRoutes.brands);
    await settle(tester, 2500);
    await binding.takeScreenshot('brands');
    router.push(AppRoutes.browse(brand: 'anker', brandName: 'Anker'));
    await settle(tester, 2000);
    await binding.takeScreenshot('brand_empty');
    router.pop();
    router.pop();
    await settle(tester);

    router.push(AppRoutes.wishlist);
    await settle(tester, 2000);
    await binding.takeScreenshot('wishlist');
    await settle(tester, 3000);
  });
}
