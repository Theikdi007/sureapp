// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bell, wishlist and bag badges shared by every screen. Seeded from
/// `home.counts`, refreshed by `notifications/unread-count` and by the
/// API's answers to bag/wishlist calls.

@ProviderFor(ShopCounts)
final shopCountsProvider = ShopCountsProvider._();

/// Bell, wishlist and bag badges shared by every screen. Seeded from
/// `home.counts`, refreshed by `notifications/unread-count` and by the
/// API's answers to bag/wishlist calls.
final class ShopCountsProvider
    extends $NotifierProvider<ShopCounts, HomeCountsDto> {
  /// Bell, wishlist and bag badges shared by every screen. Seeded from
  /// `home.counts`, refreshed by `notifications/unread-count` and by the
  /// API's answers to bag/wishlist calls.
  ShopCountsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shopCountsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shopCountsHash();

  @$internal
  @override
  ShopCounts create() => ShopCounts();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeCountsDto value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeCountsDto>(value),
    );
  }
}

String _$shopCountsHash() => r'd99fc9e2aee313803ddeb9e0e49ef776b6d715d9';

/// Bell, wishlist and bag badges shared by every screen. Seeded from
/// `home.counts`, refreshed by `notifications/unread-count` and by the
/// API's answers to bag/wishlist calls.

abstract class _$ShopCounts extends $Notifier<HomeCountsDto> {
  HomeCountsDto build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<HomeCountsDto, HomeCountsDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeCountsDto, HomeCountsDto>,
              HomeCountsDto,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Which products are wished, layered over the `wished` flags in cards so
/// a heart tapped on one screen shows everywhere.

@ProviderFor(WishedProducts)
final wishedProductsProvider = WishedProductsProvider._();

/// Which products are wished, layered over the `wished` flags in cards so
/// a heart tapped on one screen shows everywhere.
final class WishedProductsProvider
    extends $NotifierProvider<WishedProducts, Map<String, bool>> {
  /// Which products are wished, layered over the `wished` flags in cards so
  /// a heart tapped on one screen shows everywhere.
  WishedProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wishedProductsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wishedProductsHash();

  @$internal
  @override
  WishedProducts create() => WishedProducts();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, bool>>(value),
    );
  }
}

String _$wishedProductsHash() => r'c38663469cf8ddf4b7f7074a5853d611990fbf53';

/// Which products are wished, layered over the `wished` flags in cards so
/// a heart tapped on one screen shows everywhere.

abstract class _$WishedProducts extends $Notifier<Map<String, bool>> {
  Map<String, bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Map<String, bool>, Map<String, bool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, bool>, Map<String, bool>>,
              Map<String, bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The bag (`GET cart`), kept in sync with every bag call's answer; the
/// bag badge follows `itemCount`.

@ProviderFor(Bag)
final bagProvider = BagProvider._();

/// The bag (`GET cart`), kept in sync with every bag call's answer; the
/// bag badge follows `itemCount`.
final class BagProvider extends $AsyncNotifierProvider<Bag, CartDto> {
  /// The bag (`GET cart`), kept in sync with every bag call's answer; the
  /// bag badge follows `itemCount`.
  BagProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bagProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bagHash();

  @$internal
  @override
  Bag create() => Bag();
}

String _$bagHash() => r'38088095d179950f15571b3488955c35ac76b50f';

/// The bag (`GET cart`), kept in sync with every bag call's answer; the
/// bag badge follows `itemCount`.

abstract class _$Bag extends $AsyncNotifier<CartDto> {
  FutureOr<CartDto> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CartDto>, CartDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CartDto>, CartDto>,
              AsyncValue<CartDto>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Product ids being added (spinners on "Add to bag").

@ProviderFor(BagActions)
final bagActionsProvider = BagActionsProvider._();

/// Product ids being added (spinners on "Add to bag").
final class BagActionsProvider
    extends $NotifierProvider<BagActions, Set<String>> {
  /// Product ids being added (spinners on "Add to bag").
  BagActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bagActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bagActionsHash();

  @$internal
  @override
  BagActions create() => BagActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$bagActionsHash() => r'd409add9bd93827854e80c13b3436db1737141ea';

/// Product ids being added (spinners on "Add to bag").

abstract class _$BagActions extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
