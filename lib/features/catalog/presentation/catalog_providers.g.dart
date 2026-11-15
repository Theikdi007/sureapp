// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `GET products` for one query, with cursor paging.

@ProviderFor(ProductSearch)
final productSearchProvider = ProductSearchFamily._();

/// `GET products` for one query, with cursor paging.
final class ProductSearchProvider
    extends $AsyncNotifierProvider<ProductSearch, SearchState> {
  /// `GET products` for one query, with cursor paging.
  ProductSearchProvider._({
    required ProductSearchFamily super.from,
    required ProductQuery super.argument,
  }) : super(
         retry: null,
         name: r'productSearchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productSearchHash();

  @override
  String toString() {
    return r'productSearchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductSearch create() => ProductSearch();

  @override
  bool operator ==(Object other) {
    return other is ProductSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productSearchHash() => r'17520ef63d668f289db9aed7a133b326449bd02e';

/// `GET products` for one query, with cursor paging.

final class ProductSearchFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductSearch,
          AsyncValue<SearchState>,
          SearchState,
          FutureOr<SearchState>,
          ProductQuery
        > {
  ProductSearchFamily._()
    : super(
        retry: null,
        name: r'productSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// `GET products` for one query, with cursor paging.

  ProductSearchProvider call(ProductQuery query) =>
      ProductSearchProvider._(argument: query, from: this);

  @override
  String toString() => r'productSearchProvider';
}

/// `GET products` for one query, with cursor paging.

abstract class _$ProductSearch extends $AsyncNotifier<SearchState> {
  late final _$args = ref.$arg as ProductQuery;
  ProductQuery get query => _$args;

  FutureOr<SearchState> build(ProductQuery query);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SearchState>, SearchState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SearchState>, SearchState>,
              AsyncValue<SearchState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(productDetail)
final productDetailProvider = ProductDetailFamily._();

final class ProductDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProductDetailDto>,
          ProductDetailDto,
          FutureOr<ProductDetailDto>
        >
    with $FutureModifier<ProductDetailDto>, $FutureProvider<ProductDetailDto> {
  ProductDetailProvider._({
    required ProductDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productDetailHash();

  @override
  String toString() {
    return r'productDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProductDetailDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProductDetailDto> create(Ref ref) {
    final argument = this.argument as String;
    return productDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productDetailHash() => r'517a763e389d20683e4864e3340e36a4af6139b4';

final class ProductDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProductDetailDto>, String> {
  ProductDetailFamily._()
    : super(
        retry: null,
        name: r'productDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductDetailProvider call(String id) =>
      ProductDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'productDetailProvider';
}

@ProviderFor(allBrands)
final allBrandsProvider = AllBrandsProvider._();

final class AllBrandsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BrandDto>>,
          List<BrandDto>,
          FutureOr<List<BrandDto>>
        >
    with $FutureModifier<List<BrandDto>>, $FutureProvider<List<BrandDto>> {
  AllBrandsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allBrandsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allBrandsHash();

  @$internal
  @override
  $FutureProviderElement<List<BrandDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BrandDto>> create(Ref ref) {
    return allBrands(ref);
  }
}

String _$allBrandsHash() => r'16ca42236ad4390b8ca6278740a9859b3ef507c2';

@ProviderFor(allVendors)
final allVendorsProvider = AllVendorsProvider._();

final class AllVendorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VendorDto>>,
          List<VendorDto>,
          FutureOr<List<VendorDto>>
        >
    with $FutureModifier<List<VendorDto>>, $FutureProvider<List<VendorDto>> {
  AllVendorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allVendorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allVendorsHash();

  @$internal
  @override
  $FutureProviderElement<List<VendorDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VendorDto>> create(Ref ref) {
    return allVendors(ref);
  }
}

String _$allVendorsHash() => r'673d5ff2fcb82eedb9e588d97e60bce060de2136';

@ProviderFor(vendorDetail)
final vendorDetailProvider = VendorDetailFamily._();

final class VendorDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<VendorDto>,
          VendorDto,
          FutureOr<VendorDto>
        >
    with $FutureModifier<VendorDto>, $FutureProvider<VendorDto> {
  VendorDetailProvider._({
    required VendorDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'vendorDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vendorDetailHash();

  @override
  String toString() {
    return r'vendorDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<VendorDto> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<VendorDto> create(Ref ref) {
    final argument = this.argument as String;
    return vendorDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is VendorDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vendorDetailHash() => r'f23617e26f570d5dae87287cba230a588debed57';

final class VendorDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<VendorDto>, String> {
  VendorDetailFamily._()
    : super(
        retry: null,
        name: r'vendorDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VendorDetailProvider call(String id) =>
      VendorDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'vendorDetailProvider';
}

@ProviderFor(wishlistItems)
final wishlistItemsProvider = WishlistItemsProvider._();

final class WishlistItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductCardDto>>,
          List<ProductCardDto>,
          FutureOr<List<ProductCardDto>>
        >
    with
        $FutureModifier<List<ProductCardDto>>,
        $FutureProvider<List<ProductCardDto>> {
  WishlistItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wishlistItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wishlistItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<ProductCardDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductCardDto>> create(Ref ref) {
    return wishlistItems(ref);
  }
}

String _$wishlistItemsHash() => r'090de55a08e468a819e4567c93cdd3288c6f3ccc';
