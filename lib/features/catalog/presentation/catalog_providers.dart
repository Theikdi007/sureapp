import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/catalog_dtos.dart';
import '../data/catalog_repository.dart';

part 'catalog_providers.g.dart';

class SearchState {
  const SearchState({
    required this.result,
    this.items = const [],
    this.loadingMore = false,
  });

  final ProductSearchDto result;
  final List<ProductCardDto> items;
  final bool loadingMore;

  bool get done => result.nextCursor == null;
}

/// `GET products` for one query, with cursor paging.
@riverpod
class ProductSearch extends _$ProductSearch {
  @override
  Future<SearchState> build(ProductQuery query) async {
    final r = await ref.watch(catalogRepositoryProvider).search(query);
    return SearchState(result: r, items: r.items);
  }

  Future<void> loadMore() async {
    final s = state.value;
    if (s == null || s.done || s.loadingMore) return;
    state = AsyncData(
      SearchState(result: s.result, items: s.items, loadingMore: true),
    );
    try {
      final next = await ref
          .read(catalogRepositoryProvider)
          .search(query, cursor: s.result.nextCursor);
      state = AsyncData(
        SearchState(result: next, items: [...s.items, ...next.items]),
      );
    } on Object {
      state = AsyncData(SearchState(result: s.result, items: s.items));
    }
  }
}

@riverpod
Future<ProductDetailDto> productDetail(Ref ref, String id) =>
    ref.watch(catalogRepositoryProvider).product(id);

@riverpod
Future<List<BrandDto>> allBrands(Ref ref) =>
    ref.watch(catalogRepositoryProvider).brands();

@riverpod
Future<List<VendorDto>> allVendors(Ref ref) =>
    ref.watch(catalogRepositoryProvider).vendors();

@riverpod
Future<VendorDto> vendorDetail(Ref ref, String id) =>
    ref.watch(catalogRepositoryProvider).vendor(id);

@riverpod
Future<List<ProductCardDto>> wishlistItems(Ref ref) =>
    ref.watch(catalogRepositoryProvider).wishlist();
