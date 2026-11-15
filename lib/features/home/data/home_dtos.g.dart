// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeDto _$HomeDtoFromJson(Map<String, dynamic> json) => _HomeDto(
  hero:
      (json['hero'] as List<dynamic>?)
          ?.map((e) => BannerDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  whatsNew:
      (json['whatsNew'] as List<dynamic>?)
          ?.map((e) => BannerDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  flashDeals: json['flashDeals'] == null
      ? const FlashDealsDto()
      : FlashDealsDto.fromJson(json['flashDeals'] as Map<String, dynamic>),
  brands:
      (json['brands'] as List<dynamic>?)
          ?.map((e) => BrandDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  vendors:
      (json['vendors'] as List<dynamic>?)
          ?.map((e) => VendorDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  forYou: _feedFromJson(json['forYou'] as Map<String, dynamic>?),
  counts: json['counts'] == null
      ? const HomeCountsDto()
      : HomeCountsDto.fromJson(json['counts'] as Map<String, dynamic>),
  deliverTo: json['deliverTo'] == null
      ? null
      : AddressDto.fromJson(json['deliverTo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeDtoToJson(_HomeDto instance) => <String, dynamic>{
  'hero': instance.hero,
  'whatsNew': instance.whatsNew,
  'flashDeals': instance.flashDeals,
  'brands': instance.brands,
  'vendors': instance.vendors,
  'forYou': _feedToJson(instance.forYou),
  'counts': instance.counts,
  'deliverTo': instance.deliverTo,
};

_HomeCountsDto _$HomeCountsDtoFromJson(Map<String, dynamic> json) =>
    _HomeCountsDto(
      unreadNotifications: (json['unreadNotifications'] as num?)?.toInt() ?? 0,
      wishlist: (json['wishlist'] as num?)?.toInt() ?? 0,
      cartItems: (json['cartItems'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$HomeCountsDtoToJson(_HomeCountsDto instance) =>
    <String, dynamic>{
      'unreadNotifications': instance.unreadNotifications,
      'wishlist': instance.wishlist,
      'cartItems': instance.cartItems,
    };

_AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => _AddressDto(
  id: json['id'] as String,
  label: json['label'] as String,
  recipientName: json['recipientName'] as String,
  recipientPhone: json['recipientPhone'] as String,
  line1: json['line1'] as String,
  line2: json['line2'] as String?,
  township: json['township'] as String,
  city: json['city'] as String,
  region: json['region'] as String?,
  instructions: json['instructions'] as String?,
  icon: json['icon'] as String? ?? 'map-pin-house',
  isDefault: json['isDefault'] as bool? ?? false,
  shortLabel: json['shortLabel'] as String,
  fullText: json['fullText'] as String,
);

Map<String, dynamic> _$AddressDtoToJson(_AddressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'recipientName': instance.recipientName,
      'recipientPhone': instance.recipientPhone,
      'line1': instance.line1,
      'line2': instance.line2,
      'township': instance.township,
      'city': instance.city,
      'region': instance.region,
      'instructions': instance.instructions,
      'icon': instance.icon,
      'isDefault': instance.isDefault,
      'shortLabel': instance.shortLabel,
      'fullText': instance.fullText,
    };
