import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import '../../cart/data/checkout_dtos.dart';
import '../../catalog/data/catalog_dtos.dart';
import '../../home/data/mock_catalog.dart';
import 'order_dtos.dart';

part 'orders_repository.g.dart';

/// Orders tab, order detail, tracking, feedback and home-setup visits.
abstract interface class OrdersRepository {
  Future<Page<OrderSummaryDto>> orders(OrderTab tab, {String? cursor});
  Future<OrderDetailDto> order(String number);
  Future<TrackingDto> tracking(String number);
  Future<ReviewDto> feedback(
    String number, {
    required int rating,
    String? text,
    required IdempotencyKey key,
  });
  Future<List<HomeSetupBookingDto>> bookings();
  Future<List<HomeSetupSlotDayDto>> slots();

  /// Idempotency-Key required.
  Future<HomeSetupBookingDto> book(
    BookHomeSetupRequest request, {
    required IdempotencyKey key,
  });
}

@Riverpod(keepAlive: true)
OrdersRepository ordersRepository(Ref ref) =>
    ref.watch(appConfigProvider).isMock
    ? MockOrdersRepository()
    : ApiOrdersRepository(ref.watch(dioProvider));

class ApiOrdersRepository implements OrdersRepository {
  ApiOrdersRepository(this._dio);

  final Dio _dio;

  String _n(String number) => Uri.encodeComponent(number);

  @override
  Future<Page<OrderSummaryDto>> orders(OrderTab tab, {String? cursor}) =>
      apiCall(() async {
        final res = await _dio.get<Map<String, dynamic>>(
          'orders',
          queryParameters: {'tab': tab.name, 'cursor': ?cursor},
        );
        return Page.fromJson(res.data!, OrderSummaryDto.fromJson);
      });

  @override
  Future<OrderDetailDto> order(String number) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>('orders/${_n(number)}');
    return OrderDetailDto.fromJson(res.data!);
  });

  @override
  Future<TrackingDto> tracking(String number) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'orders/${_n(number)}/tracking',
    );
    return TrackingDto.fromJson(res.data!);
  });

  @override
  Future<ReviewDto> feedback(
    String number, {
    required int rating,
    String? text,
    required IdempotencyKey key,
  }) => apiCall(() async {
    final res = await _dio.post<Map<String, dynamic>>(
      'orders/${_n(number)}/feedback',
      data: {'rating': rating, 'text': ?text},
      options: key.options,
    );
    return ReviewDto.fromJson(res.data!);
  });

  @override
  Future<List<HomeSetupBookingDto>> bookings() => apiCall(() async {
    final res = await _dio.get<List<dynamic>>('home-setup/bookings');
    return [
      for (final b in res.data!)
        HomeSetupBookingDto.fromJson(b as Map<String, dynamic>),
    ];
  });

  @override
  Future<List<HomeSetupSlotDayDto>> slots() => apiCall(() async {
    final res = await _dio.get<List<dynamic>>('home-setup/slots');
    return [
      for (final d in res.data!)
        HomeSetupSlotDayDto.fromJson(d as Map<String, dynamic>),
    ];
  });

  @override
  Future<HomeSetupBookingDto> book(
    BookHomeSetupRequest request, {
    required IdempotencyKey key,
  }) => apiCall(() async {
    final res = await _dio.post<Map<String, dynamic>>(
      'home-setup/bookings',
      data: request.toJson()..removeWhere((_, v) => v == null),
      options: key.options,
    );
    return HomeSetupBookingDto.fromJson(res.data!);
  });
}

/// Mock-flavor order history (the prototype's three orders) and visits.
/// Checkout's mock adds placed orders here.
abstract final class MockOrderStore {
  static Money _ks(num v) => Money(value: v, currency: 'MMK');

  static List<OrderStepDto> steps(int current, {String? placed, String? eta}) {
    const labels = ['Confirmed', 'On its way', 'Out for delivery', 'Delivered'];
    final desc = [
      placed,
      'Fulfilled from Hleden store',
      eta ?? 'Courier has your order',
      'Enjoy your new device',
    ];
    return [
      for (var i = 0; i < 4; i++)
        OrderStepDto(
          label: labels[i],
          description: desc[i],
          done: i < current || current == 3,
          current: i == current,
        ),
    ];
  }

