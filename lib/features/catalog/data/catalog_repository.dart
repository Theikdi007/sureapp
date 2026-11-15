import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import '../../home/data/mock_catalog.dart';
import '../../orders/data/orders_repository.dart';
import 'catalog_dtos.dart';
import 'wishlist_repository.dart';

part 'catalog_repository.g.dart';

/// `GET products` query. Category keys: `all`, `on_sale` or a category slug.
class ProductQuery {
  const ProductQuery({
    this.q,
    this.category = 'all',
    this.brand,
    this.vendor,
    this.minRating,
    this.sort = 'featured',
  });

  final String? q;
  final String category;
  final String? brand;
  final String? vendor;
  final double? minRating;

  /// featured | price_low | price_high | top_rated
  final String sort;

  ProductQuery copyWith({
    String? q,
    String? category,
    String? Function()? brand,
    String? Function()? vendor,
    double? Function()? minRating,
    String? sort,
  }) => ProductQuery(
    q: q ?? this.q,
    category: category ?? this.category,
    brand: brand == null ? this.brand : brand(),
    vendor: vendor == null ? this.vendor : vendor(),
    minRating: minRating == null ? this.minRating : minRating(),
    sort: sort ?? this.sort,
  );

  Map<String, dynamic> toParams() => {
    if (q != null && q!.isNotEmpty) 'q': q,
    'category': category,
    'brand': ?brand,
    'vendor': ?vendor,
    'minRating': ?minRating,
    'sort': sort,
  };

  @override
  bool operator ==(Object other) =>
      other is ProductQuery &&
      other.q == q &&
      other.category == category &&
      other.brand == brand &&
      other.vendor == vendor &&
      other.minRating == minRating &&
      other.sort == sort;

  @override
  int get hashCode => Object.hash(q, category, brand, vendor, minRating, sort);
}

/// Catalog, product detail, reviews, brands, official stores, wishlist.
abstract interface class CatalogRepository {
  Future<ProductSearchDto> search(
    ProductQuery query, {
    String? cursor,
    int limit = 20,
  });
  Future<ProductDetailDto> product(String id);
  Future<Page<ReviewDto>> productReviews(String id, {String? cursor});
  Future<ReviewDto> reviewProduct(
    String id, {
    required int rating,
    String? text,
    required IdempotencyKey key,
  });
  Future<List<BrandDto>> brands();
  Future<List<VendorDto>> vendors();
  Future<VendorDto> vendor(String id);
  Future<RatingSummaryDto> vendorRating(String id);
  Future<Page<ReviewDto>> vendorReviews(String id, {String? cursor});
  Future<ReviewDto> reviewVendor(
    String id, {
    required int rating,
    String? text,
    required IdempotencyKey key,
  });
  Future<List<ProductCardDto>> wishlist();
}

@Riverpod(keepAlive: true)
CatalogRepository catalogRepository(Ref ref) =>
    ref.watch(appConfigProvider).isMock
    ? MockCatalogRepository()
    : ApiCatalogRepository(ref.watch(dioProvider));

class ApiCatalogRepository implements CatalogRepository {
  ApiCatalogRepository(this._dio);

  final Dio _dio;

  String _id(String id) => Uri.encodeComponent(id);

  Future<Map<String, dynamic>> _get(String path, [Map<String, dynamic>? q]) =>
      apiCall(() async {
        final res = await _dio.get<Map<String, dynamic>>(
          path,
          queryParameters: q,
        );
        return res.data!;
      });

  Future<List<dynamic>> _getList(String path) => apiCall(() async {
    final res = await _dio.get<List<dynamic>>(path);
    return res.data!;
  });

  @override
  Future<ProductSearchDto> search(
    ProductQuery query, {
    String? cursor,
    int limit = 20,
  }) async => ProductSearchDto.fromJson(
    await _get('products', {
      ...query.toParams(),
      'cursor': ?cursor,
      'limit': limit,
    }),
  );

  @override
  Future<ProductDetailDto> product(String id) async =>
      ProductDetailDto.fromJson(await _get('products/${_id(id)}'));

  @override
  Future<Page<ReviewDto>> productReviews(String id, {String? cursor}) async =>
      Page.fromJson(
        await _get('products/${_id(id)}/reviews', {'cursor': ?cursor}),
        ReviewDto.fromJson,
      );

  @override
  Future<ReviewDto> reviewProduct(
    String id, {
    required int rating,
    String? text,
    required IdempotencyKey key,
  }) => apiCall(() async {
    final res = await _dio.post<Map<String, dynamic>>(
      'products/${_id(id)}/reviews',
      data: {'rating': rating, 'text': ?text},
      options: key.options,
    );
    return ReviewDto.fromJson(res.data!);
  });

