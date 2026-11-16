import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import 'catalog_dtos.dart';

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

  /// Follow / unfollow a store; answers the store with `following` updated.
  Future<VendorDto> follow(String id);
  Future<VendorDto> unfollow(String id);
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
    ApiCatalogRepository(ref.watch(dioProvider));

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
  Future<VendorDto> follow(String id) => apiCall(() async {
    final res = await _dio.put<Map<String, dynamic>>(
      'vendors/${_id(id)}/follow',
    );
    return VendorDto.fromJson(res.data!);
  });

  @override
  Future<VendorDto> unfollow(String id) => apiCall(() async {
    final res = await _dio.delete<Map<String, dynamic>>(
      'vendors/${_id(id)}/follow',
    );
    return VendorDto.fromJson(res.data!);
  });

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