  static final orders = <OrderDetailDto>[
    OrderDetailDto(
      number: 'APP-26-1046',
      placedAt: '2026-02-02T06:30:00Z',
      status: 'OutForDelivery',
      statusLabel: 'Out for delivery',
      statusColor: 'primary',
      fulfilled: true,
      paymentText: 'Cash on delivery',
      paymentStatus: 'Pay on delivery',
      fulfillmentStatus: 'Fulfilled',
      trackingText: 'Royal Express · MM7204631190',
      lines: [
        OrderLineDto(
          sku: 'WATCH-3-BLK',
          title: 'Watch 3',
          spec: 'Space Black · SKU WATCH-3-BLK',
          imageUrl: MockCatalog.productImage,
          qty: 1,
          unitPrice: _ks(2643900),
          lineTotal: _ks(2643900),
        ),
      ],
      steps: steps(
        2,
        placed: '02 Feb 2026, 01:00 PM',
        eta: 'Estimated arrival: Today, 03:00 PM',
      ),
      summary: const [
        SummaryRowDto(label: 'Subtotal', value: '2,643,900 MMK'),
        SummaryRowDto(label: 'Delivery fee · 3-Hr Express', value: '5,000 MMK'),
      ],
      total: _ks(2648900),
      shipToText: MockCatalog.homeAddress.fullText,
      express: true,
      etaText: 'Estimated arrival: Today, 03:00 PM',
    ),
    OrderDetailDto(
      number: 'APP-26-1044',
      placedAt: '2026-01-18T04:50:00Z',
      status: 'Confirmed',
      statusLabel: 'Confirmed',
      statusColor: 'warning',
      paymentText: 'Cash on delivery',
      paymentStatus: 'Pay on delivery',
      fulfillmentStatus: 'Unfulfilled',
      lines: [
        OrderLineDto(
          sku: 'IPH-17P-BLK-256',
          title: 'iPhone 17 Pro',
          spec: 'Space Black · SKU IPH-17P-BLK-256',
          imageUrl: MockCatalog.productImage,
          qty: 1,
          unitPrice: _ks(2307900),
          lineTotal: _ks(2307900),
        ),
      ],
      steps: steps(0, placed: '18 Jan 2026, 11:20 AM'),
      summary: const [
        SummaryRowDto(label: 'Subtotal', value: '2,307,900 MMK'),
        SummaryRowDto(label: 'Delivery fee', value: 'Free'),
      ],
      total: _ks(2307900),
      shipToText: MockCatalog.homeAddress.fullText,
      homeSetup: const HomeSetupBookingDto(
        number: 'HS-1044',
        device: 'iPhone 17 Pro',
        date: '2026-07-22',
        slot: '09:00-12:00',
        slotLabel: 'Wed, Jul 22 · 11:00 AM',
        status: 'Scheduled',
        statusLabel: 'Scheduled',
        orderNumber: 'APP-26-1044',
        canCancel: true,
      ),
    ),
    OrderDetailDto(
      number: 'APP-26-1039',
      placedAt: '2025-12-30T10:15:00Z',
      status: 'Delivered',
      statusLabel: 'Delivered',
      statusColor: 'positive',
      fulfilled: true,
      open: false,
      paymentText: 'Cash on delivery',
      paymentStatus: 'Paid',
      fulfillmentStatus: 'Fulfilled',
      trackingText: 'Royal Express · MM6981250347',
      lines: [
        OrderLineDto(
          sku: 'IPH-16-BLK-256',
          title: 'iPhone 16',
          spec: '256 GB · Space Black · SKU IPH-16-BLK-256',
          imageUrl: MockCatalog.productImage,
          qty: 2,
          unitPrice: _ks(3777900),
          lineTotal: _ks(7555800),
        ),
        OrderLineDto(
          sku: 'WATCH-3-SLV',
          title: 'Watch 3',
          spec: 'Silver · SKU WATCH-3-SLV',
          imageUrl: MockCatalog.productImage,
          qty: 1,
          unitPrice: _ks(2643900),
          lineTotal: _ks(2643900),
        ),
      ],
      steps: steps(3, placed: '30 Dec 2025, 04:45 PM'),
      summary: const [
        SummaryRowDto(label: 'Subtotal', value: '10,199,700 MMK'),
        SummaryRowDto(label: 'Delivery fee', value: 'Free'),
      ],
      total: _ks(10199700),
      shipToText: MockCatalog.homeAddress.fullText,
      canRate: true,
    ),
  ];

  static final bookings = <HomeSetupBookingDto>[
    orders[1].homeSetup!,
    const HomeSetupBookingDto(
      number: 'HS-1039',
      device: 'MacBook Air M4',
      date: '2025-06-14',
      slot: '13:00-16:00',
      slotLabel: 'Sat, Jun 14 · 3:00 PM',
      status: 'Completed',
      statusLabel: 'Completed',
      orderNumber: 'APP-26-1039',
    ),
  ];

  static OrderSummaryDto summaryOf(OrderDetailDto o) => OrderSummaryDto(
    number: o.number,
    placedAt: o.placedAt,
    status: o.status,
    statusLabel: o.statusLabel,
    statusColor: o.statusColor,
    fulfilled: o.fulfilled,
    title: o.lines.length > 1
        ? '${o.lines.first.title} + ${o.lines.length - 1} more'
        : o.lines.first.title,
    imageUrl: o.lines.first.imageUrl,
    itemCount: o.lines.fold(0, (n, l) => n + l.qty.toInt()),
    total: o.total,
    express: o.express,
    hasHomeSetup: o.homeSetup != null,
    meta: o.express
        ? (o.etaText ?? '')
        : [
            'Confirmed ${o.steps.first.description ?? ''}',
            if (o.homeSetup != null) 'Home Setup',
          ].join(' · '),
  );
}

