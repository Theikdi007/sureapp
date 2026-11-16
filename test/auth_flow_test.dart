import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/app.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/design_system/components/glass_nav_bar.dart';

import 'support/mock_overrides.dart';

const _caps = DeviceCaps(
  platform: 'ios',
  osMajorVersion: 26,
  deviceName: 'test',
  appVersion: '1.0.0',
  isLowRamDevice: false,
  reduceTransparency: false,
);

Future<void> pumpApp(WidgetTester tester) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = const Size(400, 860);
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        ...mockOverrides(),
        deviceCapsProvider.overrideWithValue(_caps),
      ],
      child: const SureApp(),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> tapButton(WidgetTester tester, String label) async {
  await tester.tap(find.bySemanticsLabel(label).last);
  await tester.pumpAndSettle();
}

/// Types on the on-screen number pad.
Future<void> typeDigits(WidgetTester tester, String digits) async {
  for (final d in digits.split('')) {
    await tester.tap(find.bySemanticsLabel(d).last);
    await tester.pump();
  }
  await tester.pump(const Duration(milliseconds: 500));
  await tester.pumpAndSettle();
}

void main() {
  setUp(() {
    // Onboarding already seen; no stored session.
    FlutterSecureStorage.setMockInitialValues({'app.onboarding_done': 'true'});
  });

  testWidgets('returning member: phone → password → home → sign out', (
    tester,
  ) async {
    await pumpApp(tester);
    expect(find.text('Log in with your phone'), findsOneWidget);

    await typeDigits(tester, '9776234118');
    expect(find.text('9 776 234 118'), findsOneWidget);
    await tapButton(tester, 'Continue');

    expect(find.text('Welcome back'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'wrong-pass');
    await tester.pump();
    await tapButton(tester, 'Log in');
    expect(find.text('Incorrect password. Try again.'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'sure2026x');
    await tester.pump();
    await tapButton(tester, 'Log in');
    expect(find.byType(GlassNavBar), findsOneWidget);

    // Profile tab shows the member and signs out.
    await tester.tap(find.bySemanticsLabel('Profile').last);
    await tester.pumpAndSettle();
    expect(find.text('Thiri Aung'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Log out'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    await tapButton(tester, 'Log out');
    await tester.tap(find.widgetWithText(TextButton, 'Log out').last);
    await tester.pumpAndSettle();
    expect(find.text('Log in with your phone'), findsOneWidget);
  });

  testWidgets('new member: phone → OTP → create password → home', (
    tester,
  ) async {
    await pumpApp(tester);
    await typeDigits(tester, '9791234567');
    await tapButton(tester, 'Continue');

    expect(find.text('Verify your number'), findsOneWidget);
    await typeDigits(tester, '111111');
    expect(
      find.text("That code isn't right. Check the SMS and try again."),
      findsOneWidget,
    );

    await typeDigits(tester, '123456');
    expect(find.text('Create a password'), findsWidgets);

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'sure2026y');
    await tester.enterText(fields.at(1), 'sure2026y');
    await tester.pump();
    await tapButton(tester, 'Create password');
    expect(find.byType(GlassNavBar), findsOneWidget);
    expect(find.textContaining('Password created'), findsOneWidget);
    // Let the toast time out.
    await tester.pump(const Duration(seconds: 3));
  });
}
