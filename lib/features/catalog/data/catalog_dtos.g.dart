// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductCardDto _$ProductCardDtoFromJson(Map<String, dynamic> json) =>
    _ProductCardDto(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: Money.fromJson(json['price'] as Map<String, dynamic>),
      compareAt: json['compareAt'] == null
          ? null
          : Money.fromJson(json['compareAt'] as Map<String, dynamic>),
      discountPercent: (json['discountPercent'] as num?)?.toInt(),
      inStock: json['inStock'] as bool,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      wished: json['wished'] as bool? ?? false,
      defaultSku: json['defaultSku'] as String?,
    );

Map<String, dynamic> _$ProductCardDtoToJson(_ProductCardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'compareAt': instance.compareAt,
      'discountPercent': instance.discountPercent,
      'inStock': instance.inStock,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'wished': instance.wished,
      'defaultSku': instance.defaultSku,
    };

_BrandDto _$BrandDtoFromJson(Map<String, dynamic> json) => _BrandDto(
  id: json['id'] as String,
  name: json['name'] as String,
  logoUrl: json['logoUrl'] as String?,
  initial: json['initial'] as String? ?? '',
  color: json['color'] as String,
  backgroundColor: json['backgroundColor'] as String,
  productCount: (json['productCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BrandDtoToJson(_BrandDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logoUrl': instance.logoUrl,
  'initial': instance.initial,
  'color': instance.color,
  'backgroundColor': instance.backgroundColor,
  'productCount': instance.productCount,
};

_VendorDto _$VendorDtoFromJson(Map<String, dynamic> json) => _VendorDto(
  id: json['id'] as String,
  name: json['name'] as String,
  initials: json['initials'] as String,
  color: json['color'] as String,
  backgroundColor: json['backgroundColor'] as String,
  tagline: json['tagline'] as String,
  rating: (json['rating'] as num).toDouble(),
  ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
  followers: (json['followers'] as num?)?.toInt() ?? 0,
  productCount: (json['productCount'] as num?)?.toInt() ?? 0,
  following: json['following'] as bool? ?? false,
);

Map<String, dynamic> _$VendorDtoToJson(_VendorDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'initials': instance.initials,
      'color': instance.color,
      'backgroundColor': instance.backgroundColor,
      'tagline': instance.tagline,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'followers': instance.followers,
      'productCount': instance.productCount,
      'following': instance.following,
    };

_BannerDto _$BannerDtoFromJson(Map<String, dynamic> json) => _BannerDto(
  id: json['id'] as String,
  imageUrl: json['imageUrl'] as String,
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  link: LinkDto.fromJson(json['link'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BannerDtoToJson(_BannerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'link': instance.link,
    };

_FlashDealsDto _$FlashDealsDtoFromJson(Map<String, dynamic> json) =>
    _FlashDealsDto(
      endsAt: json['endsAt'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ProductCardDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FlashDealsDtoToJson(_FlashDealsDto instance) =>
    <String, dynamic>{'endsAt': instance.endsAt, 'items': instance.items};

_FacetDto _$FacetDtoFromJson(Map<String, dynamic> json) => _FacetDto(
  key: json['key'] as String,
  label: json['label'] as String,
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$FacetDtoToJson(_FacetDto instance) => <String, dynamic>{
  'key': instance.key,
  'label': instance.label,
  'count': instance.count,
};

_SearchFacetsDto _$SearchFacetsDtoFromJson(Map<String, dynamic> json) =>
    _SearchFacetsDto(
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => FacetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      brands:
          (json['brands'] as List<dynamic>?)
              ?.map((e) => FacetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      vendors:
          (json['vendors'] as List<dynamic>?)
              ?.map((e) => FacetDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchFacetsDtoToJson(_SearchFacetsDto instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'brands': instance.brands,
      'vendors': instance.vendors,
    };

_ProductSearchDto _$ProductSearchDtoFromJson(Map<String, dynamic> json) =>
    _ProductSearchDto(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ProductCardDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextCursor: json['nextCursor'] as String?,
      total: (json['total'] as num?)?.toInt() ?? 0,
      brandHasProducts: json['brandHasProducts'] as bool?,
      facets: json['facets'] == null
          ? const SearchFacetsDto()
          : SearchFacetsDto.fromJson(json['facets'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductSearchDtoToJson(_ProductSearchDto instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextCursor': instance.nextCursor,
      'total': instance.total,
      'brandHasProducts': instance.brandHasProducts,
      'facets': instance.facets,
    };

_SwatchDto _$SwatchDtoFromJson(Map<String, dynamic> json) => _SwatchDto(
  value: json['value'] as String,
  label: json['label'] as String,
  hex: json['hex'] as String?,
  available: json['available'] as bool? ?? true,
);

Map<String, dynamic> _$SwatchDtoToJson(_SwatchDto instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'hex': instance.hex,
      'available': instance.available,
    };

_OptionGroupDto _$OptionGroupDtoFromJson(Map<String, dynamic> json) =>
    _OptionGroupDto(
      key: json['key'] as String,
      label: json['label'] as String,
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => SwatchDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OptionGroupDtoToJson(_OptionGroupDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'options': instance.options,
    };

_VariantDto _$VariantDtoFromJson(Map<String, dynamic> json) => _VariantDto(
  sku: json['sku'] as String,
  name: json['name'] as String,
  picks:
      (json['picks'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
  price: Money.fromJson(json['price'] as Map<String, dynamic>),
  compareAt: json['compareAt'] == null
      ? null
      : Money.fromJson(json['compareAt'] as Map<String, dynamic>),
  inStock: json['inStock'] as bool,
  availableQty: (json['availableQty'] as num?)?.toInt(),
  stockText: json['stockText'] as String,
);

Map<String, dynamic> _$VariantDtoToJson(_VariantDto instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'name': instance.name,
      'picks': instance.picks,
      'price': instance.price,
      'compareAt': instance.compareAt,
      'inStock': instance.inStock,
      'availableQty': instance.availableQty,
      'stockText': instance.stockText,
    };

_SpecDto _$SpecDtoFromJson(Map<String, dynamic> json) =>
    _SpecDto(label: json['label'] as String, value: json['value'] as String);

Map<String, dynamic> _$SpecDtoToJson(_SpecDto instance) => <String, dynamic>{
  'label': instance.label,
  'value': instance.value,
};

_SellerDto _$SellerDtoFromJson(Map<String, dynamic> json) => _SellerDto(
  id: json['id'] as String,
  name: json['name'] as String,
  initials: json['initials'] as String,
  color: json['color'] as String,
  backgroundColor: json['backgroundColor'] as String,
);

Map<String, dynamic> _$SellerDtoToJson(_SellerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'initials': instance.initials,
      'color': instance.color,
      'backgroundColor': instance.backgroundColor,
    };

_RatingBucketDto _$RatingBucketDtoFromJson(Map<String, dynamic> json) =>
    _RatingBucketDto(
      stars: (json['stars'] as num).toInt(),
      count: (json['count'] as num?)?.toInt() ?? 0,
      percent: json['percent'] as num? ?? 0,
    );

Map<String, dynamic> _$RatingBucketDtoToJson(_RatingBucketDto instance) =>
    <String, dynamic>{
      'stars': instance.stars,
      'count': instance.count,
      'percent': instance.percent,
    };

_RatingSummaryDto _$RatingSummaryDtoFromJson(Map<String, dynamic> json) =>
    _RatingSummaryDto(
      average: json['average'] as num? ?? 0,
      count: (json['count'] as num?)?.toInt() ?? 0,
      distribution:
          (json['distribution'] as List<dynamic>?)
              ?.map((e) => RatingBucketDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RatingSummaryDtoToJson(_RatingSummaryDto instance) =>
    <String, dynamic>{
      'average': instance.average,
      'count': instance.count,
      'distribution': instance.distribution,
    };

_ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => _ReviewDto(
  id: json['id'] as String,
  name: json['name'] as String,
  initial: json['initial'] as String? ?? '',
  rating: (json['rating'] as num).toInt(),
  text: json['text'] as String?,
  createdAt: json['createdAt'] as String,
  verifiedBuyer: json['verifiedBuyer'] as bool? ?? false,
  mine: json['mine'] as bool? ?? false,
);

Map<String, dynamic> _$ReviewDtoToJson(_ReviewDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'initial': instance.initial,
      'rating': instance.rating,
      'text': instance.text,
      'createdAt': instance.createdAt,
      'verifiedBuyer': instance.verifiedBuyer,
      'mine': instance.mine,
    };

_HomeSetupOfferDto _$HomeSetupOfferDtoFromJson(Map<String, dynamic> json) =>
    _HomeSetupOfferDto(
      eligible: json['eligible'] as bool? ?? false,
      summary: json['summary'] as String? ?? '',
      perks:
          (json['perks'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      upcoming:
          (json['upcoming'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeSetupOfferDtoToJson(_HomeSetupOfferDto instance) =>
    <String, dynamic>{
      'eligible': instance.eligible,
      'summary': instance.summary,
      'perks': instance.perks,
      'upcoming': instance.upcoming,
    };

_FreshnessDto _$FreshnessDtoFromJson(Map<String, dynamic> json) =>
    _FreshnessDto(
      source: json['source'] as String,
      checkedAt: json['checkedAt'] as String?,
      syncedAt: json['syncedAt'] as String?,
    );

Map<String, dynamic> _$FreshnessDtoToJson(_FreshnessDto instance) =>
    <String, dynamic>{
      'source': instance.source,
      'checkedAt': instance.checkedAt,
      'syncedAt': instance.syncedAt,
    };

_ProductDetailDto _$ProductDetailDtoFromJson(
  Map<String, dynamic> json,
) => _ProductDetailDto(
  id: json['id'] as String,
  name: json['name'] as String,
  nameMy: json['nameMy'] as String?,
  brand: json['brand'] as String?,
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  price: Money.fromJson(json['price'] as Map<String, dynamic>),
  compareAt: json['compareAt'] == null
      ? null
      : Money.fromJson(json['compareAt'] as Map<String, dynamic>),
  discountPercent: (json['discountPercent'] as num?)?.toInt(),
  inStock: json['inStock'] as bool,
  deliveryPromise: json['deliveryPromise'] as String?,
  description: json['description'] as String?,
  warrantyLabel: json['warrantyLabel'] as String?,
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => OptionGroupDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  variants:
      (json['variants'] as List<dynamic>?)
          ?.map((e) => VariantDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  defaultSku: json['defaultSku'] as String?,
  specs:
      (json['specs'] as List<dynamic>?)
          ?.map((e) => SpecDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  seller: json['seller'] == null
      ? null
      : SellerDto.fromJson(json['seller'] as Map<String, dynamic>),
  rating: json['rating'] == null
      ? const RatingSummaryDto()
      : RatingSummaryDto.fromJson(json['rating'] as Map<String, dynamic>),
  topReviews:
      (json['topReviews'] as List<dynamic>?)
          ?.map((e) => ReviewDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  similar:
      (json['similar'] as List<dynamic>?)
          ?.map((e) => ProductCardDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  homeSetup: json['homeSetup'] == null
      ? const HomeSetupOfferDto()
      : HomeSetupOfferDto.fromJson(json['homeSetup'] as Map<String, dynamic>),
  wished: json['wished'] as bool? ?? false,
  shareUrl: json['shareUrl'] as String? ?? '',
  freshness: json['freshness'] == null
      ? null
      : FreshnessDto.fromJson(json['freshness'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductDetailDtoToJson(_ProductDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameMy': instance.nameMy,
      'brand': instance.brand,
      'images': instance.images,
      'price': instance.price,
      'compareAt': instance.compareAt,
      'discountPercent': instance.discountPercent,
      'inStock': instance.inStock,
      'deliveryPromise': instance.deliveryPromise,
      'description': instance.description,
      'warrantyLabel': instance.warrantyLabel,
      'options': instance.options,
      'variants': instance.variants,
      'defaultSku': instance.defaultSku,
      'specs': instance.specs,
      'seller': instance.seller,
      'rating': instance.rating,
      'topReviews': instance.topReviews,
      'similar': instance.similar,
      'homeSetup': instance.homeSetup,
      'wished': instance.wished,
      'shareUrl': instance.shareUrl,
      'freshness': instance.freshness,
    };
