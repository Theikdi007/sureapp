import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/money.dart';

part 'catalog_dtos.freezed.dart';
part 'catalog_dtos.g.dart';

/// A product tile. `id` is the product key (SKU or VG- code).
@freezed
abstract class ProductCardDto with _$ProductCardDto {
  const factory ProductCardDto({
    required String id,
    required String name,
    String? brand,
    String? imageUrl,
    required Money price,
    Money? compareAt,
    int? discountPercent,
    required bool inStock,
    double? rating,
    @Default(0) int reviewCount,
    @Default(false) bool wished,
    String? defaultSku,
  }) = _ProductCardDto;

  factory ProductCardDto.fromJson(Map<String, dynamic> json) =>
      _$ProductCardDtoFromJson(json);
}

@freezed
abstract class BrandDto with _$BrandDto {
  const factory BrandDto({
    required String id,
    required String name,
    String? logoUrl,
    @Default('') String initial,
    required String color,
    required String backgroundColor,
    @Default(0) int productCount,
  }) = _BrandDto;

  factory BrandDto.fromJson(Map<String, dynamic> json) =>
      _$BrandDtoFromJson(json);
}

/// An official store (vendor).
@freezed
abstract class VendorDto with _$VendorDto {
  const factory VendorDto({
    required String id,
    required String name,
    required String initials,
    required String color,
    required String backgroundColor,
    required String tagline,
    required double rating,
    @Default(0) int ratingCount,
    @Default(0) int followers,
    @Default(0) int productCount,
    @Default(false) bool following,
  }) = _VendorDto;

  factory VendorDto.fromJson(Map<String, dynamic> json) =>
      _$VendorDtoFromJson(json);
}

@freezed
abstract class BannerDto with _$BannerDto {
  const factory BannerDto({
    required String id,
    required String imageUrl,
    String? title,
    String? subtitle,
    required LinkDto link,
  }) = _BannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}

@freezed
abstract class FlashDealsDto with _$FlashDealsDto {
  const factory FlashDealsDto({
    String? endsAt,
    @Default([]) List<ProductCardDto> items,
  }) = _FlashDealsDto;

  factory FlashDealsDto.fromJson(Map<String, dynamic> json) =>
      _$FlashDealsDtoFromJson(json);
}

/// Parses API colors: `#RRGGBB`, `#AARRGGBB` or `rgb(r,g,b)`.
int? parseApiColor(String? raw) {
  if (raw == null) return null;
  final s = raw.trim();
  if (s.startsWith('#')) {
    final hex = s.substring(1);
    if (hex.length == 6) return int.tryParse('FF$hex', radix: 16);
    if (hex.length == 8) return int.tryParse(hex, radix: 16);
    return null;
  }
  final m = RegExp(r'rgba?\((\d+),\s*(\d+),\s*(\d+)').firstMatch(s);
  if (m == null) return null;
  final r = int.parse(m.group(1)!);
  final g = int.parse(m.group(2)!);
  final b = int.parse(m.group(3)!);
  return 0xFF000000 | (r << 16) | (g << 8) | b;
}

// ─── Search ──────────────────────────────────────────────────────────────

@freezed
abstract class FacetDto with _$FacetDto {
  const factory FacetDto({
    required String key,
    required String label,
    @Default(0) int count,
  }) = _FacetDto;

  factory FacetDto.fromJson(Map<String, dynamic> json) =>
      _$FacetDtoFromJson(json);
}

@freezed
abstract class SearchFacetsDto with _$SearchFacetsDto {
  const factory SearchFacetsDto({
    @Default([]) List<FacetDto> categories,
    @Default([]) List<FacetDto> brands,
    @Default([]) List<FacetDto> vendors,
  }) = _SearchFacetsDto;

  factory SearchFacetsDto.fromJson(Map<String, dynamic> json) =>
      _$SearchFacetsDtoFromJson(json);
}

/// `GET products`: one page of results; `total` counts every match,
/// `brandHasProducts == false` means "New arrivals coming soon".
@freezed
abstract class ProductSearchDto with _$ProductSearchDto {
  const factory ProductSearchDto({
    @Default([]) List<ProductCardDto> items,
    String? nextCursor,
    @Default(0) int total,
    bool? brandHasProducts,
    @Default(SearchFacetsDto()) SearchFacetsDto facets,
  }) = _ProductSearchDto;

  factory ProductSearchDto.fromJson(Map<String, dynamic> json) =>
      _$ProductSearchDtoFromJson(json);
}

// ─── Product detail ──────────────────────────────────────────────────────

@freezed
abstract class SwatchDto with _$SwatchDto {
  const factory SwatchDto({
    required String value,
    required String label,
    String? hex,
    @Default(true) bool available,
  }) = _SwatchDto;

