import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/interceptors.dart';
import '../../cart/data/cart_repository.dart';
import '../../cart/data/checkout_dtos.dart';
import '../../home/data/home_dtos.dart';
import '../../notifications/data/notifications_repository.dart';
import '../data/catalog_dtos.dart';
import '../data/wishlist_repository.dart';

part 'shop_state.g.dart';

/// Bell, wishlist and bag badges shared by every screen. Seeded from
/// `home.counts`, refreshed by `notifications/unread-count` and by the
/// API's answers to bag/wishlist calls.
@Riverpod(keepAlive: true)
class ShopCounts extends _$ShopCounts {
  @override
  HomeCountsDto build() => const HomeCountsDto();

  void seed(HomeCountsDto counts) => state = counts;

  void setBag(int items) => state = state.copyWith(cartItems: items);

  void addWish(int delta) => state = state.copyWith(
    wishlist: (state.wishlist + delta).clamp(0, 1 << 30),
  );

  Future<void> refreshUnread() async {
    try {
      final c = await ref.read(notificationsRepositoryProvider).unreadCount();
      state = state.copyWith(unreadNotifications: c.total);
    } on Object {
      // Keep the last known count.
    }
  }
}

/// Which products are wished, layered over the `wished` flags in cards so
/// a heart tapped on one screen shows everywhere.
@Riverpod(keepAlive: true)
class WishedProducts extends _$WishedProducts {
  @override
  Map<String, bool> build() => const {};

  bool isWished(ProductCardDto p) => state[p.id] ?? p.wished;

  /// Optimistic toggle; rolls back if the API refuses.
  Future<void> toggle(ProductCardDto p) async {
    final next = !isWished(p);
    state = {...state, p.id: next};
    ref.read(shopCountsProvider.notifier).addWish(next ? 1 : -1);
    try {
      final repo = ref.read(wishlistRepositoryProvider);
      next ? await repo.add(p.id) : await repo.remove(p.id);
    } on Object {
      state = {...state, p.id: !next};
      ref.read(shopCountsProvider.notifier).addWish(next ? -1 : 1);
      rethrow;
    }
  }
}

/// The bag (`GET cart`), kept in sync with every bag call's answer; the
/// bag badge follows `itemCount`.
@Riverpod(keepAlive: true)
class Bag extends _$Bag {
  @override
  Future<CartDto> build() async {
    final cart = await ref.read(cartRepositoryProvider).cart();
    ref.read(shopCountsProvider.notifier).setBag(cart.itemCount);
    return cart;
  }

  void _set(CartDto cart) {
    state = AsyncData(cart);
    ref.read(shopCountsProvider.notifier).setBag(cart.itemCount);
  }

  Future<void> add({
    required String productId,
    String? sku,
    required IdempotencyKey key,
  }) async => _set(
    await ref
        .read(cartRepositoryProvider)
        .addItem(productId: productId, sku: sku, key: key),
  );

  Future<void> setQty(String lineId, int qty) async =>
      _set(await ref.read(cartRepositoryProvider).setQty(lineId, qty));

  Future<void> remove(String lineId) async =>
      _set(await ref.read(cartRepositoryProvider).remove(lineId));

  /// After an order is placed the server empties the bag: re-read it.
  void cleared() => ref.invalidateSelf();
}

/// Product ids being added (spinners on "Add to bag").
@Riverpod(keepAlive: true)
class BagActions extends _$BagActions {
  @override
  Set<String> build() => const {};

  /// One Idempotency-Key per tap.
  Future<void> add(ProductCardDto p) async {
    if (state.contains(p.id)) return;
    state = {...state, p.id};
    try {
      await ref
          .read(bagProvider.notifier)
          .add(
            productId: p.id,
            sku: p.defaultSku,
            key: IdempotencyKey.generate(),
          );
    } finally {
      state = {...state}..remove(p.id);
    }
  }
}