  @override
  Future<List<BrandDto>> brands() async => [
    for (final b in await _getList('brands'))
      BrandDto.fromJson(b as Map<String, dynamic>),
  ];

  @override
  Future<List<VendorDto>> vendors() async => [
    for (final v in await _getList('vendors'))
      VendorDto.fromJson(v as Map<String, dynamic>),
  ];

  @override
  Future<VendorDto> vendor(String id) async =>
      VendorDto.fromJson(await _get('vendors/${_id(id)}'));

  @override
  Future<RatingSummaryDto> vendorRating(String id) async =>
      RatingSummaryDto.fromJson(await _get('vendors/${_id(id)}/rating'));

  @override
  Future<Page<ReviewDto>> vendorReviews(String id, {String? cursor}) async =>
      Page.fromJson(
        await _get('vendors/${_id(id)}/reviews', {'cursor': ?cursor}),
        ReviewDto.fromJson,
      );

  @override
  Future<ReviewDto> reviewVendor(
    String id, {
    required int rating,
    String? text,
    required IdempotencyKey key,
  }) => apiCall(() async {
    final res = await _dio.post<Map<String, dynamic>>(
      'vendors/${_id(id)}/reviews',
      data: {'rating': rating, 'text': ?text},
      options: key.options,
    );
    return ReviewDto.fromJson(res.data!);
  });

  @override
  Future<List<ProductCardDto>> wishlist() async => [
    for (final p in await _getList('wishlist'))
      ProductCardDto.fromJson(p as Map<String, dynamic>),
  ];
}

/// Plays the API's part over [MockCatalog] (filtering and sorting happen
/// "server side" here, as they would in the API).
class MockCatalogRepository implements CatalogRepository {
  MockCatalogRepository({this.latency = const Duration(milliseconds: 350)});

  final Duration latency;
  final _myReviews = <String, ReviewDto>{};

  Future<void> _wait() => Future<void>.delayed(latency);

  static const _vendorOf = {
    'VG-WATCH-3': 'xtrasure',
    'VG-IPH-17PM-2TB': 'isure',
    'VG-IPH-17E-256': 'isure',
    'VG-IPH-17P': 'isure',
    'VG-IPH-AIR-1TB': 'isure',
    'VG-IPH-16': 'xtrasure',
  };

  static String _categoryOf(ProductCardDto p) =>
      p.name.toLowerCase().contains('watch') ? 'watches' : 'phones';

  @override
  Future<ProductSearchDto> search(
    ProductQuery query, {
    String? cursor,
    int limit = 20,
  }) async {
    await _wait();
    final q = query.q?.trim().toLowerCase() ?? '';
    var items = MockCatalog.products.where((p) {
      if (q.isNotEmpty &&
          !p.name.toLowerCase().contains(q) &&
          !(p.brand ?? '').toLowerCase().contains(q)) {
        return false;
      }
      if (query.category == 'on_sale' && p.compareAt == null) return false;
      if (query.category != 'all' &&
          query.category != 'on_sale' &&
          _categoryOf(p) != query.category) {
        return false;
      }
      if (query.brand != null && (p.brand ?? '').toLowerCase() != query.brand) {
        return false;
      }
      if (query.vendor != null && _vendorOf[p.id] != query.vendor) {
        return false;
      }
      if (query.minRating != null && (p.rating ?? 0) < query.minRating!) {
        return false;
      }
      return true;
    }).toList();
    switch (query.sort) {
      case 'price_low':
        items.sort((a, b) => a.price.value.compareTo(b.price.value));
      case 'price_high':
        items.sort((a, b) => b.price.value.compareTo(a.price.value));
      case 'top_rated':
        items.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
    }
    final brandHas = query.brand == null
        ? null
        : MockCatalog.products.any(
            (p) => (p.brand ?? '').toLowerCase() == query.brand,
          );
    final all = MockCatalog.products;
    return ProductSearchDto(
      items: items,
      total: items.length,
      brandHasProducts: brandHas,
      facets: SearchFacetsDto(
        categories: [
          FacetDto(key: 'all', label: 'All', count: all.length),
          FacetDto(
            key: 'phones',
            label: 'Phones',
            count: all.where((p) => _categoryOf(p) == 'phones').length,
          ),
          FacetDto(
            key: 'watches',
            label: 'Watches',
            count: all.where((p) => _categoryOf(p) == 'watches').length,
          ),
          FacetDto(
            key: 'on_sale',
            label: 'On Sale',
            count: all.where((p) => p.compareAt != null).length,
          ),
        ],
        brands: const [FacetDto(key: 'apple', label: 'Apple', count: 6)],
        vendors: const [
          FacetDto(key: 'isure', label: 'iSure', count: 4),
          FacetDto(key: 'xtrasure', label: 'XtraSure', count: 2),
          FacetDto(key: 'dyson-care', label: 'Dyson Care', count: 0),
        ],
      ),
    );
  }

