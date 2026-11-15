import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import '../../catalog/data/catalog_dtos.dart';
import '../../home/data/home_dtos.dart';
import '../../home/data/mock_catalog.dart';
import '../../orders/data/order_dtos.dart';
import '../../orders/data/orders_repository.dart';
import '../../profile/data/profile_repository.dart' show MockAddressBook;
import 'checkout_dtos.dart';

part 'cart_repository.g.dart';

/// Bag, checkout and saved addresses: `GET/PATCH/DELETE cart…`,
/// `POST cart/items`, `POST checkout/quote`, `POST orders`, `GET addresses`.
abstract interface class CartRepository {
  Future<CartDto> cart();

  /// One Idempotency-Key per tap (reused on retry).
  Future<CartDto> addItem({
    required String productId,
    String? sku,
    int qty = 1,
    required IdempotencyKey key,
  });
  Future<CartDto> setQty(String lineId, int qty);
  Future<CartDto> remove(String lineId);

  Future<CheckoutDto> quote(CheckoutRequest request);

  /// Idempotency-Key required; reuse it when retrying after a timeout.
  /// `409 channel.price_changed` / `mobile.out_of_stock` carry `quote`.
  Future<OrderPlacedDto> placeOrder(
    CheckoutRequest request, {
    required IdempotencyKey key,
  });

  Future<List<AddressDto>> addresses();
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(Ref ref) => ref.watch(appConfigProvider).isMock
    ? MockCartRepository()
    : ApiCartRepository(ref.watch(dioProvider));

class ApiCartRepository implements CartRepository {
  ApiCartRepository(this._dio);

  final Dio _dio;

  Future<CartDto> _cart(Future<Response<Map<String, dynamic>>> call) =>
      apiCall(() async => CartDto.fromJson((await call).data!));

  @override
  Future<CartDto> cart() => _cart(_dio.get('cart'));

  @override
  Future<CartDto> addItem({
    required String productId,
    String? sku,
    int qty = 1,
    required IdempotencyKey key,
  }) => _cart(
    _dio.post(
      'cart/items',
      data: {'productId': productId, 'sku': ?sku, 'qty': qty},
      options: key.options,
    ),
  );

  @override
  Future<CartDto> setQty(String lineId, int qty) =>
      _cart(_dio.patch('cart/items/$lineId', data: {'qty': qty}));

  @override
  Future<CartDto> remove(String lineId) =>
      _cart(_dio.delete('cart/items/$lineId'));

  @override
  Future<CheckoutDto> quote(CheckoutRequest request) => apiCall(() async {
    final res = await _dio.post<Map<String, dynamic>>(
      'checkout/quote',
      data: request.toBody(),
    );
    return CheckoutDto.fromJson(res.data!);
  });

  @override
  Future<OrderPlacedDto> placeOrder(
    CheckoutRequest request, {
    required IdempotencyKey key,
  }) => apiCall(() async {
    final res = await _dio.post<Map<String, dynamic>>(
      'orders',
      data: request.toBody(),
      options: key.options,
    );
    return OrderPlacedDto.fromJson(res.data!);
  });

  @override
  Future<List<AddressDto>> addresses() => apiCall(() async {
    final res = await _dio.get<List<dynamic>>('addresses');
    return [
      for (final a in res.data!) AddressDto.fromJson(a as Map<String, dynamic>),
    ];
  });
}

/// Plays the API: keeps the bag in memory, prices it, quotes and places
/// orders. All sums happen here ("server side"), never in the app.
class MockCartRepository implements CartRepository {
  MockCartRepository({this.latency = const Duration(milliseconds: 350)});

  final Duration latency;
  final _lines = <CartLineDto>[];
  final _seenKeys = <String, Object>{};
  int _seq = 0;
  int _orderSeq = 1049;

  Future<void> _wait() => Future<void>.delayed(latency);

  static Money _ks(num v) => Money(value: v, currency: 'MMK');

