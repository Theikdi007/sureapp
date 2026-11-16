import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/core/push/push_registration.dart';
import 'package:sure_app/features/auth/data/auth_dtos.dart';
import 'package:sure_app/features/auth/presentation/auth_providers.dart';

import 'support/mock_overrides.dart';

const _caps = DeviceCaps(
  platform: 'android',
  osMajorVersion: 15,
  deviceName: 'test',
  appVersion: '1.0.0',
  isLowRamDevice: false,
  reduceTransparency: false,
);

const _tokens = AuthTokensDto(
  accessToken: 'a',
  accessTokenExpiresAt: '2026-11-16T10:00:00Z',
  refreshToken: 'r',
  refreshTokenExpiresAt: '2026-12-16T10:00:00Z',
  member: MemberBriefDto(
    memberId: 'm1',
    name: 'Test',
    phone: '+959000000000',
    phoneDisplay: '+95 9 000 000 000',
    tier: 'classic',
    tierLabel: 'Classic',
  ),
);

void main() {
  setUp(() => FlutterSecureStorage.setMockInitialValues({}));

  test('push token: registered on sign-in, removed on sign-out', () async {
    final devices = MockDevicesRepository();
    final container = ProviderContainer(
      overrides: [
        ...mockOverrides(devices: devices),
        deviceCapsProvider.overrideWithValue(_caps),
      ],
    );
    addTearDown(container.dispose);

    container.read(pushRegistrationProvider);
    await container.read(sessionProvider.future);
    expect(devices.tokens, isEmpty);

    await container.read(sessionProvider.notifier).signIn(_tokens);
    await pumpEventQueue();
    expect(devices.tokens, {'test-fcm-token'});

    await container.read(sessionProvider.notifier).signOut();
    expect(devices.tokens, isEmpty);
  });
}