  static const _colors = [
    SwatchDto(value: 'BLK', label: 'Space Black', hex: '#14161B'),
    SwatchDto(value: 'SLV', label: 'Silver', hex: '#F1F1F3'),
    SwatchDto(value: 'GLD', label: 'Gold', hex: '#FBEFD5'),
    SwatchDto(value: 'GRY', label: 'Cosmic Gray', hex: '#D9D9DB'),
  ];

  static const _caps = [
    SwatchDto(value: '256', label: '256 GB'),
    SwatchDto(value: '512', label: '512 GB'),
    SwatchDto(value: '1TB', label: '1 TB'),
  ];

  static const _watchSpecs = [
    SpecDto(label: 'Display', value: 'Always-On Retina LTPO'),
    SpecDto(label: 'Sensors', value: 'Heart rate · SpO2 · Sleep'),
    SpecDto(label: 'Battery', value: 'Up to 36 hrs'),
    SpecDto(label: 'Water resistance', value: '50m WR50'),
    SpecDto(label: 'Warranty', value: '1-year official iSure warranty'),
  ];

  static const _phoneSpecs = [
    SpecDto(label: 'Display', value: '6.3" Super Retina XDR · 120Hz'),
    SpecDto(label: 'Chip', value: 'A19 Pro'),
    SpecDto(label: 'Camera', value: '48MP Pro Fusion system'),
    SpecDto(label: 'Battery', value: 'Up to 33 hrs video playback'),
    SpecDto(label: 'Connectivity', value: '5G · Wi-Fi 7 · USB-C'),
    SpecDto(label: 'Warranty', value: '1-year official iSure warranty'),
  ];

  static final _seedReviews = [
    const ReviewDto(
      id: 'r1',
      name: 'Su Myat',
      initial: 'S',
      rating: 5,
      text: 'Sleep tracking is spot on and the band quality is excellent.',
      createdAt: '2026-07-21T04:00:00Z',
      verifiedBuyer: true,
    ),
    const ReviewDto(
      id: 'r2',
      name: 'Aung Ko',
      initial: 'A',
      rating: 5,
      text: 'Bought it with points. Setup took two minutes.',
      createdAt: '2026-07-02T04:00:00Z',
      verifiedBuyer: true,
    ),
    const ReviewDto(
      id: 'r3',
      name: 'Hnin Wai',
      initial: 'H',
      rating: 4,
      text: 'Great screen. Delivery came the same afternoon.',
      createdAt: '2026-06-18T04:00:00Z',
    ),
  ];

  @override
  Future<ProductDetailDto> product(String id) async {
    await _wait();
    final card = MockCatalog.products.firstWhere(
      (p) => p.id == id,
      orElse: () => throw const ApiException(
        code: 'mobile.product_not_found',
        message: "We couldn't find that product.",
        status: 404,
      ),
    );
    final watch = _categoryOf(card) == 'watches';
    final vendorId = _vendorOf[id] ?? 'isure';
    final v = MockCatalog.vendors.firstWhere((x) => x.id == vendorId);
    final base = card.price.value.toInt();
    final compare = card.compareAt?.value.toInt();
    final variants = <VariantDto>[
      for (final c in _colors)
        for (final (i, cap) in (watch ? [null] : _caps).indexed)
          VariantDto(
            sku:
                '${id.substring(3)}-${c.value}${cap == null ? '' : '-${cap.value}'}',
            name:
                '${card.name} · ${c.label}${cap == null ? '' : ' · ${cap.label}'}',
            picks: {'color': c.value, 'capacity': ?cap?.value},
            // Prices come from the server; the mock server prices each
            // capacity step 200,000 higher like the prototype.
            price: MockCatalog.ks(base + i * 200000),
            compareAt: compare == null
                ? null
                : MockCatalog.ks(compare + i * 200000),
            inStock: c.value != 'GRY',
            availableQty: c.value == 'GRY' ? 0 : 9,
            stockText: c.value == 'GRY' ? 'Out of stock' : 'In stock',
          ),
    ];
    final mine = _myReviews[id];
    return ProductDetailDto(
      id: id,
      name: card.name,
      brand: card.brand,
      images: const [
        MockCatalog.productImage,
        'https://surestoremobileapi.yammobots.com/media/hero-whats-new.png',
        MockCatalog.productImage,
      ],
      price: card.price,
      compareAt: card.compareAt,
      discountPercent: card.discountPercent,
      inStock: card.inStock,
      deliveryPromise: 'Get today by 6:00 PM',
      description:
          'Official ${card.brand} product, sourced directly from the brand. '
          'Backed by SureStore TechVault warranty and 3-hour express '
          'delivery across Yangon.',
      warrantyLabel: '1-year official iSure warranty',
      options: [
        const OptionGroupDto(key: 'color', label: 'Color', options: _colors),
        if (!watch)
          const OptionGroupDto(
            key: 'capacity',
            label: 'Capacity',
            options: _caps,
          ),
      ],
      variants: variants,
      defaultSku: variants.first.sku,
      specs: watch ? _watchSpecs : _phoneSpecs,
      seller: SellerDto(
        id: v.id,
        name: v.name,
        initials: v.initials,
        color: v.color,
        backgroundColor: v.backgroundColor,
      ),
      rating: const RatingSummaryDto(
        average: 4.8,
        count: 412,
        distribution: [
          RatingBucketDto(stars: 5, count: 255, percent: 62),
          RatingBucketDto(stars: 4, count: 58, percent: 14),
          RatingBucketDto(stars: 3, count: 58, percent: 14),
          RatingBucketDto(stars: 2, count: 33, percent: 14),
          RatingBucketDto(stars: 1, count: 8, percent: 2),
        ],
      ),
      topReviews: [?mine, ..._seedReviews.take(2)],
      similar: MockCatalog.products.where((p) => p.id != id).toList(),
      homeSetup: HomeSetupOfferDto(
        eligible: true,
        summary: 'Free with this device for Exclusive Members',
        perks: const [
          'Free in-home setup by a certified expert',
          'Data transfer from your old device',
          'A walkthrough of the features you’ll use most',
        ],
        upcoming: [
          for (final b in MockOrderStore.bookings)
            if (b.device == card.name && b.status == 'Scheduled') b.toJson(),
        ],
      ),
      shareUrl: 'https://surestore.app/p/$id',
      freshness: const FreshnessDto(source: 'synced'),
    );
  }

