// Live write flows: every create / change call of the app against the test
// server, in the order a member would use them. Creates real records on the
// test account; what can be undone is undone, the rest is printed as
// `CREATED …` so it can be cleaned up in the shop / iSure back office.
//
//   LIVE_PHONE=09… LIVE_PASSWORD=… LIVE_WRITES=1 \
//     flutter test test/live/live_write_flows_test.dart
//
// Optional: LIVE_TRANSFER_TO=09… (another test member) also sends 1 point.
@Tags(['live'])
library;

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/config/app_config.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/core/storage/token_storage.dart';
import 'package:sure_app/features/auth/data/auth_repository.dart';
import 'package:sure_app/features/cart/data/cart_repository.dart';
import 'package:sure_app/features/cart/data/checkout_dtos.dart';
import 'package:sure_app/features/catalog/data/catalog_dtos.dart';
import 'package:sure_app/features/catalog/data/catalog_repository.dart';
import 'package:sure_app/features/catalog/data/wishlist_repository.dart';
import 'package:sure_app/features/loyalty/data/loyalty_repository.dart';
import 'package:sure_app/features/notifications/data/notifications_repository.dart';
import 'package:sure_app/features/orders/data/order_dtos.dart';
import 'package:sure_app/features/orders/data/orders_repository.dart';
import 'package:sure_app/features/profile/data/profile_repository.dart';
import 'package:sure_app/features/rewards/data/rewards_repository.dart';
import 'package:sure_app/features/warranty/data/warranty_repository.dart';

