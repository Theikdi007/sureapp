// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.
import 'mocks.dart';

import 'package:sure_app/features/catalog/data/catalog_dtos.dart';
import 'package:sure_app/features/home/data/home_dtos.dart';
import 'package:sure_app/features/home/data/home_repository.dart';
import 'package:sure_app/shared/models/money.dart';

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
