import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import '../../catalog/data/catalog_dtos.dart';
import 'home_dtos.dart';
import 'mock_catalog.dart';

part 'home_repository.g.dart';

/// Home tab: `GET home`, `GET products/feed`.
abstract interface class HomeRepository {
  Future<HomeDto> home();
  Future<Page<ProductCardDto>> feed({String? cursor, int limit = 10});
}

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) => ref.watch(appConfigProvider).isMock
    ? MockHomeRepository()
    : ApiHomeRepository(ref.watch(dioProvider));

class ApiHomeRepository implements HomeRepository {
  ApiHomeRepository(this._dio);

  final Dio _dio;

  @override
  Future<HomeDto> home() => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>('home');
    return HomeDto.fromJson(res.data!);
  });

  @override
  Future<Page<ProductCardDto>> feed({String? cursor, int limit = 10}) =>
      apiCall(() async {
        final res = await _dio.get<Map<String, dynamic>>(
          'products/feed',
          queryParameters: {'cursor': ?cursor, 'limit': limit},
        );
        return Page.fromJson(res.data!, ProductCardDto.fromJson);
      });
}

/// Same shapes as the API doc's examples, filled with the prototype's
/// catalog so the screens look like the design.
class MockHomeRepository implements HomeRepository {
  MockHomeRepository({this.latency = const Duration(milliseconds: 500)});

  final Duration latency;

  @override
  Future<HomeDto> home() async {
    await Future<void>.delayed(latency);
    final feed = await _page(null, 4);
    return HomeDto(
      hero: MockCatalog.hero,
      whatsNew: MockCatalog.whatsNew,
      flashDeals: FlashDealsDto(
        endsAt: DateTime.now()
            .toUtc()
            .add(const Duration(hours: 2, minutes: 10))
            .toIso8601String(),
        items: MockCatalog.products.where((p) => p.compareAt != null).toList(),
      ),
      brands: MockCatalog.brands,
      vendors: MockCatalog.vendors,
      forYou: feed,
      counts: const HomeCountsDto(unreadNotifications: 3),
      deliverTo: MockCatalog.homeAddress,
    );
  }

  @override
  Future<Page<ProductCardDto>> feed({String? cursor, int limit = 10}) async {
    await Future<void>.delayed(latency);
    return _page(cursor, limit);
  }

  /// 24 cards cycling the catalog, like the prototype's endless feed.
  Future<Page<ProductCardDto>> _page(String? cursor, int limit) async {
    const total = 24;
    final start = int.tryParse(cursor ?? '') ?? 0;
    final end = (start + limit).clamp(0, total);
    final p = MockCatalog.products;
    return Page(
      // Repeats the catalog; ids repeat too, so lists key by index.
      items: [for (var i = start; i < end; i++) p[i % p.length]],
      nextCursor: end < total ? '$end' : null,
    );
  }
}
