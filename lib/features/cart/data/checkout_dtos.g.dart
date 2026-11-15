// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartLineDto _$CartLineDtoFromJson(Map<String, dynamic> json) => _CartLineDto(
  id: json['id'] as String,
  productId: json['productId'] as String,
  sku: json['sku'] as String,
  title: json['title'] as String,
  variantLabel: json['variantLabel'] as String?,
  imageUrl: json['imageUrl'] as String?,
  qty: (json['qty'] as num).toInt(),
  unitPrice: Money.fromJson(json['unitPrice'] as Map<String, dynamic>),
  lineTotal: Money.fromJson(json['lineTotal'] as Map<String, dynamic>),
  inStock: json['inStock'] as bool? ?? true,
  problem: json['problem'] as String?,
);

Map<String, dynamic> _$CartLineDtoToJson(_CartLineDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'sku': instance.sku,
      'title': instance.title,
      'variantLabel': instance.variantLabel,
      'imageUrl': instance.imageUrl,
      'qty': instance.qty,
      'unitPrice': instance.unitPrice,
      'lineTotal': instance.lineTotal,
      'inStock': instance.inStock,
      'problem': instance.problem,
    };

_CartDto _$CartDtoFromJson(Map<String, dynamic> json) => _CartDto(
  lines:
      (json['lines'] as List<dynamic>?)
          ?.map((e) => CartLineDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
  subtotal: Money.fromJson(json['subtotal'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartDtoToJson(_CartDto instance) => <String, dynamic>{
  'lines': instance.lines,
  'itemCount': instance.itemCount,
  'subtotal': instance.subtotal,
};

_HomeSetupChoice _$HomeSetupChoiceFromJson(Map<String, dynamic> json) =>
    _HomeSetupChoice(
      date: json['date'] as String,
      slot: json['slot'] as String,
    );

Map<String, dynamic> _$HomeSetupChoiceToJson(_HomeSetupChoice instance) =>
    <String, dynamic>{'date': instance.date, 'slot': instance.slot};

_CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    _CheckoutRequest(
      mode: json['mode'] as String,
      shipping: json['shipping'] as String?,
      addressId: json['addressId'] as String?,
      storeCode: json['storeCode'] as String?,
      payment: json['payment'] as String?,
      homeSetup: json['homeSetup'] == null
          ? null
          : HomeSetupChoice.fromJson(json['homeSetup'] as Map<String, dynamic>),
      note: json['note'] as String?,
      expectedTotal: json['expectedTotal'] as num?,
    );

Map<String, dynamic> _$CheckoutRequestToJson(_CheckoutRequest instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'shipping': instance.shipping,
      'addressId': instance.addressId,
      'storeCode': instance.storeCode,
      'payment': instance.payment,
      'homeSetup': instance.homeSetup,
      'note': instance.note,
      'expectedTotal': instance.expectedTotal,
    };

_CheckoutLineDto _$CheckoutLineDtoFromJson(Map<String, dynamic> json) =>
    _CheckoutLineDto(
      sku: json['sku'] as String,
      productId: json['productId'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      qty: (json['qty'] as num).toInt(),
      unitPrice: Money.fromJson(json['unitPrice'] as Map<String, dynamic>),
      lineTotal: Money.fromJson(json['lineTotal'] as Map<String, dynamic>),
      available: json['available'] as bool? ?? true,
      problem: json['problem'] as String?,
    );

Map<String, dynamic> _$CheckoutLineDtoToJson(_CheckoutLineDto instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'productId': instance.productId,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'qty': instance.qty,
      'unitPrice': instance.unitPrice,
      'lineTotal': instance.lineTotal,
      'available': instance.available,
      'problem': instance.problem,
    };

_ShippingOptionDto _$ShippingOptionDtoFromJson(Map<String, dynamic> json) =>
    _ShippingOptionDto(
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      fee: Money.fromJson(json['fee'] as Map<String, dynamic>),
      selected: json['selected'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$ShippingOptionDtoToJson(_ShippingOptionDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'fee': instance.fee,
      'selected': instance.selected,
      'enabled': instance.enabled,
    };

_PickupStoreDto _$PickupStoreDtoFromJson(Map<String, dynamic> json) =>
    _PickupStoreDto(
      code: json['code'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
      distance: json['distance'] as String?,
      openNow: json['openNow'] as bool? ?? true,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$PickupStoreDtoToJson(_PickupStoreDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'address': instance.address,
      'distance': instance.distance,
      'openNow': instance.openNow,
      'selected': instance.selected,
    };

_PaymentMethodDto _$PaymentMethodDtoFromJson(Map<String, dynamic> json) =>
    _PaymentMethodDto(
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      enabled: json['enabled'] as bool? ?? true,
      isDefault: json['isDefault'] as bool? ?? false,
      disabledReason: json['disabledReason'] as String?,
    );

Map<String, dynamic> _$PaymentMethodDtoToJson(_PaymentMethodDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'description': instance.description,
      'enabled': instance.enabled,
      'isDefault': instance.isDefault,
      'disabledReason': instance.disabledReason,
    };

_HomeSetupSlotDto _$HomeSetupSlotDtoFromJson(Map<String, dynamic> json) =>
    _HomeSetupSlotDto(
      slot: json['slot'] as String,
      label: json['label'] as String,
      available: json['available'] as bool? ?? true,
    );

Map<String, dynamic> _$HomeSetupSlotDtoToJson(_HomeSetupSlotDto instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'label': instance.label,
      'available': instance.available,
    };

_HomeSetupSlotDayDto _$HomeSetupSlotDayDtoFromJson(Map<String, dynamic> json) =>
    _HomeSetupSlotDayDto(
      date: json['date'] as String,
      weekday: json['weekday'] as String,
      day: json['day'] as String,
      slots:
          (json['slots'] as List<dynamic>?)
              ?.map((e) => HomeSetupSlotDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeSetupSlotDayDtoToJson(
  _HomeSetupSlotDayDto instance,
) => <String, dynamic>{
  'date': instance.date,
  'weekday': instance.weekday,
  'day': instance.day,
  'slots': instance.slots,
};

_CheckoutPointsDto _$CheckoutPointsDtoFromJson(Map<String, dynamic> json) =>
    _CheckoutPointsDto(
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      estimatedEarn: (json['estimatedEarn'] as num?)?.toInt() ?? 0,
      canRedeem: json['canRedeem'] as bool? ?? false,
      hint: json['hint'] as String? ?? '',
    );

Map<String, dynamic> _$CheckoutPointsDtoToJson(_CheckoutPointsDto instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'estimatedEarn': instance.estimatedEarn,
      'canRedeem': instance.canRedeem,
      'hint': instance.hint,
    };

_SummaryRowDto _$SummaryRowDtoFromJson(Map<String, dynamic> json) =>
    _SummaryRowDto(
      label: json['label'] as String,
      value: json['value'] as String,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      positive: json['positive'] as bool? ?? false,
    );

Map<String, dynamic> _$SummaryRowDtoToJson(_SummaryRowDto instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'amount': instance.amount,
      'positive': instance.positive,
    };

_CheckoutDto _$CheckoutDtoFromJson(Map<String, dynamic> json) => _CheckoutDto(
  mode: json['mode'] as String,
  lines:
      (json['lines'] as List<dynamic>?)
          ?.map((e) => CheckoutLineDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
  address: json['address'] == null
      ? null
      : AddressDto.fromJson(json['address'] as Map<String, dynamic>),
  shippingOptions:
      (json['shippingOptions'] as List<dynamic>?)
          ?.map((e) => ShippingOptionDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  stores:
      (json['stores'] as List<dynamic>?)
          ?.map((e) => PickupStoreDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  payments:
      (json['payments'] as List<dynamic>?)
          ?.map((e) => PaymentMethodDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  homeSetupEligible: json['homeSetupEligible'] as bool? ?? false,
  homeSetupDays:
      (json['homeSetupDays'] as List<dynamic>?)
          ?.map((e) => HomeSetupSlotDayDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  points: json['points'] == null
      ? const CheckoutPointsDto()
      : CheckoutPointsDto.fromJson(json['points'] as Map<String, dynamic>),
  summary:
      (json['summary'] as List<dynamic>?)
          ?.map((e) => SummaryRowDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  subtotal: Money.fromJson(json['subtotal'] as Map<String, dynamic>),
  deliveryFee: Money.fromJson(json['deliveryFee'] as Map<String, dynamic>),
  total: Money.fromJson(json['total'] as Map<String, dynamic>),
  canPlace: json['canPlace'] as bool? ?? false,
  problems: json['problems'] == null
      ? const []
      : checkoutProblemsFromJson(json['problems']),
  freshness: json['freshness'] == null
      ? null
      : FreshnessDto.fromJson(json['freshness'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CheckoutDtoToJson(_CheckoutDto instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'lines': instance.lines,
      'itemCount': instance.itemCount,
      'address': instance.address,
      'shippingOptions': instance.shippingOptions,
      'stores': instance.stores,
      'payments': instance.payments,
      'homeSetupEligible': instance.homeSetupEligible,
      'homeSetupDays': instance.homeSetupDays,
      'points': instance.points,
      'summary': instance.summary,
      'subtotal': instance.subtotal,
      'deliveryFee': instance.deliveryFee,
      'total': instance.total,
      'canPlace': instance.canPlace,
      'problems': instance.problems,
      'freshness': instance.freshness,
    };

_OrderPlacedDto _$OrderPlacedDtoFromJson(Map<String, dynamic> json) =>
    _OrderPlacedDto(
      number: json['number'] as String,
      deliveryText: json['deliveryText'] as String,
      paymentText: json['paymentText'] as String,
      estimatedPoints: (json['estimatedPoints'] as num?)?.toInt() ?? 0,
      total: Money.fromJson(json['total'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderPlacedDtoToJson(_OrderPlacedDto instance) =>
    <String, dynamic>{
      'number': instance.number,
      'deliveryText': instance.deliveryText,
      'paymentText': instance.paymentText,
      'estimatedPoints': instance.estimatedPoints,
      'total': instance.total,
    };
