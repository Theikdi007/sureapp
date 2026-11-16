// Live contract check: every read call of every `Api…Repository` against the
// test server, so DTOs are checked against real responses (the OpenAPI spec
// leaves response bodies untyped).
//
// Skipped unless credentials are given; never commit them:
//   LIVE_PHONE=09… LIVE_PASSWORD=… flutter test test/live
// Optional: LIVE_API_BASE_URL (defaults to the Yammobots test server).
// LIVE_WRITES=1 also runs the write group: it creates and undoes real records
// (store follow, push token, a home-setup visit, which emails the branch).
@Tags(['live'])
library;

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/features/app_config/data/app_config_repository.dart';
import 'package:sure_app/features/auth/data/auth_repository.dart';
import 'package:sure_app/features/cart/data/cart_repository.dart';
import 'package:sure_app/features/catalog/data/catalog_repository.dart';
import 'package:sure_app/features/content/data/content_repository.dart';
import 'package:sure_app/features/home/data/home_repository.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/features/loyalty/data/loyalty_repository.dart';
import 'package:sure_app/features/notifications/data/devices_repository.dart';
import 'package:sure_app/features/notifications/data/notifications_repository.dart';
import 'package:sure_app/features/orders/data/order_dtos.dart';
import 'package:sure_app/features/orders/data/orders_repository.dart';
import 'package:sure_app/features/profile/data/profile_repository.dart';
import 'package:sure_app/features/repairs/data/repairs_repository.dart';
import 'package:sure_app/features/rewards/data/rewards_repository.dart';
import 'package:sure_app/features/stores/data/stores_repository.dart';
import 'package:sure_app/features/warranty/data/warranty_repository.dart';