  factory SwatchDto.fromJson(Map<String, dynamic> json) =>
      _$SwatchDtoFromJson(json);
}

@freezed
abstract class OptionGroupDto with _$OptionGroupDto {
  const factory OptionGroupDto({
    required String key,
    required String label,
    @Default([]) List<SwatchDto> options,
  }) = _OptionGroupDto;

  factory OptionGroupDto.fromJson(Map<String, dynamic> json) =>
      _$OptionGroupDtoFromJson(json);
}

@freezed
abstract class VariantDto with _$VariantDto {
  const factory VariantDto({
    required String sku,
    required String name,
    @Default({}) Map<String, String> picks,
    required Money price,
    Money? compareAt,
    required bool inStock,
    int? availableQty,
    required String stockText,
  }) = _VariantDto;

  factory VariantDto.fromJson(Map<String, dynamic> json) =>
      _$VariantDtoFromJson(json);
}

@freezed
abstract class SpecDto with _$SpecDto {
  const factory SpecDto({required String label, required String value}) =
      _SpecDto;

  factory SpecDto.fromJson(Map<String, dynamic> json) =>
      _$SpecDtoFromJson(json);
}

@freezed
abstract class SellerDto with _$SellerDto {
  const factory SellerDto({
    required String id,
    required String name,
    required String initials,
    required String color,
    required String backgroundColor,
  }) = _SellerDto;

  factory SellerDto.fromJson(Map<String, dynamic> json) =>
      _$SellerDtoFromJson(json);
}

@freezed
abstract class RatingBucketDto with _$RatingBucketDto {
  const factory RatingBucketDto({
    required int stars,
    @Default(0) int count,
    @Default(0) num percent,
  }) = _RatingBucketDto;

  factory RatingBucketDto.fromJson(Map<String, dynamic> json) =>
      _$RatingBucketDtoFromJson(json);
}

@freezed
abstract class RatingSummaryDto with _$RatingSummaryDto {
  const factory RatingSummaryDto({
    @Default(0) num average,
    @Default(0) int count,
    @Default([]) List<RatingBucketDto> distribution,
  }) = _RatingSummaryDto;

  factory RatingSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$RatingSummaryDtoFromJson(json);
}

@freezed
abstract class ReviewDto with _$ReviewDto {
  const factory ReviewDto({
    required String id,
    required String name,
    @Default('') String initial,
    required int rating,
    String? text,
    required String createdAt,
    @Default(false) bool verifiedBuyer,
    @Default(false) bool mine,
  }) = _ReviewDto;

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);
}

@freezed
abstract class HomeSetupOfferDto with _$HomeSetupOfferDto {
  const factory HomeSetupOfferDto({
    @Default(false) bool eligible,
    @Default('') String summary,
    @Default([]) List<String> perks,

    /// The member's booked visits for this product (`HomeSetupBookingDto`),
    /// kept raw here; the Orders feature parses them.
    @Default([]) List<Map<String, dynamic>> upcoming,
  }) = _HomeSetupOfferDto;

  factory HomeSetupOfferDto.fromJson(Map<String, dynamic> json) =>
      _$HomeSetupOfferDtoFromJson(json);
}

/// Freshness of price and stock: `synced`/`fresh` are live; `stale`/`busy`
/// are last-known; `off`/`skipped` aren't checked.
@freezed
abstract class FreshnessDto with _$FreshnessDto {
  const FreshnessDto._();

  const factory FreshnessDto({
    required String source,
    String? checkedAt,
    String? syncedAt,
  }) = _FreshnessDto;

  factory FreshnessDto.fromJson(Map<String, dynamic> json) =>
      _$FreshnessDtoFromJson(json);

  bool get isLive => source == 'synced' || source == 'fresh';
}

@freezed
abstract class ProductDetailDto with _$ProductDetailDto {
  const factory ProductDetailDto({
    required String id,
    required String name,
    String? nameMy,
    String? brand,
    @Default([]) List<String> images,
    required Money price,
    Money? compareAt,
    int? discountPercent,
    required bool inStock,
    String? deliveryPromise,
    String? description,
    String? warrantyLabel,
    @Default([]) List<OptionGroupDto> options,
    @Default([]) List<VariantDto> variants,
    String? defaultSku,
    @Default([]) List<SpecDto> specs,
    SellerDto? seller,
    @Default(RatingSummaryDto()) RatingSummaryDto rating,
    @Default([]) List<ReviewDto> topReviews,
    @Default([]) List<ProductCardDto> similar,
    @Default(HomeSetupOfferDto()) HomeSetupOfferDto homeSetup,
    @Default(false) bool wished,
    @Default('') String shareUrl,
    FreshnessDto? freshness,
  }) = _ProductDetailDto;

  factory ProductDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailDtoFromJson(json);
}