  /// Human label from the mock SKU's option codes (the API sends it).
  static String? _variantLabel(String sku) {
    const names = {
      'BLK': 'Space Black',
      'SLV': 'Silver',
      'GLD': 'Gold',
      'GRY': 'Cosmic Gray',
      '256': '256 GB',
      '512': '512 GB',
      '1TB': '1 TB',
    };
    final parts = [
      for (final seg in sku.split('-'))
        if (names[seg] != null) names[seg]!,
    ];
    return parts.isEmpty ? null : parts.join(' · ');
  }

  CartDto get _cart => CartDto(
    lines: List.unmodifiable(_lines),
    itemCount: _lines.fold(0, (n, l) => n + l.qty),
    subtotal: _ks(_lines.fold<num>(0, (n, l) => n + l.lineTotal.value)),
  );

  @override
  Future<CartDto> cart() async {
    await _wait();
    return _cart;
  }

  @override
  Future<CartDto> addItem({
    required String productId,
    String? sku,
    int qty = 1,
    required IdempotencyKey key,
  }) async {
    await _wait();
    final seen = _seenKeys[key.value];
    if (seen is CartDto) return seen; // replay, like Idempotent-Replayed
    final p = MockCatalog.products.where((x) => x.id == productId).firstOrNull;
    if (p == null) {
      throw const ApiException(
        code: 'mobile.product_not_found',
        message: "We couldn't find that product.",
        status: 404,
      );
    }
    if (!p.inStock) {
      throw const ApiException(
        code: 'mobile.out_of_stock',
        message: 'This item is out of stock.',
        status: 409,
      );
    }
    final s = sku ?? p.defaultSku ?? '${p.id}-STD';
    final i = _lines.indexWhere((l) => l.sku == s);
    final variant = _variantLabel(s);
    if (i >= 0) {
      final l = _lines[i];
      final q = (l.qty + qty).clamp(1, 20);
      _lines[i] = l.copyWith(qty: q, lineTotal: _ks(l.unitPrice.value * q));
    } else {
      _lines.add(
        CartLineDto(
          id: 'line-${++_seq}',
          productId: p.id,
          sku: s,
          title: p.name,
          variantLabel: variant,
          imageUrl: p.imageUrl,
          qty: qty,
          unitPrice: p.price,
          lineTotal: _ks(p.price.value * qty),
        ),
      );
    }
    final cart = _cart;
    _seenKeys[key.value] = cart;
    return cart;
  }

  @override
  Future<CartDto> setQty(String lineId, int qty) async {
    await _wait();
    if (qty > 20) {
      throw const ApiException(
        code: 'mobile.cart_limit',
        message: 'Your bag holds up to 50 different items and 20 of each.',
        status: 400,
      );
    }
    final i = _lines.indexWhere((l) => l.id == lineId);
    if (i >= 0) {
      final l = _lines[i];
      _lines[i] = l.copyWith(qty: qty, lineTotal: _ks(l.unitPrice.value * qty));
    }
    return _cart;
  }

  @override
  Future<CartDto> remove(String lineId) async {
    await _wait();
    _lines.removeWhere((l) => l.id == lineId);
    return _cart;
  }

  List<AddressDto> get _addresses => MockAddressBook.items;

  @override
  Future<List<AddressDto>> addresses() async {
    await _wait();
    return List.unmodifiable(_addresses);
  }

  List<HomeSetupSlotDayDto> _days() {
    const wd = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final now = DateTime.now();
    return [
      for (var i = 1; i <= 5; i++)
        () {
          final d = now.add(Duration(days: i));
          final date =
              '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
          return HomeSetupSlotDayDto(
            date: date,
            weekday: wd[d.weekday - 1],
            day: '${d.day}',
            slots: [
              const HomeSetupSlotDto(
                slot: '09:00-12:00',
                label: '9:00 – 12:00',
              ),
              const HomeSetupSlotDto(
                slot: '13:00-16:00',
                label: '13:00 – 16:00',
              ),
              HomeSetupSlotDto(
                slot: '17:00-19:00',
                label: '17:00 – 19:00',
                available: i != 1,
              ),
            ],
          );
        }(),
    ];
  }

