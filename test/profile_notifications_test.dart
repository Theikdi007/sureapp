import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/design_system/components/sheet_components.dart';
import 'package:sure_app/design_system/theme/app_theme.dart';
import 'package:sure_app/features/notifications/presentation/notifications_screen.dart';
import 'package:sure_app/features/profile/data/profile_repository.dart';
import 'package:sure_app/features/profile/presentation/payment_methods_screen.dart';

import 'support/mock_overrides.dart';

const _caps = DeviceCaps(
  platform: 'ios',
  osMajorVersion: 18,
  deviceName: 'test',
  appVersion: '1.0.0',
  isLowRamDevice: false,
  reduceTransparency: true,
);

Widget _app({required Widget home, List<RouteBase> routes = const []}) {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => home),
      ...routes,
    ],
  );
  return ProviderScope(
    overrides: [
      ...mockOverrides(),
      deviceCapsProvider.overrideWithValue(_caps),
    ],
    child: MaterialApp.router(theme: AppTheme.light(), routerConfig: router),
  );
}

void _phone(WidgetTester tester) {
  tester.view.physicalSize = const Size(400, 900);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

void main() {
  test('password errors land on their fields', () async {
    final repo = MockProfileRepository(latency: Duration.zero);
    Future<String?> field(String cur, String next, String confirm) async {
      try {
        await repo.changePassword(
          currentPassword: cur,
          newPassword: next,
          confirm: confirm,
        );
        return 'ok';
      } on ApiException catch (e) {
        return e.errors.single.field;
      }
    }

    expect(await field('wrong', 'abc12345', 'abc12345'), 'currentPassword');
    expect(await field('sure2026', 'short', 'short'), 'newPassword');
    expect(await field('sure2026', 'abc12345', 'abc12346'), 'confirm');
    expect(await field('sure2026', 'abc12345', 'abc12345'), 'ok');
  });

  test('addresses: one add per key, and the last one stays', () async {
    final repo = MockProfileRepository(latency: Duration.zero);
    const req = AddressRequest(
      label: 'Mum',
      line1: 'No. 3, Inya Road',
      township: 'Kamayut',
    );
    final key = IdempotencyKey.generate();
    final a = await repo.addAddress(req, key: key);
    final b = await repo.addAddress(req, key: key);
    expect(a.id, b.id);

    final all = await repo.addresses();
    expect(all, hasLength(3));
    for (final x in all.skip(1)) {
      await repo.deleteAddress(x.id);
    }
    await expectLater(
      repo.deleteAddress(all.first.id),
      throwsA(
        isA<ApiException>().having(
          (e) => e.code,
          'code',
          'mobile.last_address',
        ),
      ),
    );
  });

  test('notification times read naturally in Myanmar time', () {
    final now = DateTime.utc(2026, 11, 13, 6);
    expect(notificationTime('2026-11-13T05:59:40+00:00', now: now), 'Just now');
    expect(notificationTime('2026-11-13T03:00:00+00:00', now: now), '3h ago');
    // Over a day old, and 11:30 on 12 Nov in Yangon: yesterday.
    expect(
      notificationTime('2026-11-12T05:00:00+00:00', now: now),
      'Yesterday',
    );
    expect(notificationTime('2026-11-02T10:00:00+00:00', now: now), '2 Nov');
  });

  testWidgets('payment methods: pick a new default; QR is not live', (
    tester,
  ) async {
    _phone(tester);
    await tester.pumpWidget(_app(home: const PaymentMethodsScreen()));
    await tester.pumpAndSettle();

    SelectRow row(String title) => tester.widget<SelectRow>(
      find.ancestor(of: find.text(title), matching: find.byType(SelectRow)),
    );
    expect(row('Cash on delivery').selected, isTrue);
    expect(row('QR Payment').enabled, isFalse);

    await tester.tap(find.text('Pay at pickup'));
    await tester.pumpAndSettle();
    expect(row('Pay at pickup').selected, isTrue);
    expect(row('Cash on delivery').selected, isFalse);
  });

  testWidgets('notifications: open one, follow its link, come back read', (
    tester,
  ) async {
    _phone(tester);
    await tester.pumpWidget(
      _app(
        home: const NotificationsScreen(),
        routes: [
          GoRoute(
            path: '/notifications/:id',
            builder: (_, s) =>
                NotificationDetailScreen(id: s.pathParameters['id']!),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Your order is on its way'), findsOneWidget);

    // Updates tab only has the flash-deal notice.
    await tester.tap(find.text('Updates'));
    await tester.pumpAndSettle();
    expect(find.text('Flash deals are live'), findsOneWidget);
    expect(find.text('Your order is on its way'), findsNothing);

    await tester.tap(find.text('All'));
    await tester.pumpAndSettle();
    expect(
      find.bySemanticsLabel(RegExp('^Unread. Your order is on its way')),
      findsOneWidget,
    );
    await tester.tap(find.text('Your order is on its way'));
    await tester.pumpAndSettle();
    expect(find.text('Track this order'), findsOneWidget);

    await tester.tap(find.bySemanticsLabel('Back'));
    await tester.pumpAndSettle();
    expect(
      find.bySemanticsLabel(RegExp('^Unread. Your order is on its way')),
      findsNothing,
    );
  });
}
