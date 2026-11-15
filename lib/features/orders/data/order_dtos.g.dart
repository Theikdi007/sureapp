// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderSummaryDto _$OrderSummaryDtoFromJson(Map<String, dynamic> json) =>
    _OrderSummaryDto(
      number: json['number'] as String,
      placedAt: json['placedAt'] as String,
      status: json['status'] as String,
      statusLabel: json['statusLabel'] as String,
      statusColor: json['statusColor'] as String? ?? 'primary',
      fulfilled: json['fulfilled'] as bool? ?? false,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      itemCount: (json['itemCount'] as num?)?.toInt() ?? 1,
      total: Money.fromJson(json['total'] as Map<String, dynamic>),
      express: json['express'] as bool? ?? false,
      hasHomeSetup: json['hasHomeSetup'] as bool? ?? false,
      meta: json['meta'] as String? ?? '',
    );

Map<String, dynamic> _$OrderSummaryDtoToJson(_OrderSummaryDto instance) =>
    <String, dynamic>{
      'number': instance.number,
      'placedAt': instance.placedAt,
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'statusColor': instance.statusColor,
      'fulfilled': instance.fulfilled,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'itemCount': instance.itemCount,
      'total': instance.total,
      'express': instance.express,
      'hasHomeSetup': instance.hasHomeSetup,
      'meta': instance.meta,
    };

_OrderLineDto _$OrderLineDtoFromJson(Map<String, dynamic> json) =>
    _OrderLineDto(
      sku: json['sku'] as String,
      title: json['title'] as String,
      spec: json['spec'] as String?,
      imageUrl: json['imageUrl'] as String?,
      qty: json['qty'] as num,
      unitPrice: Money.fromJson(json['unitPrice'] as Map<String, dynamic>),
      lineTotal: Money.fromJson(json['lineTotal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderLineDtoToJson(_OrderLineDto instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'title': instance.title,
      'spec': instance.spec,
      'imageUrl': instance.imageUrl,
      'qty': instance.qty,
      'unitPrice': instance.unitPrice,
      'lineTotal': instance.lineTotal,
    };

_OrderStepDto _$OrderStepDtoFromJson(Map<String, dynamic> json) =>
    _OrderStepDto(
      label: json['label'] as String,
      description: json['description'] as String?,
      at: json['at'] as String?,
      done: json['done'] as bool? ?? false,
      current: json['current'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderStepDtoToJson(_OrderStepDto instance) =>
    <String, dynamic>{
      'label': instance.label,
      'description': instance.description,
      'at': instance.at,
      'done': instance.done,
      'current': instance.current,
    };

_HomeSetupBookingDto _$HomeSetupBookingDtoFromJson(Map<String, dynamic> json) =>
    _HomeSetupBookingDto(
      number: json['number'] as String,
      device: json['device'] as String,
      date: json['date'] as String,
      slot: json['slot'] as String,
      slotLabel: json['slotLabel'] as String,
      status: json['status'] as String,
      statusLabel: json['statusLabel'] as String,
      orderNumber: json['orderNumber'] as String?,
      addressText: json['addressText'] as String?,
      canCancel: json['canCancel'] as bool? ?? false,
    );

Map<String, dynamic> _$HomeSetupBookingDtoToJson(
  _HomeSetupBookingDto instance,
) => <String, dynamic>{
  'number': instance.number,
  'device': instance.device,
  'date': instance.date,
  'slot': instance.slot,
  'slotLabel': instance.slotLabel,
  'status': instance.status,
  'statusLabel': instance.statusLabel,
  'orderNumber': instance.orderNumber,
  'addressText': instance.addressText,
  'canCancel': instance.canCancel,
};

_OrderDetailDto _$OrderDetailDtoFromJson(Map<String, dynamic> json) =>
    _OrderDetailDto(
      number: json['number'] as String,
      placedAt: json['placedAt'] as String,
      status: json['status'] as String,
      statusLabel: json['statusLabel'] as String,
      statusColor: json['statusColor'] as String? ?? 'primary',
      fulfilled: json['fulfilled'] as bool? ?? false,
      open: json['open'] as bool? ?? true,
      method: json['method'] as String? ?? 'delivery',
      paymentText: json['paymentText'] as String,
      paymentStatus: json['paymentStatus'] as String,
      fulfillmentStatus: json['fulfillmentStatus'] as String,
      lines:
          (json['lines'] as List<dynamic>?)
              ?.map((e) => OrderLineDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      steps:
          (json['steps'] as List<dynamic>?)
              ?.map((e) => OrderStepDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      summary:
          (json['summary'] as List<dynamic>?)
              ?.map((e) => SummaryRowDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: Money.fromJson(json['total'] as Map<String, dynamic>),
      shipToText: json['shipToText'] as String?,
      pickupStore: json['pickupStore'] as String?,
      trackingText: json['trackingText'] as String?,
      express: json['express'] as bool? ?? false,
      etaText: json['etaText'] as String?,
      homeSetup: json['homeSetup'] == null
          ? null
          : HomeSetupBookingDto.fromJson(
              json['homeSetup'] as Map<String, dynamic>,
            ),
      canRate: json['canRate'] as bool? ?? false,
      rated: json['rated'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderDetailDtoToJson(_OrderDetailDto instance) =>
    <String, dynamic>{
      'number': instance.number,
      'placedAt': instance.placedAt,
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'statusColor': instance.statusColor,
      'fulfilled': instance.fulfilled,
      'open': instance.open,
      'method': instance.method,
      'paymentText': instance.paymentText,
      'paymentStatus': instance.paymentStatus,
      'fulfillmentStatus': instance.fulfillmentStatus,
      'lines': instance.lines,
      'steps': instance.steps,
      'summary': instance.summary,
      'total': instance.total,
      'shipToText': instance.shipToText,
      'pickupStore': instance.pickupStore,
      'trackingText': instance.trackingText,
      'express': instance.express,
      'etaText': instance.etaText,
      'homeSetup': instance.homeSetup,
      'canRate': instance.canRate,
      'rated': instance.rated,
    };

_TrackingDto _$TrackingDtoFromJson(Map<String, dynamic> json) => _TrackingDto(
  number: json['number'] as String,
  statusLabel: json['statusLabel'] as String,
  etaText: json['etaText'] as String?,
  mapLabel: json['mapLabel'] as String? ?? '',
  courierName: json['courierName'] as String?,
  courierPhone: json['courierPhone'] as String?,
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map((e) => OrderStepDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TrackingDtoToJson(_TrackingDto instance) =>
    <String, dynamic>{
      'number': instance.number,
      'statusLabel': instance.statusLabel,
      'etaText': instance.etaText,
      'mapLabel': instance.mapLabel,
      'courierName': instance.courierName,
      'courierPhone': instance.courierPhone,
      'steps': instance.steps,
    };

_BookHomeSetupRequest _$BookHomeSetupRequestFromJson(
  Map<String, dynamic> json,
) => _BookHomeSetupRequest(
  productId: json['productId'] as String?,
  device: json['device'] as String?,
  date: json['date'] as String,
  slot: json['slot'] as String,
  addressId: json['addressId'] as String?,
  orderNumber: json['orderNumber'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$BookHomeSetupRequestToJson(
  _BookHomeSetupRequest instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'device': instance.device,
  'date': instance.date,
  'slot': instance.slot,
  'addressId': instance.addressId,
  'orderNumber': instance.orderNumber,
  'note': instance.note,
};
