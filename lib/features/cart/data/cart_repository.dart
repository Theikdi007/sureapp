import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import '../../home/data/home_dtos.dart';
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
CartRepository cartRepository(Ref ref) =>
    ApiCartRepository(ref.watch(dioProvider));

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
