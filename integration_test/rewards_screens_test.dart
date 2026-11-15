// Screenshots the rewards and loyalty screens (signed in, mock flavor).
//
//   flutter drive --driver=test_driver/screenshot_driver.dart \
//     --target=integration_test/rewards_screens_test.dart -d <device>

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
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

  testWidgets('rewards', (tester) async {
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

    Future<void> tapText(String t, [int ms = 1500]) async {
      await tester.tap(find.text(t).last);
      await settle(tester, ms);
    }

    Future<void> shot(String name) => binding.takeScreenshot(name);

    Future<void> scrollBy(double dy) async {
      final size = tester.view.physicalSize / tester.view.devicePixelRatio;
      await tester.dragFrom(
        Offset(size.width / 2, size.height * 0.7),
        Offset(0, -dy),
      );
      await settle(tester, 1000);
    }

    Future<void> closeSheet() async {
      Navigator.of(tester.element(find.byType(BottomSheet).last)).pop();
      await settle(tester, 1000);
    }

    router.go(AppRoutes.rewards);
    await settle(tester, 2000);
    await shot('rw_0');
    await scrollBy(560);
    await shot('rw_1');
    await scrollBy(600);
    await shot('rw_2');

    router.push(AppRoutes.reward('rw1'));
    await settle(tester, 2000);
    await shot('rd_0');
    await scrollBy(500);
    await shot('rd_1');
    await tapText('Redeem Code', 2000);
    await shot('rc_code');
    await tapText('Done');
    await shot('rd_claimed');
    router.pop();
    await settle(tester);

    router.push(AppRoutes.reward('rw5'));
    await settle(tester, 2000);
    await tapText('Claim Now');
    await shot('rc_method');
    await tapText('Continue', 2000);
    await shot('rc_direct');
    await tapText('Done');
    router.pop();
    await settle(tester);

    router.push(AppRoutes.reward('rw8'));
    await settle(tester, 2000);
    await shot('rd_engrave');
    router.pop();
    await settle(tester);

    router.push(AppRoutes.memberCoupons);
    await settle(tester, 2000);
    await tapText('Copy');
    await shot('coupons');
    router.pop();
    await settle(tester);

    router.push(AppRoutes.points);
    await settle(tester, 2000);
    await shot('pts_0');
    await scrollBy(500);
    await shot('pts_1');
    await tester.tap(find.textContaining('Order reward').first);
    await settle(tester, 2000);
    await shot('pts_txn');
    await closeSheet();
    await tapText('Club Score');
    await shot('pts_club');
    await scrollBy(-1200);
    await tapText('Pay in store', 2500);
    await shot('pay_qr');
    await closeSheet();

    router.push(AppRoutes.transfer);
    await settle(tester, 1500);
    await tester.enterText(find.byType(EditableText).first, '09450012345');
    await tapText('1,000');
    FocusManager.instance.primaryFocus?.unfocus();
    await settle(tester);
    await shot('tr_0');
    await tapText('Transfer', 2000);
    await shot('tr_confirm');
    await closeSheet();
    router.pop();
    await settle(tester);

    router.push(AppRoutes.topUp);
    await settle(tester, 1500);
    await tester.enterText(find.byType(EditableText).first, 'SURE-7K2P-QX');
    FocusManager.instance.primaryFocus?.unfocus();
    await settle(tester);
    await tapText('Check code', 750);
    await shot('topup');
    router.pop();
    await settle(tester);

    router.push(AppRoutes.tiers);
    await settle(tester, 2000);
    await shot('tiers_0');
    await scrollBy(500);
    await shot('tiers_1');
  });
}