class MockOrdersRepository implements OrdersRepository {
  MockOrdersRepository({this.latency = const Duration(milliseconds: 350)});

  final Duration latency;
  final _keys = <String, Object>{};

  Future<void> _wait() => Future<void>.delayed(latency);

  OrderDetailDto _find(String number) => MockOrderStore.orders.firstWhere(
    (o) => o.number == number,
    orElse: () => throw const ApiException(
      code: 'mobile.order_not_found',
      message: "We couldn't find that order.",
      status: 404,
    ),
  );

  @override
  Future<Page<OrderSummaryDto>> orders(OrderTab tab, {String? cursor}) async {
    await _wait();
    return Page(
      items: [
        for (final o in MockOrderStore.orders)
          if (tab == OrderTab.all ||
              (tab == OrderTab.fulfilled) ==
                  (o.fulfillmentStatus == 'Fulfilled'))
            MockOrderStore.summaryOf(o),
      ],
    );
  }

  @override
  Future<OrderDetailDto> order(String number) async {
    await _wait();
    return _find(number);
  }

  @override
  Future<TrackingDto> tracking(String number) async {
    await _wait();
    final o = _find(number);
    final out = o.status == 'OutForDelivery';
    return TrackingDto(
      number: o.number,
      statusLabel: o.statusLabel,
      etaText: o.etaText,
      mapLabel: out ? 'On the way to you' : 'Preparing your order',
      courierName: out ? 'Ko Zaw' : null,
      courierPhone: out ? '+959450000123' : null,
      steps: o.steps,
    );
  }

  @override
  Future<ReviewDto> feedback(
    String number, {
    required int rating,
    String? text,
    required IdempotencyKey key,
  }) async {
    await _wait();
    final seen = _keys[key.value];
    if (seen is ReviewDto) return seen;
    final i = MockOrderStore.orders.indexWhere((o) => o.number == number);
    if (i < 0 || !MockOrderStore.orders[i].canRate) {
      throw const ApiException(
        code: 'mobile.feedback_not_allowed',
        message: 'You can rate an order once it has been delivered.',
        status: 400,
      );
    }
    MockOrderStore.orders[i] = MockOrderStore.orders[i].copyWith(
      canRate: false,
      rated: true,
    );
    final r = ReviewDto(
      id: 'fb-$number',
      name: 'You',
      rating: rating,
      text: text,
      createdAt: DateTime.now().toUtc().toIso8601String(),
      verifiedBuyer: true,
      mine: true,
    );
    _keys[key.value] = r;
    return r;
  }

  @override
  Future<List<HomeSetupBookingDto>> bookings() async {
    await _wait();
    return List.of(MockOrderStore.bookings);
  }

  @override
  Future<List<HomeSetupSlotDayDto>> slots() async {
    await _wait();
    const wd = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final now = DateTime.now();
    String two(int v) => v.toString().padLeft(2, '0');
    return [
      for (var i = 1; i <= 5; i++)
        () {
          final d = now.add(Duration(days: i));
          return HomeSetupSlotDayDto(
            date: '${d.year}-${two(d.month)}-${two(d.day)}',
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

  @override
  Future<HomeSetupBookingDto> book(
    BookHomeSetupRequest request, {
    required IdempotencyKey key,
  }) async {
    await _wait();
    final seen = _keys[key.value];
    if (seen is HomeSetupBookingDto) return seen;
    final days = await slots();
    final day = days.where((d) => d.date == request.date).firstOrNull;
    final slot = day?.slots.where((s) => s.slot == request.slot).firstOrNull;
    if (slot == null) {
      throw const ApiException(
        code: 'mobile.slot_invalid',
        message: 'Pick one of the days and times shown.',
        status: 400,
      );
    }
    if (!slot.available) {
      throw const ApiException(
        code: 'mobile.slot_full',
        message: 'That time is fully booked. Pick another slot.',
        status: 409,
      );
    }
    final device =
        request.device ??
        MockCatalog.products
            .where((p) => p.id == request.productId)
            .firstOrNull
            ?.name ??
        'Your device';
    final b = HomeSetupBookingDto(
      number: 'HS-${2000 + MockOrderStore.bookings.length}',
      device: device,
      date: request.date,
      slot: request.slot,
      slotLabel: '${day!.weekday}, ${day.day} · ${slot.label}',
      status: 'Scheduled',
      statusLabel: 'Scheduled',
      orderNumber: request.orderNumber,
      addressText: MockCatalog.homeAddress.fullText,
      canCancel: true,
    );
    MockOrderStore.bookings.insert(0, b);
    _keys[key.value] = b;
    return b;
  }
}