  CheckoutDto _quote(CheckoutRequest r) {
    final delivery = r.mode == 'delivery';
    final ship = r.shipping ?? 'express';
    final sub = _lines.fold<num>(0, (n, l) => n + l.lineTotal.value);
    final fee = delivery && ship == 'express' ? 5000 : 0;
    final total = sub + fee;
    final earn = (sub / 100 * 1.2).round();
    final address = delivery
        ? _addresses.firstWhere(
            (a) => a.id == r.addressId,
            orElse: () => _addresses.first,
          )
        : null;
    final store = r.storeCode ?? 'YGN-HLD';
    final pay = r.payment ?? (delivery ? 'cod' : 'pay_at_pickup');
    String mmk(num v) => _ks(v).displayCode;
    return CheckoutDto(
      mode: r.mode,
      lines: [
        for (final l in _lines)
          CheckoutLineDto(
            sku: l.sku,
            productId: l.productId,
            title: l.title,
            imageUrl: l.imageUrl,
            qty: l.qty,
            unitPrice: l.unitPrice,
            lineTotal: l.lineTotal,
          ),
      ],
      itemCount: _lines.fold(0, (n, l) => n + l.qty),
      address: address,
      shippingOptions: [
        ShippingOptionDto(
          code: 'express',
          title: '3-Hour Express',
          description: 'Get today by 6:00 PM',
          fee: _ks(5000),
          selected: ship == 'express',
        ),
        ShippingOptionDto(
          code: 'standard',
          title: 'Standard Delivery',
          description: 'Arrives in 1–3 days',
          fee: _ks(0),
          selected: ship == 'standard',
        ),
      ],
      stores: [
        PickupStoreDto(
          code: 'YGN-HLD',
          name: 'SureStore Hleden',
          address: 'Hleden Centre, Kamayut',
          distance: '1.2 km',
          selected: store == 'YGN-HLD',
        ),
        PickupStoreDto(
          code: 'YGN-JCT',
          name: 'SureStore Junction City',
          address: 'Junction City Tower, Pabedan',
          distance: '3.8 km',
          selected: store == 'YGN-JCT',
        ),
      ],
      payments: [
        if (delivery)
          PaymentMethodDto(
            code: 'cod',
            title: 'Cash on delivery',
            description:
                'Pay the rider in cash or by QR when your order arrives',
            isDefault: pay == 'cod',
          )
        else
          PaymentMethodDto(
            code: 'pay_at_pickup',
            title: 'Pay at pickup',
            description: 'Pay at the store counter when you collect',
            isDefault: pay == 'pay_at_pickup',
          ),
        const PaymentMethodDto(
          code: 'qr',
          title: 'QR Payment',
          description: 'KBZPay · Wave Pay · AYA Pay',
          enabled: false,
          disabledReason: 'Coming soon — pay on delivery or at pickup for now.',
        ),
        const PaymentMethodDto(
          code: 'bank',
          title: 'Bank Transfer',
          description: 'CB · KBZ · AYA banks',
          enabled: false,
          disabledReason: 'Coming soon — pay on delivery or at pickup for now.',
        ),
      ],
      homeSetupEligible: delivery,
      homeSetupDays: delivery ? _days() : const [],
      points: CheckoutPointsDto(
        balance: 12450,
        estimatedEarn: earn,
        hint: 'Paying with points comes in the next release',
      ),
      summary: [
        SummaryRowDto(label: 'Subtotal', value: mmk(sub), amount: _ks(sub)),
        if (delivery)
          SummaryRowDto(
            label: 'Delivery fee',
            value: fee == 0 ? 'Free' : mmk(fee),
            amount: _ks(fee),
          )
        else
          SummaryRowDto(label: 'Pickup', value: 'Free', amount: _ks(0)),
        SummaryRowDto(
          label: "You'll earn",
          value:
              '+${earn.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',')} pts',
          positive: true,
        ),
      ],
      subtotal: _ks(sub),
      deliveryFee: _ks(fee),
      total: _ks(total),
      canPlace: _lines.isNotEmpty,
      problems: _lines.isEmpty ? const ['Your bag is empty.'] : const [],
      freshness: const FreshnessDto(source: 'fresh'),
    );
  }

