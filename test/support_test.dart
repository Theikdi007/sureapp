import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/config/app_config.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/design_system/theme/app_theme.dart';
import 'package:sure_app/features/app_config/data/app_config_repository.dart';
import 'package:sure_app/features/repairs/data/repairs_repository.dart';
import 'package:sure_app/features/stores/data/stores_repository.dart';
import 'package:sure_app/features/stores/presentation/find_store_screen.dart';
import 'package:sure_app/features/support/presentation/support_screen.dart';
import 'package:sure_app/features/warranty/data/warranty_repository.dart';
import 'package:sure_app/features/warranty/presentation/warranty_screen.dart';

const _caps = DeviceCaps(
  platform: 'ios',
  osMajorVersion: 18,
  deviceName: 'test',
  appVersion: '1.0.0',
  isLowRamDevice: false,
  reduceTransparency: true,
);

Widget _app(Widget home, {Size size = const Size(400, 900)}) => ProviderScope(
  overrides: [
    appConfigProvider.overrideWithValue(
      const AppConfig(flavor: AppFlavor.mock, apiBaseUrl: ''),
    ),
    deviceCapsProvider.overrideWithValue(_caps),
    remoteAppConfigProvider.overrideWith(
      (ref) => MockAppConfigRepository().fetch(),
    ),
    repairsRepositoryProvider.overrideWithValue(
      MockRepairsRepository(latency: Duration.zero),
    ),
    storesRepositoryProvider.overrideWithValue(
      MockStoresRepository(latency: Duration.zero),
    ),
    warrantyRepositoryProvider.overrideWithValue(
      MockWarrantyRepository(latency: Duration.zero),
    ),
  ],
  child: MediaQuery(
    data: MediaQueryData(size: size),
    child: MaterialApp(theme: AppTheme.light(), home: home),
  ),
);

void _phone(WidgetTester tester) {
  tester.view.physicalSize = const Size(400, 900);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

void main() {
  test('repair states map to the design system badges', () {
    expect(RepairState.parse('in_progress'), RepairState.inProgress);
    expect(RepairState.parse('ready').color, 'positive');
    expect(RepairState.parse('done').color, 'neutral');
    expect(RepairState.parse('something_new'), RepairState.booked);
  });

  test('claim photos: only JPEG, PNG and WebP', () {
    expect(UploadPhoto.mimeFor('a.JPG'), 'image/jpeg');
    expect(UploadPhoto.mimeFor('a.webp'), 'image/webp');
    expect(UploadPhoto.mimeFor('a.heic'), isNull);
  });

  test('filing a claim is idempotent and rejects expired plans', () async {
    final repo = MockWarrantyRepository(latency: Duration.zero);
    final before = (await repo.claims()).length;
    final key = IdempotencyKey.generate();
    final a = await repo.fileClaim(
      planId: 'shop:356789104455120:0',
      description: 'Screen flickers after an hour of use.',
      key: key,
    );
    final b = await repo.fileClaim(
      planId: 'shop:356789104455120:0',
      description: 'Screen flickers after an hour of use.',
      key: key,
    );
    expect(a.number, b.number);
    expect((await repo.claims()).length, before + 1);

    await expectLater(
      repo.fileClaim(
        planId: 'xtraguard:550100168:0',
        description: 'Adapter stopped charging.',
        key: IdempotencyKey.generate(),
      ),
      throwsA(
        isA<ApiException>().having(
          (e) => e.fieldMessage('planId'),
          'planId error',
          isNotNull,
        ),
      ),
    );
  });

  testWidgets('support tab shows the call card and active repairs only', (
    tester,
  ) async {
    _phone(tester);
    await tester.pumpWidget(_app(const SupportScreen()));
    // The mock app-config answers after 400 ms (the splash waits for it).
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();
    expect(find.text('Call 09 750 066 391'), findsOneWidget);
    expect(find.text('TechVault Warranty'), findsOneWidget);
    expect(find.text('Oppo A78 256GB · Green'), findsOneWidget);
    // Collected repairs are not in the tracker.
    expect(find.text('Apple AirPods Pro (2nd gen)'), findsNothing);
  });

  testWidgets('warranty: submit needs 10 characters, then files the claim', (
    tester,
  ) async {
    _phone(tester);
    await tester.pumpWidget(_app(const WarrantyScreen()));
    await tester.pumpAndSettle();

    // The one active plan is preselected; expired plans aren't offered.
    expect(find.text('Submit Claim'), findsOneWidget);
    final field = find.byType(EditableText);
    await tester.enterText(field, 'Too short');
    await tester.pump();
    final submit = find.text('Submit Claim');
    await tester.ensureVisible(submit);
    await tester.pumpAndSettle();
    await tester.tap(submit);
    await tester.pump();
    expect(find.text('CLM-1025'), findsNothing);

    await tester.enterText(field, 'Speaker stopped working after an update.');
    await tester.pump();
    await tester.ensureVisible(submit);
    await tester.pumpAndSettle();
    await tester.tap(submit);
    await tester.pumpAndSettle();
    expect(find.text('CLM-1025'), findsOneWidget);
    // The form clears after a successful claim.
    expect(tester.widget<EditableText>(field).controller.text, isEmpty);
    await tester.pump(const Duration(seconds: 3));
  });

  testWidgets('find a store: two panes on a wide window', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      _app(const FindStoreScreen(), size: const Size(1200, 800)),
    );
    await tester.pumpAndSettle();
    expect(find.text('Pick a store'), findsOneWidget);
    await tester.tap(find.text('Bogyoke Market').last);
    await tester.pumpAndSettle();
    expect(find.text('Pick a store'), findsNothing);
    expect(find.text('Directions'), findsOneWidget);
  });
}
