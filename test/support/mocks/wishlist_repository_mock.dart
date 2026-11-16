// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.

import 'package:sure_app/features/catalog/data/wishlist_repository.dart';

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
