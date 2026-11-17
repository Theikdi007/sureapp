import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/money.dart';
import '../../catalog/data/catalog_dtos.dart';
import '../../home/data/home_dtos.dart';

part 'checkout_dtos.freezed.dart';
part 'checkout_dtos.g.dart';

// ─── Bag ─────────────────────────────────────────────────────────────────

@freezed
abstract class CartLineDto with _$CartLineDto {
  const factory CartLineDto({
    required String id,
    required String productId,
    required String sku,
    required String title,
    String? variantLabel,
    String? imageUrl,
    required int qty,
    required Money unitPrice,
    required Money lineTotal,
    @Default(true) bool inStock,
    String? problem,
  }) = _CartLineDto;

  factory CartLineDto.fromJson(Map<String, dynamic> json) =>
      _$CartLineDtoFromJson(json);
}

/// The bag with last-known prices (checkout re-prices everything).
@freezed
abstract class CartDto with _$CartDto {
  const factory CartDto({
    @Default([]) List<CartLineDto> lines,
    @Default(0) int itemCount,
    required Money subtotal,
  }) = _CartDto;

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);
}

// ─── Checkout ────────────────────────────────────────────────────────────

@freezed
abstract class HomeSetupChoice with _$HomeSetupChoice {
  const factory HomeSetupChoice({required String date, required String slot}) =
      _HomeSetupChoice;

  factory HomeSetupChoice.fromJson(Map<String, dynamic> json) =>
      _$HomeSetupChoiceFromJson(json);
}

/// Body of `POST checkout/quote` and `POST orders`.
@freezed
abstract class CheckoutRequest with _$CheckoutRequest {
  const factory CheckoutRequest({
    /// delivery | pickup
    required String mode,

    /// express | standard (delivery)
    String? shipping,
    String? addressId,
    String? storeCode,

    /// cod (delivery) | pay_at_pickup (pickup)
    String? payment,
    HomeSetupChoice? homeSetup,
    String? note,

    /// The total the member confirmed (placing only).
    num? expectedTotal,
  }) = _CheckoutRequest;

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestFromJson(json);
}

/// Request body without unset fields.
extension CheckoutRequestBody on CheckoutRequest {
  Map<String, dynamic> toBody() =>
      toJson()..removeWhere((_, value) => value == null);
}

@freezed
abstract class CheckoutLineDto with _$CheckoutLineDto {
  const factory CheckoutLineDto({
    required String sku,
    required String productId,
    required String title,
    String? imageUrl,
    required int qty,
    required Money unitPrice,
    required Money lineTotal,
    @Default(true) bool available,
    String? problem,
  }) = _CheckoutLineDto;

  factory CheckoutLineDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutLineDtoFromJson(json);
}

@freezed
abstract class ShippingOptionDto with _$ShippingOptionDto {
  const factory ShippingOptionDto({
    required String code,
    required String title,
    required String description,
    required Money fee,
    @Default(false) bool selected,
    @Default(true) bool enabled,
  }) = _ShippingOptionDto;

  factory ShippingOptionDto.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionDtoFromJson(json);
}

@freezed
abstract class PickupStoreDto with _$PickupStoreDto {
  const factory PickupStoreDto({
    required String code,
    required String name,
    String? address,
    String? distance,
    @Default(true) bool openNow,
    @Default(false) bool selected,
  }) = _PickupStoreDto;

  factory PickupStoreDto.fromJson(Map<String, dynamic> json) =>
      _$PickupStoreDtoFromJson(json);
}

@freezed
abstract class PaymentMethodDto with _$PaymentMethodDto {
  const factory PaymentMethodDto({
    required String code,
    required String title,
    required String description,
    @Default(true) bool enabled,
    @Default(false) bool isDefault,
    String? disabledReason,
  }) = _PaymentMethodDto;

  factory PaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDtoFromJson(json);
}

@freezed
abstract class HomeSetupSlotDto with _$HomeSetupSlotDto {
  const factory HomeSetupSlotDto({
    required String slot,
    required String label,
    @Default(true) bool available,
  }) = _HomeSetupSlotDto;

