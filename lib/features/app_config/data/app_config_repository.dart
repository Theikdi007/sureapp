import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import 'app_config_dto.dart';

part 'app_config_repository.g.dart';

abstract interface class AppConfigRepository {
  Future<AppConfigDto> fetch();
}

@Riverpod(keepAlive: true)
AppConfigRepository appConfigRepository(Ref ref) =>
    ref.watch(appConfigProvider).isMock
    ? MockAppConfigRepository()
    : ApiAppConfigRepository(ref.watch(dioProvider));

/// Loaded once at launch; the splash screen waits for it.
@Riverpod(keepAlive: true)
Future<AppConfigDto> remoteAppConfig(Ref ref) =>
    ref.watch(appConfigRepositoryProvider).fetch();

class ApiAppConfigRepository implements AppConfigRepository {
  ApiAppConfigRepository(this._dio);

  final Dio _dio;

  @override
  Future<AppConfigDto> fetch() => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'app-config',
      options: Options(extra: {RequestFlags.skipAuth: true}),
    );
    return AppConfigDto.fromJson(res.data!);
  });
}

/// The API doc's example. Images point at the test server's public media
/// (the doc's `localhost` URLs can't load on a device); the onboarding
/// screen falls back to a brand panel when they don't load.
class MockAppConfigRepository implements AppConfigRepository {
  static const _media = 'https://surestoremobileapi.yammobots.com/media';

  @override
  Future<AppConfigDto> fetch() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return AppConfigDto.fromJson(const {
      'minimumVersion': '1.0.0',
      'latestVersion': '1.0.0',
      'updateRequired': false,
      'supportPhone': '09 750 066 391',
      'currency': 'MMK',
      'pointValueMmk': 1,
      'checkoutPayments': [
        {
          'code': 'cod',
          'title': 'Cash on delivery',
          'description':
              'Pay the rider in cash or by QR when your order arrives',
          'enabled': true,
        },
        {
          'code': 'pay_at_pickup',
          'title': 'Pay at pickup',
          'description': 'Pay at the store counter when you collect',
          'enabled': true,
        },
      ],
      'onboarding': [
        {
          'imageUrl': '$_media/hero-whats-new.png',
          'title': "Myanmar's Ultimate Tech Marketplace",
          'subtitle': 'Authentic. Supported. Delivered in 3 Hours.',
        },
        {
          'imageUrl': '$_media/product-iphone.jpg',
          'title': 'More Than a Store',
          'subtitle': "We track your device's lifecycle from purchase to professional repair.",
        },
        {
          'imageUrl': '$_media/hero-whats-new.png',
          'title': 'Unlock Your Benefits',
          'subtitle': 'Join Sure Benefits and earn points on every purchase across our ecosystem.',
        },
        {
          'imageUrl': '$_media/hero-whats-new.png',
          'title': 'Pay Your Way',
          'subtitle': 'Local payment methods designed for Myanmar. Fast, secure, and familiar.',
        },
      ],
      'serverTime': '2026-11-13T05:36:00.803689+00:00',
    });
  }
}