  @override
  Future<Page<ReviewDto>> productReviews(String id, {String? cursor}) async {
    await _wait();
    return Page(items: [?_myReviews[id], ..._seedReviews]);
  }

  @override
  Future<ReviewDto> reviewProduct(
    String id, {
    required int rating,
    String? text,
    required IdempotencyKey key,
  }) async {
    await _wait();
    if (rating < 1 || rating > 5 || (text?.length ?? 0) > 1000) {
      throw const ApiException(
        code: 'mobile.review_invalid',
        message: 'Choose 1 to 5 stars. Reviews can be up to 1,000 characters.',
        status: 400,
      );
    }
    return _myReviews[id] = ReviewDto(
      id: 'mine-$id',
      name: 'You',
      initial: 'Y',
      rating: rating,
      text: text,
      createdAt: DateTime.now().toUtc().toIso8601String(),
      mine: true,
    );
  }

  @override
  Future<List<BrandDto>> brands() async {
    await _wait();
    return [
      for (final b in MockCatalog.brands)
        b.copyWith(productCount: b.id == 'apple' ? 6 : 0),
    ];
  }

  @override
  Future<List<VendorDto>> vendors() async {
    await _wait();
    return MockCatalog.vendors;
  }

  @override
  Future<VendorDto> vendor(String id) async {
    await _wait();
    return MockCatalog.vendors.firstWhere(
      (v) => v.id == id,
      orElse: () => throw const ApiException(
        code: 'mobile.vendor_not_found',
        message: "We couldn't find that store.",
        status: 404,
      ),
    );
  }

  @override
  Future<RatingSummaryDto> vendorRating(String id) async {
    await _wait();
    return const RatingSummaryDto(
      average: 4.9,
      count: 1200,
      distribution: [
        RatingBucketDto(stars: 5, count: 1056, percent: 88),
        RatingBucketDto(stars: 4, count: 108, percent: 9),
        RatingBucketDto(stars: 3, count: 24, percent: 2),
        RatingBucketDto(stars: 2, count: 12, percent: 1),
        RatingBucketDto(stars: 1, count: 0, percent: 0),
      ],
    );
  }

  @override
  Future<Page<ReviewDto>> vendorReviews(String id, {String? cursor}) async {
    await _wait();
    return Page(items: [?_myReviews['vendor:$id'], ..._seedReviews]);
  }

  @override
  Future<ReviewDto> reviewVendor(
    String id, {
    required int rating,
    String? text,
    required IdempotencyKey key,
  }) async {
    final r = await reviewProduct(
      'vendor:$id',
      rating: rating,
      text: text,
      key: key,
    );
    return r;
  }

  @override
  Future<List<ProductCardDto>> wishlist() async {
    await _wait();
    return [
      for (final p in MockCatalog.products)
        if (MockWishlistStore.ids.contains(p.id)) p.copyWith(wished: true),
    ];
  }
}
