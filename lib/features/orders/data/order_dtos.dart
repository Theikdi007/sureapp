import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../shared/models/money.dart';
import '../../cart/data/checkout_dtos.dart';

part 'order_dtos.freezed.dart';
part 'order_dtos.g.dart';

/// Orders tab filter (`OrderTabs`).
enum OrderTab { all, unfulfilled, fulfilled }

/// One row of the Orders tab.
@freezed
abstract class OrderSummaryDto with _$OrderSummaryDto {
  const factory OrderSummaryDto({
    required String number,
    required String placedAt,
    required String status,
    required String statusLabel,

    /// warning | primary | positive | critical
    @Default('primary') String statusColor,
    @Default(false) bool fulfilled,
    required String title,
    String? imageUrl,
    @Default(1) int itemCount,
    required Money total,
    @Default(false) bool express,
    @Default(false) bool hasHomeSetup,
    @Default('') String meta,
  }) = _OrderSummaryDto;

  factory OrderSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryDtoFromJson(json);
}

@freezed
abstract class OrderLineDto with _$OrderLineDto {
  const factory OrderLineDto({
    required String sku,
    required String title,
    String? spec,
    String? imageUrl,
    required num qty,
    required Money unitPrice,
    required Money lineTotal,
  }) = _OrderLineDto;

  factory OrderLineDto.fromJson(Map<String, dynamic> json) =>
      _$OrderLineDtoFromJson(json);
}

@freezed
abstract class OrderStepDto with _$OrderStepDto {
  const factory OrderStepDto({
    required String label,
    String? description,
    String? at,
    @Default(false) bool done,
    @Default(false) bool current,
  }) = _OrderStepDto;

  factory OrderStepDto.fromJson(Map<String, dynamic> json) =>
      _$OrderStepDtoFromJson(json);
}

@freezed
abstract class HomeSetupBookingDto with _$HomeSetupBookingDto {
  const factory HomeSetupBookingDto({
    required String number,
    required String device,
    required String date,
    required String slot,
    required String slotLabel,
    required String status,
    required String statusLabel,
    String? orderNumber,
    String? addressText,
    @Default(false) bool canCancel,
  }) = _HomeSetupBookingDto;

  factory HomeSetupBookingDto.fromJson(Map<String, dynamic> json) =>
      _$HomeSetupBookingDtoFromJson(json);
}

@freezed
abstract class OrderDetailDto with _$OrderDetailDto {
  const factory OrderDetailDto({
    required String number,
    required String placedAt,
    required String status,
    required String statusLabel,
    @Default('primary') String statusColor,
    @Default(false) bool fulfilled,
    @Default(true) bool open,

    /// delivery | pickup
    @Default('delivery') String method,
    required String paymentText,
    required String paymentStatus,
    required String fulfillmentStatus,
    @Default([]) List<OrderLineDto> lines,
    @Default([]) List<OrderStepDto> steps,
    @Default([]) List<SummaryRowDto> summary,
    required Money total,
    String? shipToText,
    String? pickupStore,
    String? trackingText,
    @Default(false) bool express,
    String? etaText,
    HomeSetupBookingDto? homeSetup,
    @Default(false) bool canRate,
    @Default(false) bool rated,
  }) = _OrderDetailDto;

  factory OrderDetailDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailDtoFromJson(json);
}

/// `GET orders/{number}/tracking`. No live map position in this release.
@freezed
abstract class TrackingDto with _$TrackingDto {
  const factory TrackingDto({
    required String number,
    required String statusLabel,
    String? etaText,
    @Default('') String mapLabel,
    String? courierName,
    String? courierPhone,
    @Default([]) List<OrderStepDto> steps,
  }) = _TrackingDto;

  factory TrackingDto.fromJson(Map<String, dynamic> json) =>
      _$TrackingDtoFromJson(json);
}

/// Body of `POST home-setup/bookings`.
@freezed
abstract class BookHomeSetupRequest with _$BookHomeSetupRequest {
  const factory BookHomeSetupRequest({
    String? productId,
    String? device,
    required String date,
    required String slot,
    String? addressId,
    String? orderNumber,
    String? note,
  }) = _BookHomeSetupRequest;

  factory BookHomeSetupRequest.fromJson(Map<String, dynamic> json) =>
      _$BookHomeSetupRequestFromJson(json);
}

extension HomeSetupBookingStatus on HomeSetupBookingDto {
  /// Still to happen. The live API sends `status` in lower case
  /// (`scheduled`, `cancelled`; `statusLabel` is the display text), so the
  /// check ignores case.
  bool get isScheduled => status.toLowerCase() == 'scheduled';

  /// "Fri, 20 Nov · 9:00 – 12:00". `date` is the visit's calendar day
  /// (no time zone), so it is shown as is.
  String get whenLabel {
    final day = DateTime.tryParse(date);
    return day == null
        ? slotLabel
        : '${DateFormat('EEE, d MMM').format(day)} · $slotLabel';
  }
}