void main() {
  final env = Platform.environment;
  final phone = env['LIVE_PHONE'];
  final password = env['LIVE_PASSWORD'];
  final base =
      env['LIVE_API_BASE_URL'] ?? 'https://surestoremobileapi.yammobots.com';
  final skip = phone == null || password == null
      ? 'set LIVE_PHONE and LIVE_PASSWORD to run'
      : null;
  final skipWrites =
      skip ?? (env['LIVE_WRITES'] == '1' ? null : 'LIVE_WRITES=1');

  final dio = Dio(
    BaseOptions(
      baseUrl: '$base/api/mobile/v1/',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'X-App-Version': '1.0.0',
        'X-Platform': 'ios',
        'X-Device-Name': 'live-contract-test',
        'Accept-Language': 'en',
      },
    ),
  );

  setUpAll(() async {
    if (skip != null) return;
    final tokens = await ApiAuthRepository(dio)
        .login(phone: phone!, password: password!);
    dio.options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
  });

  final catalog = ApiCatalogRepository(dio);
  final loyalty = ApiLoyaltyRepository(dio);
  final orders = ApiOrdersRepository(dio);
  final profile = ApiProfileRepository(dio);
  final rewards = ApiRewardsRepository(dio);
  final warranty = ApiWarrantyRepository(dio);
  final notifications = ApiNotificationsRepository(dio);

  // One test per call so a single bad DTO doesn't hide the rest.
  void check(String name, Future<void> Function() call) =>
      test(name, call, skip: skip);

  group('public', () {
    check('app-config', () => ApiAppConfigRepository(dio).fetch());
    check('auth/phone/check', () => ApiAuthRepository(dio).checkPhone(phone!));
    for (final slug in [
      ContentSlugs.terms,
      ContentSlugs.privacy,
      ContentSlugs.returnPolicy,
    ]) {
      check('content/$slug', () => ApiContentRepository(dio).page(slug));
    }
  });

  group('home & catalog', () {
    check('home', () => ApiHomeRepository(dio).home());
    check('products/feed', () => ApiHomeRepository(dio).feed());
    check('products', () => catalog.search(const ProductQuery()));
    check('products/{id} + reviews', () async {
      final page = await catalog.search(const ProductQuery());
      for (final p in page.items.take(5)) {
        await catalog.product(p.id);
        await catalog.productReviews(p.id);
      }
    });
    check('brands', catalog.brands);
    check('vendors + detail/rating/reviews', () async {
      for (final v in (await catalog.vendors()).take(3)) {
        await catalog.vendor(v.id);
        await catalog.vendorRating(v.id);
        await catalog.vendorReviews(v.id);
      }
    });
    check('wishlist', catalog.wishlist);
    check('stores', () => ApiStoresRepository(dio).stores());
  });

  group('bag', () {
    check('cart', () => ApiCartRepository(dio).cart());
    check('addresses', () => ApiCartRepository(dio).addresses());
  });

  group('orders', () {
    for (final tab in OrderTab.values) {
      check('orders ${tab.name} + detail/tracking', () async {
        final page = await orders.orders(tab);
        for (final o in page.items.take(3)) {
          await orders.order(o.number);
          await orders.tracking(o.number);
        }
      });
    }
    check('home-setup/bookings + detail', () async {
      for (final b in (await orders.bookings()).take(3)) {
        await orders.booking(b.number);
      }
    });
    check('home-setup/slots', orders.slots);
  });

  group('loyalty', () {
    check('summary', loyalty.summary);
    check('tiers', loyalty.tiers);
    for (final f in PointsFilter.values) {
      check('points ${f.name} + detail', () async {
        final page = await loyalty.points(filter: f);
        for (final e in page.items.take(3)) {
          if (e.transactionId != null) {
            await loyalty.pointDetail(e.transactionId!);
          }
        }
      });
    }
    check('club-scores', () => loyalty.clubScores());
    check('member-qr', loyalty.memberQr);
    check('counter-requests', loyalty.counterRequests);
  });

  group('rewards', () {
    check('rewards/home + detail', () async {
      final home = await rewards.home();
      final ids = {
        for (final c in home.featured) c.id,
        for (final s in home.sections)
          for (final c in s.items) c.id,
      };
      for (final id in ids.take(5)) {
        await rewards.reward(id);
      }
    });
    check('rewards (all, featured)', () async {
      await rewards.rewards();
      await rewards.rewards(featured: true);
    });
    check('member-benefits + detail', () async {
      for (final b in (await rewards.memberBenefits()).items.take(3)) {
        await rewards.memberBenefit(b.id);
      }
    });
  });

  group('support', () {
    check('warranty plans + detail', () async {
      for (final p in (await warranty.plans()).take(3)) {
        await warranty.plan(p.id);
      }
    });
    check('warranty claims + detail', () async {
      for (final c in (await warranty.claims()).take(3)) {
        await warranty.claim(c.number);
      }
    });
    check('repairs', () => ApiRepairsRepository(dio).repairs());
  });

  group('profile & notifications', () {
    check('me', profile.me);
    check('me/preferences', profile.preferences);
    check('payment-methods', profile.paymentMethods);
    check('notifications/unread-count', notifications.unreadCount);
    for (final tab in NotificationTab.values) {
      check('notifications ${tab.name} + detail', () async {
        final page = await notifications.list(tab);
        for (final n in page.items.take(3)) {
          await notifications.detail(n.id);
        }
      });
    }
  });

  group('writes (undone)', () {
    void write(String name, Future<void> Function() call) =>
        test(name, call, skip: skipWrites);

    write('vendors/{id}/follow then unfollow', () async {
      final v = (await catalog.vendors()).first;
      final on = await catalog.follow(v.id);
      expect(on.following, isTrue);
      final off = await catalog.unfollow(v.id);
      expect(off.following, isFalse);
    });

    write('devices register then unregister', () async {
      final devices = ApiDevicesRepository(dio);
      const token = 'live-contract-test-token';
      await devices.register(token: token, platform: 'ios');
      await devices.unregister(token);
    });

    write('home-setup book, read, cancel', () async {
      final day = (await orders.slots()).firstWhere(
        (d) => d.slots.any((s) => s.available),
      );
      final slot = day.slots.firstWhere((s) => s.available);
      final address = (await profile.addresses()).first;
      final product = (await catalog.search(const ProductQuery())).items.first;
      final booked = await orders.book(
        BookHomeSetupRequest(
          productId: product.id,
          date: day.date,
          slot: slot.slot,
          addressId: address.id,
          note: 'Sure App contract test, cancelled right away',
        ),
        key: IdempotencyKey.generate(),
      );
      final read = await orders.booking(booked.number);
      expect(read.number, booked.number);
      final cancelled = await orders.cancelBooking(booked.number);
      expect(cancelled.canCancel, isFalse);
      // ignore: avoid_print
      print('booked and cancelled ${booked.number}: ${cancelled.statusLabel}');
    });
  });
}
