// Walks the sign-in screens in the mock flavor and screenshots each one, to
// compare against the prototype.
//
//   flutter drive --driver=test_driver/screenshot_driver.dart \
//     --target=integration_test/auth_screens_test.dart -d <device>
//
// Screenshots land in build/screenshots/.

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
import 'package:sure_app/features/auth/data/auth_repository.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> shot(WidgetTester tester, String name) async {
    await tester.pumpAndSettle();
    await binding.takeScreenshot(name);
  }

  Future<void> typeDigits(WidgetTester tester, String digits) async {
    for (final d in digits.split('')) {
      await tester.tap(find.bySemanticsLabel(d).last);
      await tester.pump(const Duration(milliseconds: 50));
    }
    await tester.pumpAndSettle();
  }

  Future<void> tapLabel(WidgetTester tester, String label) async {
    await tester.tap(find.bySemanticsLabel(label).last);
    await tester.pumpAndSettle();
  }

  testWidgets('sign-in screens', (tester) async {
    // Start clean: no session, onboarding not seen.
    await const FlutterSecureStorage().deleteAll();
    final caps = await DeviceCaps.load();
    if (Platform.isAndroid) await binding.convertFlutterSurfaceToImage();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(
            const AppConfig(flavor: AppFlavor.mock, apiBaseUrl: ''),
          ),
          deviceCapsProvider.overrideWithValue(caps),
          authRepositoryProvider.overrideWithValue(
            MockAuthRepository(latency: const Duration(milliseconds: 100)),
          ),
        ],
        child: const SureApp(),
      ),
    );
    // Let onboarding images load.
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
    await shot(tester, 'ob1');
    await tapLabel(tester, 'Next');
    await tester.pump(const Duration(seconds: 2));
    await shot(tester, 'ob2');
    await tapLabel(tester, 'Next');
    await tapLabel(tester, 'Next');
    await tester.pump(const Duration(seconds: 2));
    await shot(tester, 'ob4');
    await tapLabel(tester, 'Get Started');

    await shot(tester, 'login_empty');
    await typeDigits(tester, '9776234118');
    await shot(tester, 'login_filled');
    await tapLabel(tester, 'Continue');
    await shot(tester, 'pwd_login');

    await tapLabel(tester, 'Forgot password?');
    await shot(tester, 'forgot_otp');
    await tester.pump(const Duration(seconds: 3)); // toast gone

    // Back to login, new member path.
    await tapLabel(tester, 'Back');
    for (var i = 0; i < 10; i++) {
      await tester.tap(find.bySemanticsLabel('Delete').last);
      await tester.pump();
    }
    await typeDigits(tester, '9791234567');
    await tapLabel(tester, 'Continue');
    await typeDigits(tester, '482');
    await shot(tester, 'otp_partial');
    await typeDigits(tester, '123');
    // Wrong code: error state.
    await tester.pump(const Duration(seconds: 1));
    await shot(tester, 'otp_error');
    await typeDigits(tester, '123456');
    await tester.pump(const Duration(seconds: 1));
    await shot(tester, 'pwd_new');

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'sure2026y');
    await tester.enterText(fields.at(1), 'sure2026y');
    FocusManager.instance.primaryFocus?.unfocus();
    await shot(tester, 'pwd_new_filled');
    await tapLabel(tester, 'Create password');
    await tester.pump(const Duration(milliseconds: 500));
    await shot(tester, 'home');
    await tester.pump(const Duration(seconds: 3));
  });
}
