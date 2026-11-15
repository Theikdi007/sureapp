import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/design_system/theme/app_theme.dart';
import 'package:sure_app/features/loyalty/data/loyalty_repository.dart';
import 'package:sure_app/features/loyalty/presentation/top_up_screen.dart';
import 'package:sure_app/features/rewards/data/rewards_repository.dart';

void main() {
  test('transfer moves points once per key', () async {
    final repo = MockLoyaltyRepository(latency: Duration.zero);
    final before = MockLoyaltyStore.points;
    final key = IdempotencyKey.generate();
    final a = await repo.transfer(phone: '09450012345', amount: 100, key: key);
    final b = await repo.transfer(phone: '09450012345', amount: 100, key: key);
    expect(a.transactionId, b.transactionId);
    expect(MockLoyaltyStore.points, before - 100);
    await expectLater(
      repo.transferPreview(phone: '09776234118', amount: 1),
      throwsA(
        isA<ApiException>().having(
          (e) => e.code,
          'code',
          'isure.self_transfer',
        ),
      ),
    );
  });

  test('a reward claim spends points and is not repeatable', () async {
    final repo = MockRewardsRepository(latency: Duration.zero);
    final before = MockLoyaltyStore.points;
    final r = await repo.claim(
      'rw7',
      method: 'code',
      key: IdempotencyKey.generate(),
    );
    expect(r.code, isNotNull);
    expect(MockLoyaltyStore.points, before - 100);
    expect((await repo.reward('rw7')).ctaEnabled, isFalse);
    await expectLater(
      repo.claim('rw7', method: 'code', key: IdempotencyKey.generate()),
      throwsA(isA<ApiException>()),
    );
  });

  testWidgets('top up: check shows the code, then redeem', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          deviceCapsProvider.overrideWithValue(
            const DeviceCaps(
              platform: 'ios',
              osMajorVersion: 18,
              deviceName: 'test',
              appVersion: '1.0.0',
              isLowRamDevice: false,
              reduceTransparency: true,
            ),
          ),
          loyaltyRepositoryProvider.overrideWithValue(
            MockLoyaltyRepository(latency: Duration.zero),
          ),
        ],
        child: MaterialApp(theme: AppTheme.light(), home: const TopUpScreen()),
      ),
    );
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(EditableText).first, 'SURE-7K2P-QX');
    await tester.pump();
    await tester.tap(find.text('Check code'));
    await tester.pumpAndSettle();
    expect(find.text('+5,000'), findsOneWidget);
    expect(find.text('Redeem 5,000 points'), findsOneWidget);
  });
}
