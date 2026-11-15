import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/money.dart';
import '../../catalog/data/catalog_dtos.dart';

part 'home_dtos.freezed.dart';
part 'home_dtos.g.dart';

/// `GET home`: everything on the Home tab in one call.
@freezed
abstract class HomeDto with _$HomeDto {
  const HomeDto._();

  const factory HomeDto({
    @Default([]) List<BannerDto> hero,
    @Default([]) List<BannerDto> whatsNew,
    @Default(FlashDealsDto()) FlashDealsDto flashDeals,
    @Default([]) List<BrandDto> brands,
    @Default([]) List<VendorDto> vendors,
    @JsonKey(fromJson: _feedFromJson, toJson: _feedToJson)
    required Page<ProductCardDto> forYou,
    @Default(HomeCountsDto()) HomeCountsDto counts,
    AddressDto? deliverTo,
  }) = _HomeDto;

  factory HomeDto.fromJson(Map<String, dynamic> json) =>
      _$HomeDtoFromJson(json);
}

Page<ProductCardDto> _feedFromJson(Map<String, dynamic>? json) =>
    Page.fromJson(json ?? const {}, ProductCardDto.fromJson);

Map<String, dynamic> _feedToJson(Page<ProductCardDto> page) => {
  'items': [for (final p in page.items) p.toJson()],
  'nextCursor': page.nextCursor,
};

/// Bell, wishlist and bag badges.
@freezed
abstract class HomeCountsDto with _$HomeCountsDto {
  const factory HomeCountsDto({
    @Default(0) int unreadNotifications,
    @Default(0) int wishlist,
    @Default(0) int cartItems,
  }) = _HomeCountsDto;

  factory HomeCountsDto.fromJson(Map<String, dynamic> json) =>
      _$HomeCountsDtoFromJson(json);
}

@freezed
abstract class AddressDto with _$AddressDto {
  const factory AddressDto({
    required String id,
    required String label,
    required String recipientName,
    required String recipientPhone,
    required String line1,
    String? line2,
    required String township,
    required String city,
    String? region,
    String? instructions,
    @Default('map-pin-house') String icon,
    @Default(false) bool isDefault,
    required String shortLabel,
    required String fullText,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);
}
