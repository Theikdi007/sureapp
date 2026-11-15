import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';

part 'wishlist_repository.g.dart';

/// `PUT / DELETE wishlist/{productId}` (heart on/off).
abstract interface class WishlistRepository {
  Future<void> add(String productId);
  Future<void> remove(String productId);
}

@Riverpod(keepAlive: true)
WishlistRepository wishlistRepository(Ref ref) =>
    ref.watch(appConfigProvider).isMock
    ? MockWishlistRepository()
    : ApiWishlistRepository(ref.watch(dioProvider));

class ApiWishlistRepository implements WishlistRepository {
  ApiWishlistRepository(this._dio);

  final Dio _dio;

  @override
  Future<void> add(String productId) => apiCall(
    () => _dio.put<void>('wishlist/${Uri.encodeComponent(productId)}'),
  );

  @override
  Future<void> remove(String productId) => apiCall(
    () => _dio.delete<void>('wishlist/${Uri.encodeComponent(productId)}'),
  );
}

/// Mock-flavor saved product ids, shared with `MockCatalogRepository`.
abstract final class MockWishlistStore {
  static final ids = <String>{};
}

class MockWishlistRepository implements WishlistRepository {
  @override
  Future<void> add(String productId) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    MockWishlistStore.ids.add(productId);
  }

  @override
  Future<void> remove(String productId) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    MockWishlistStore.ids.remove(productId);
  }
}
