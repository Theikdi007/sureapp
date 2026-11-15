import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/config/app_config.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/core/settings/theme_setting.dart';
import 'package:sure_app/design_system/theme/app_theme.dart';
import 'package:sure_app/features/auth/presentation/app_lock.dart';
import 'package:sure_app/features/auth/presentation/app_lock_screen.dart';
import 'package:sure_app/features/auth/presentation/auth_providers.dart';
import 'package:sure_app/features/cart/presentation/location_sheet.dart';
import 'package:sure_app/features/home/data/home_dtos.dart';
import 'package:sure_app/features/profile/data/profile_repository.dart';

/// Stands in for the biometric prompt.
class FakeDeviceAuth implements DeviceAuth {
  FakeDeviceAuth({this.lockMethod = LockMethod.face, this.succeed = true});

  LockMethod lockMethod;
  bool succeed;
  int prompts = 0;

  @override
  Future<LockMethod> method() async => lockMethod;

  @override
  Future<bool> authenticate(String reason) async {
    prompts++;
    return succeed;
  }
}

class _SignedInSession extends Session {
  @override
  Future<SessionState> build() async => const SignedIn(null);
}

const _caps = DeviceCaps(
  platform: 'ios',
  osMajorVersion: 18,
  deviceName: 'test',
  appVersion: '1.0.0',
  isLowRamDevice: false,
  reduceTransparency: true,
);

ProviderContainer _container(FakeDeviceAuth auth) {
  final c = ProviderContainer(
    overrides: [
      appConfigProvider.overrideWithValue(
        const AppConfig(flavor: AppFlavor.mock, apiBaseUrl: ''),
      ),
      deviceCapsProvider.overrideWithValue(_caps),
      deviceAuthProvider.overrideWithValue(auth),
      sessionProvider.overrideWith(_SignedInSession.new),
    ],
  );
  addTearDown(c.dispose);
  return c;
}

Future<void> _settle() => Future<void>.delayed(Duration.zero);

void main() {
  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
    MockAddressBook.reset();
  });

  test('App Lock: turning on needs a face, then launch is locked', () async {
    final auth = FakeDeviceAuth();
    final c = _container(auth);
    c.listen(appLockProvider, (_, _) {});
    await _settle();
    expect(c.read(appLockProvider).locked, isFalse);

    // Cancelled prompt: stays off.
    auth.succeed = false;
    expect(
      await c.read(appLockProvider.notifier).setEnabled(true),
      AppLockChange.cancelled,
    );
    expect(await c.read(appPrefsProvider).appLockEnabled(), isFalse);

    auth.succeed = true;
    expect(
      await c.read(appLockProvider.notifier).setEnabled(true),
      AppLockChange.done,
    );
    expect(await c.read(appPrefsProvider).appLockEnabled(), isTrue);

    // Next launch.
    final relaunch = _container(auth);
    relaunch.listen(appLockProvider, (_, _) {});
    await _settle();
    await _settle();
    expect(relaunch.read(appLockProvider).locked, isTrue);
    expect(await relaunch.read(appLockProvider.notifier).unlock(), isTrue);
    expect(relaunch.read(appLockProvider).locked, isFalse);
  });

  test('App Lock: no screen lock on the phone → explain, stay off', () async {
    final c = _container(FakeDeviceAuth(lockMethod: LockMethod.none));
    expect(
      await c.read(appLockProvider.notifier).setEnabled(true),
      AppLockChange.unavailable,
    );
  });

  testWidgets('App Lock covers the app until unlocked', (tester) async {
    FlutterSecureStorage.setMockInitialValues({'app.app_lock': 'true'});
    final auth = FakeDeviceAuth(succeed: false);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(
            const AppConfig(flavor: AppFlavor.mock, apiBaseUrl: ''),
          ),
          deviceCapsProvider.overrideWithValue(_caps),
          deviceAuthProvider.overrideWithValue(auth),
          sessionProvider.overrideWith(_SignedInSession.new),
        ],
        child: MaterialApp(
          theme: AppTheme.light(),
          builder: (_, child) => AppLockGate(child: child!),
          home: const Scaffold(body: Text('Secret balance')),
        ),
      ),
    );
    await tester.pumpAndSettle();
    // Asked once on its own; it failed.
    expect(auth.prompts, 1);
    expect(find.text('Secret balance'), findsNothing);
    expect(find.text('Unlock with Face ID'), findsOneWidget);

    auth.succeed = true;
    await tester.tap(find.text('Unlock'));
    await tester.pumpAndSettle();
    expect(find.text('Secret balance'), findsOneWidget);
  });

  test('dark mode choice is kept on the device', () async {
    final c = _container(FakeDeviceAuth());
    expect(c.read(themeSettingProvider), ThemeMode.system);
    await c.read(themeSettingProvider.notifier).set(ThemeMode.dark);
    expect(await c.read(appPrefsProvider).themeMode(), 'dark');

    final again = _container(FakeDeviceAuth());
    again.listen(themeSettingProvider, (_, _) {});
    await _settle();
    expect(again.read(themeSettingProvider), ThemeMode.dark);
  });

  testWidgets('location sheet: pick an address; deleting it clears the pick', (
    tester,
  ) async {
    late WidgetRef ref;
    AddressDto? picked;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(
            const AppConfig(flavor: AppFlavor.mock, apiBaseUrl: ''),
          ),
          deviceCapsProvider.overrideWithValue(_caps),
          profileRepositoryProvider.overrideWithValue(
            MockProfileRepository(latency: Duration.zero),
          ),
        ],
        child: MaterialApp(
          theme: AppTheme.light(),
          home: Consumer(
            builder: (context, r, _) {
              ref = r;
              return TextButton(
                onPressed: () async =>
                    picked = await showLocationSheet(context),
                child: const Text('open'),
              );
            },
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('Choose your location'), findsOneWidget);
    expect(find.text('Use current location'), findsNothing);
    await tester.tap(find.text('Office'));
    await tester.pumpAndSettle();
    expect(picked?.label, 'Office');

    ref.read(deliveryAddressProvider.notifier).choose(picked!);
    ref.read(deliveryAddressProvider.notifier).sync([homeOnly]);
    expect(ref.read(deliveryAddressProvider), isNull);
  });
}

// The seed's first (home) address, as left after the Office one is deleted.
final homeOnly = MockAddressBook.seed().first;
