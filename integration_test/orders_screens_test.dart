// Screenshots the orders screens (signed in, mock flavor).
//
//   flutter drive --driver=test_driver/screenshot_driver.dart \
//     --target=integration_test/orders_screens_test.dart -d <device>

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
import 'package:sure_app/design_system/components/order_components.dart';

import '../test/support/mock_overrides.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> settle(WidgetTester tester, [int ms = 1500]) async {
    for (var i = 0; i < ms ~/ 250; i++) {
      await tester.pump(const Duration(milliseconds: 250));
    }
  }

  testWidgets('orders', (tester) async {
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

    router.go(AppRoutes.orders);
    await settle(tester, 2000);
    await binding.takeScreenshot('ord_0');
    await tapText('Unfulfilled');
    await binding.takeScreenshot('ord_1');
    await tapText('Fulfilled');
    await binding.takeScreenshot('ord_2');
    await tapText('Home Setup');
    await binding.takeScreenshot('ord_hs');
    await tapText('All');

    router.push(AppRoutes.order('APP-26-1046'));
    await settle(tester, 2000);
    await binding.takeScreenshot('od_0');
    await tester.drag(find.byType(Scrollable).last, const Offset(0, -700));
    await settle(tester);
    await binding.takeScreenshot('od_1');
    await tapText('Track Order');
    await binding.takeScreenshot('track_0');
    router.pop();
    await settle(tester);
    router.pop();
    await settle(tester);

    router.push(AppRoutes.order('APP-26-1044'));
    await settle(tester, 2000);
    await binding.takeScreenshot('od_hs0');
    await tester.drag(find.byType(Scrollable).last, const Offset(0, -900));
    await settle(tester);
    await binding.takeScreenshot('od_hs1');
    router.pop();
    await settle(tester);

    router.push(AppRoutes.order('APP-26-1039'));
    await settle(tester, 2000);
    await binding.takeScreenshot('od_del0');
    await tester.drag(find.byType(Scrollable).last, const Offset(0, -1200));
    await settle(tester);
    await tapText('Give Feedback');
    await tester.drag(find.byType(Scrollable).last, const Offset(0, -600));
    await settle(tester);
    await binding.takeScreenshot('od_del1');
    router.pop();
    await settle(tester);

    router.push(AppRoutes.product('VG-IPH-17P'));
    await settle(tester, 2500);
    Future<void> reveal(String t) async {
      final size = tester.view.physicalSize / tester.view.devicePixelRatio;
      for (var i = 0; i < 12; i++) {
        final f = find.text(t).hitTestable();
        if (f.evaluate().isNotEmpty &&
            tester.getCenter(f.last).dy < size.height - 160) {
          return;
        }
        await tester.dragFrom(
          Offset(size.width / 2, size.height * 0.6),
          const Offset(0, -300),
        );
        await settle(tester, 750);
      }
    }

    await reveal('Home Setup Service');
    await tapText('Home Setup Service');
    await reveal('Schedule home visit');
    await binding.takeScreenshot('pdp_hs');
    await tapText('Schedule home visit');
    await settle(tester, 2000);
    await tester.tap(find.byType(CalendarCell).at(1));
    await settle(tester);
    await tapText('13:00 – 16:00');
    await binding.takeScreenshot('hs_sheet');
  });
}