  factory HomeSetupSlotDto.fromJson(Map<String, dynamic> json) =>
      _$HomeSetupSlotDtoFromJson(json);
}

@freezed
abstract class HomeSetupSlotDayDto with _$HomeSetupSlotDayDto {
  const factory HomeSetupSlotDayDto({
    required String date,
    required String weekday,
    required String day,
    @JsonKey(fromJson: _uniqueSlots) @Default([]) List<HomeSetupSlotDto> slots,
  }) = _HomeSetupSlotDayDto;

  factory HomeSetupSlotDayDto.fromJson(Map<String, dynamic> json) =>
      _$HomeSetupSlotDayDtoFromJson(json);
}

/// The test server lists each slot twice per day; one chip per slot (and
/// one selected chip) needs them unique. First one wins.
List<HomeSetupSlotDto> _uniqueSlots(Object? json) {
  final seen = <String>{};
  return [
    for (final e in (json as List<dynamic>? ?? const []))
      if (HomeSetupSlotDto.fromJson(e as Map<String, dynamic>) case final s
          when seen.add(s.slot))
        s,
  ];
}

/// Points shown at checkout. Paying with points is a later release:
/// `canRedeem` is false and the app doesn't offer it.
@freezed
abstract class CheckoutPointsDto with _$CheckoutPointsDto {
  const factory CheckoutPointsDto({
    @Default(0) int balance,
    @Default(0) int estimatedEarn,
    @Default(false) bool canRedeem,
    @Default('') String hint,
  }) = _CheckoutPointsDto;

  factory CheckoutPointsDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutPointsDtoFromJson(json);
}

@freezed
abstract class SummaryRowDto with _$SummaryRowDto {
  const factory SummaryRowDto({
    required String label,
    required String value,
    Money? amount,
    @Default(false) bool positive,
  }) = _SummaryRowDto;

  factory SummaryRowDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryRowDtoFromJson(json);
}

/// `POST checkout/quote`: everything the Checkout screen shows, priced by
/// SureStore. Place order only while [canPlace]; show [problems].
@freezed
abstract class CheckoutDto with _$CheckoutDto {
  const factory CheckoutDto({
    required String mode,
    @Default([]) List<CheckoutLineDto> lines,
    @Default(0) int itemCount,
    AddressDto? address,
    @Default([]) List<ShippingOptionDto> shippingOptions,
    @Default([]) List<PickupStoreDto> stores,
    @Default([]) List<PaymentMethodDto> payments,
    @Default(false) bool homeSetupEligible,
    @Default([]) List<HomeSetupSlotDayDto> homeSetupDays,
    @Default(CheckoutPointsDto()) CheckoutPointsDto points,
    @Default([]) List<SummaryRowDto> summary,
    required Money subtotal,
    required Money deliveryFee,
    required Money total,
    @Default(false) bool canPlace,
    @JsonKey(fromJson: checkoutProblemsFromJson)
    @Default([])
    List<String> problems,
    FreshnessDto? freshness,
  }) = _CheckoutDto;

  factory CheckoutDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutDtoFromJson(json);
}

/// `POST orders` answer. The full order (`order`) is read by the Orders
/// feature; checkout only needs the summary.
@freezed
abstract class OrderPlacedDto with _$OrderPlacedDto {
  const factory OrderPlacedDto({
    required String number,
    required String deliveryText,
    required String paymentText,
    @Default(0) int estimatedPoints,
    required Money total,
  }) = _OrderPlacedDto;

  factory OrderPlacedDto.fromJson(Map<String, dynamic> json) =>
      _$OrderPlacedDtoFromJson(json);
}

/// `problems[]` as display strings (plain strings or `{message}` objects).
List<String> checkoutProblemsFromJson(Object? raw) => [
  for (final p in (raw as List?) ?? const [])
    if (p is String)
      p
    else if (p is Map && p['message'] is String)
      p['message'] as String,
];