  @override
  Future<CheckoutDto> quote(CheckoutRequest request) async {
    await _wait();
    if (_lines.isEmpty) {
      throw const ApiException(
        code: 'mobile.cart_empty',
        message: 'Your bag is empty. Add something before checking out.',
        status: 400,
      );
    }
    return _quote(request);
  }

  @override
  Future<OrderPlacedDto> placeOrder(
    CheckoutRequest request, {
    required IdempotencyKey key,
  }) async {
    await _wait();
    final seen = _seenKeys[key.value];
    if (seen is OrderPlacedDto) return seen;
    final q = _quote(request);
    if (request.expectedTotal != null &&
        request.expectedTotal != q.total.value) {
      throw ApiException(
        code: 'channel.price_changed',
        message: 'A price changed since the quote.',
        status: 409,
        body: {'quote': q.toJson()},
      );
    }
    if (request.mode == 'delivery' &&
        request.homeSetup?.slot == '17:00-19:00') {
      throw const ApiException(
        code: 'mobile.slot_full',
        message: 'That time is fully booked. Pick another slot.',
        status: 409,
      );
    }
    final delivery = request.mode == 'delivery';
    final placed = OrderPlacedDto(
      number: 'APP-26-${++_orderSeq}',
      deliveryText: delivery
          ? (request.shipping == 'standard'
                ? 'Arrives in 1–3 days'
                : 'Arriving in under 3 hours')
          : 'Ready for pickup in 2 hours',
      paymentText: delivery ? 'Cash on delivery' : 'Pay at pickup',
      estimatedPoints: q.points.estimatedEarn,
      total: q.total,
    );
    // Show it in the Orders tab like the API would.
    final number = placed.number;
    final booking = request.homeSetup == null
        ? null
        : HomeSetupBookingDto(
            number: 'HS-$number',
            device: _lines.first.title,
            date: request.homeSetup!.date,
            slot: request.homeSetup!.slot,
            slotLabel: request.homeSetup!.slot.replaceAll('-', ' – '),
            status: 'Scheduled',
            statusLabel: 'Scheduled',
            orderNumber: number,
            canCancel: true,
          );
    MockOrderStore.orders.insert(
      0,
      OrderDetailDto(
        number: number,
        placedAt: DateTime.now().toUtc().toIso8601String(),
        status: 'New',
        statusLabel: 'Order placed',
        statusColor: 'warning',
        method: request.mode,
        paymentText: placed.paymentText,
        paymentStatus: delivery ? 'Pay on delivery' : 'Pay at pickup',
        fulfillmentStatus: 'Unfulfilled',
        lines: [
          for (final l in _lines)
            OrderLineDto(
              sku: l.sku,
              title: l.title,
              spec: [?l.variantLabel, 'SKU ${l.sku}'].join(' · '),
              imageUrl: l.imageUrl,
              qty: l.qty,
              unitPrice: l.unitPrice,
              lineTotal: l.lineTotal,
            ),
        ],
        steps: MockOrderStore.steps(0, placed: 'Just now'),
        summary: [
          for (final r in q.summary)
            if (!r.positive) r,
        ],
        total: q.total,
        shipToText: q.address?.fullText,
        pickupStore: delivery
            ? null
            : q.stores.where((s) => s.selected).firstOrNull?.name,
        express: delivery && request.shipping != 'standard',
        etaText: placed.deliveryText,
        homeSetup: booking,
      ),
    );
    if (booking != null) MockOrderStore.bookings.insert(0, booking);
    _lines.clear();
    _seenKeys[key.value] = placed;
    return placed;
  }
}
