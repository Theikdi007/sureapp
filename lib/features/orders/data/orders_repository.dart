import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import '../../../shared/models/money.dart';
import '../../cart/data/checkout_dtos.dart';
import '../../catalog/data/catalog_dtos.dart';
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
  Future<HomeSetupBookingDto> booking(String number);

  /// `mobile.booking_closed` less than 12 hours before the window.
  Future<HomeSetupBookingDto> cancelBooking(String number);
  Future<List<HomeSetupSlotDayDto>> slots();

  /// Idempotency-Key required.
  Future<HomeSetupBookingDto> book(
    BookHomeSetupRequest request, {
    required IdempotencyKey key,
  });
}

@Riverpod(keepAlive: true)
OrdersRepository ordersRepository(Ref ref) =>
    ApiOrdersRepository(ref.watch(dioProvider));

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
  Future<HomeSetupBookingDto> booking(String number) => apiCall(() async {
    final res = await _dio.get<Map<String, dynamic>>(
      'home-setup/bookings/${Uri.encodeComponent(number)}',
    );
    return HomeSetupBookingDto.fromJson(res.data!);
  });

  @override
  Future<HomeSetupBookingDto> cancelBooking(String number) => apiCall(() async {
    final res = await _dio.post<Map<String, dynamic>>(
      'home-setup/bookings/${Uri.encodeComponent(number)}/cancel',
    );
    return HomeSetupBookingDto.fromJson(res.data!);
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