void main() {
  final env = Platform.environment;
  final phone = env['LIVE_PHONE'];
  final password = env['LIVE_PASSWORD'];
  final base = env['LIVE_API_BASE_URL'] ?? AppConfig.stagingBaseUrl;
  final skip = phone == null || password == null || env['LIVE_WRITES'] != '1'
      ? 'set LIVE_PHONE, LIVE_PASSWORD and LIVE_WRITES=1 to run'
      : null;

  final dio = Dio(
    BaseOptions(
      baseUrl: '$base${AppConfig.apiBasePath}/',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'X-App-Version': '1.0.0',
        'X-Platform': 'ios',
        'X-Device-Name': 'live-write-test',
        'Accept-Language': 'en',
      },
    ),
  );

  setUpAll(() async {
    if (skip != null) return;
    final t = await ApiAuthRepository(dio)
        .login(phone: phone!, password: password!);
    dio.options.headers['Authorization'] = 'Bearer ${t.accessToken}';
  });

  final cart = ApiCartRepository(dio);
  final catalog = ApiCatalogRepository(dio);
  final orders = ApiOrdersRepository(dio);
  final profile = ApiProfileRepository(dio);
  final loyalty = ApiLoyaltyRepository(dio);
  final rewards = ApiRewardsRepository(dio);
  final warranty = ApiWarrantyRepository(dio);

  void created(String what) => debugPrintCreated('CREATED $what');

  Future<ApiException> fails(Future<Object?> Function() call) async {
    try {
      await call();
    } on ApiException catch (e) {
      return e;
    }
    fail('expected an API error');
  }

  Future<ProductCardDto> inStock() async {
    final items = (await catalog.search(const ProductQuery())).items;
    return items.firstWhere((p) => p.inStock);
  }

  group('session', () {
    test(
      'expired access token: refresh, store both tokens, retry once',
      () async {
        FlutterSecureStorage.setMockInitialValues({});
        final container = ProviderContainer(
          overrides: [
            appConfigProvider.overrideWithValue(
              AppConfig(flavor: AppFlavor.staging, apiBaseUrl: base),
            ),
            deviceCapsProvider.overrideWithValue(
              const DeviceCaps(
                platform: 'ios',
                osMajorVersion: 26,
                deviceName: 'live-write-test',
                appVersion: '1.0.0',
                isLowRamDevice: false,
                reduceTransparency: false,
              ),
            ),
          ],
        );
        addTearDown(container.dispose);
        // A fresh session of its own, so the shared one keeps working.
        final own = await ApiAuthRepository(container.read(dioProvider))
            .login(phone: phone!, password: password!);
        final storage = container.read(tokenStorageProvider);
        await storage.save(
          AuthTokens(
            accessToken: 'expired.${own.accessToken}',
            refreshToken: own.refreshToken,
          ),
        );
        final me = await ApiProfileRepository(container.read(dioProvider)).me();
        expect(me.phone, own.member.phone);
        final after = (await storage.read())!;
        expect(after.accessToken, isNot(startsWith('expired.')));
        expect(after.refreshToken, isNot(own.refreshToken));

        // Sign-out ends that session; its refresh token is dead afterwards.
        await ApiAuthRepository(container.read(dioProvider))
            .logout(refreshToken: after.refreshToken);
        final e = await fails(
          () => dio
              .post<void>(
                'auth/refresh',
                data: {'refreshToken': after.refreshToken},
              )
              .catchError(
                (Object e) => throw ApiException.fromDio(e as DioException),
              ),
        );
        expect(e.status, 401);
      },
      skip: skip,
    );
  });

  group('shopping', () {
    test('wishlist add, list, remove', () async {
      final p = await inStock();
      final wish = ApiWishlistRepository(dio);
      await wish.add(p.id);
      expect((await catalog.wishlist()).map((w) => w.id), contains(p.id));
      await wish.remove(p.id);
      expect(
        (await catalog.wishlist()).map((w) => w.id),
        isNot(contains(p.id)),
      );
    }, skip: skip);

    test('product review (write or replace)', () async {
      final p = await inStock();
      final r = await catalog.reviewProduct(
        p.id,
        rating: 5,
        text: 'Sure App contract test review.',
        key: IdempotencyKey.generate(),
      );
      expect(r.rating, 5);
      created('product review on ${p.id}');
    }, skip: skip);

    test('store review', () async {
      final v = (await catalog.vendors()).first;
      final r = await catalog.reviewVendor(
        v.id,
        rating: 5,
        text: 'Sure App contract test review.',
        key: IdempotencyKey.generate(),
      );
      expect(r.rating, 5);
      created('store review on ${v.id}');
    }, skip: skip);

    test('bag: add, change qty, remove; quote; pay-at-pickup order', () async {
      // Start from an empty bag.
      for (final l in (await cart.cart()).lines) {
        await cart.remove(l.id);
      }
      final p = await inStock();
      var bag = await cart.addItem(
        productId: p.id,
        key: IdempotencyKey.generate(),
      );
      final line = bag.lines.single;
      bag = await cart.setQty(line.id, 2);
      expect(bag.lines.single.qty, 2);
      bag = await cart.setQty(line.id, 1);
      expect(bag.itemCount, 1);

      var request = const CheckoutRequest(mode: 'pickup');
      var quote = await cart.quote(request);
      expect(quote.stores, isNotEmpty);
      request = CheckoutRequest(
        mode: 'pickup',
        storeCode: quote.stores.first.code,
        payment: 'pay_at_pickup',
      );
      quote = await cart.quote(request);
      expect(quote.canPlace, isTrue, reason: '${quote.problems}');

      final placed = await cart.placeOrder(
        request.copyWith(
          expectedTotal: quote.total.value,
          note: 'Sure App contract test order, please cancel.',
        ),
        key: IdempotencyKey.generate(),
      );
      created(
        'order ${placed.number} (pay at pickup, ${placed.total.value} '
        '${placed.total.currency})',
      );
      expect(placed.total, quote.total);
      expect((await cart.cart()).lines, isEmpty);

      final listed = await orders.orders(OrderTab.all);
      expect(listed.items.map((o) => o.number), contains(placed.number));
      await orders.order(placed.number);
      await orders.tracking(placed.number);

      // Not delivered yet, so it can't be rated.
      final e = await fails(
        () => orders.feedback(
          placed.number,
          rating: 5,
          key: IdempotencyKey.generate(),
        ),
      );
      expect(e.code, 'mobile.feedback_not_allowed');
    }, skip: skip);

    test('empty bag: quote answers mobile.cart_empty', () async {
      for (final l in (await cart.cart()).lines) {
        await cart.remove(l.id);
      }
      final e = await fails(
        () => cart.quote(const CheckoutRequest(mode: 'pickup')),
      );
      expect(e.code, 'mobile.cart_empty');
    }, skip: skip);
  });

  group('account', () {
    test('address add, edit, delete', () async {
      final a = await profile.addAddress(
        const AddressRequest(
          label: 'Contract test',
          line1: 'No. 1, Test Road',
          township: 'Kamayut',
          city: 'Yangon',
        ),
        key: IdempotencyKey.generate(),
      );
      final edited = await profile.updateAddress(
        a.id,
        const AddressRequest(
          label: 'Contract test 2',
          line1: 'No. 2, Test Road',
          township: 'Kamayut',
          city: 'Yangon',
        ),
      );
      expect(edited.label, 'Contract test 2');
      await profile.deleteAddress(a.id);
      expect(
        (await profile.addresses()).map((x) => x.id),
        isNot(contains(a.id)),
      );
    }, skip: skip);

    test('profile and preferences round trip', () async {
      final me = await profile.me();
      final back = await profile.updateMe(UpdateProfileRequest(name: me.name));
      expect(back.name, me.name);
      final prefs = await profile.preferences();
      final flipped = await profile.updatePreferences(
        pushEnabled: !prefs.pushEnabled,
      );
      expect(flipped.pushEnabled, !prefs.pushEnabled);
      await profile.updatePreferences(pushEnabled: prefs.pushEnabled);
    }, skip: skip);

    test('default payment method round trip', () async {
      final methods = await profile.paymentMethods();
      final enabled = methods.where((m) => m.enabled).toList();
      final current = methods.where((m) => m.isDefault).firstOrNull;
      final other = enabled.firstWhere(
        (m) => m.code != current?.code,
        orElse: () => enabled.first,
      );
      final after = await profile.setDefaultPayment(other.code);
      expect(after.firstWhere((m) => m.isDefault).code, other.code);
      if (current != null) await profile.setDefaultPayment(current.code);
    }, skip: skip);

    test('notification marked read', () async {
      final n = ApiNotificationsRepository(dio);
      final page = await n.list(NotificationTab.all);
      final unread = page.items.where((x) => x.unread).firstOrNull;
      if (unread == null) return markTestSkipped('no unread notification');
      await n.markRead(unread.id);
      expect((await n.detail(unread.id)).unread, isFalse);
    }, skip: skip);
  });

  group('support', () {
    test('warranty claim with photo (or plan_expired without one)', () async {
      final plans = await warranty.plans();
      final active = plans.where((p) => p.active).firstOrNull;
      if (active == null) {
        // The test member's plans have all ended: the API refuses the claim
        // with a field error on planId, which the claim form shows.
        final e = await fails(
          () => warranty.fileClaim(
            planId: plans.first.id,
            description: 'Sure App contract test claim: screen flickers.',
            key: IdempotencyKey.generate(),
          ),
        );
        expect(e.fieldMessage('planId'), isNotNull);
        expect(e.errors.single.code, 'mobile.plan_expired');
        return;
      }
      final photo = File('${Directory.systemTemp.path}/sure-claim.png')
        ..writeAsBytesSync(_png1x1);
      final claim = await warranty.fileClaim(
        planId: active.id,
        description: 'Sure App contract test claim: screen flickers.',
        photo: UploadPhoto(
          path: photo.path,
          fileName: 'sure-claim.png',
          mimeType: 'image/png',
        ),
        key: IdempotencyKey.generate(),
      );
      created('warranty claim ${claim.number} on plan ${active.id}');
      expect((await warranty.claim(claim.number)).planId, active.id);
      expect(await warranty.claimPhoto(claim.number), isNotEmpty);
    }, skip: skip);

    test('warranty claim too short: mobile.claim_too_short', () async {
      final plan = (await warranty.plans()).first;
      final e = await fails(
        () => warranty.fileClaim(
          planId: plan.id,
          description: 'short',
          key: IdempotencyKey.generate(),
        ),
      );
      expect(e.code, 'mobile.claim_too_short');
    }, skip: skip);
  });

  group('loyalty', () {
    test('cheapest code reward claimed', () async {
      final all =
          (await rewards.rewards()).items
              .where(
                (r) => r.state == 'available' && r.methods.contains('code'),
              )
              .toList()
            ..sort((a, b) => a.cost.compareTo(b.cost));
      final r = all.first;
      final before = (await loyalty.summary()).points;
      final claim = await rewards.claim(
        r.id,
        method: 'code',
        key: IdempotencyKey.generate(),
      );
      created('reward claim ${r.id} "${r.title}" (${claim.pointsUsed} points)');
      expect((await loyalty.summary()).points, before - claim.pointsUsed);
    }, skip: skip);

    test('top-up code check: unknown code is isure.code_invalid', () async {
      final e = await fails(() => loyalty.topupCheck('NOPE-0000-XX'));
      expect(e.code, 'isure.code_invalid');
    }, skip: skip);

    test('transfer preview to self: isure.self_transfer', () async {
      final e = await fails(
        () => loyalty.transferPreview(phone: phone!, amount: 1),
      );
      expect(e.code, 'isure.self_transfer');
    }, skip: skip);

    test(
      'transfer 1 point to LIVE_TRANSFER_TO',
      () async {
        final to = env['LIVE_TRANSFER_TO']!;
        final preview = await loyalty.transferPreview(phone: to, amount: 1);
        final sent = await loyalty.transfer(
          phone: to,
          amount: 1,
          note: 'Sure App contract test',
          key: IdempotencyKey.generate(),
        );
        created('transfer of 1 point to ${preview.recipientPhoneDisplay}');
        expect(sent, isNotNull);
      },
      skip:
          skip ??
          (env['LIVE_TRANSFER_TO'] == null ? 'no LIVE_TRANSFER_TO' : null),
    );
  });
}

// ignore: avoid_print
void debugPrintCreated(String line) => print(line);

/// A 1×1 transparent PNG.
const _png1x1 = <int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
  0x42,
  0x60,
  0x82,
];
