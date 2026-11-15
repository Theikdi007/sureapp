import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/theme/app_theme.dart';
import '../data/catalog_dtos.dart';
import '../data/catalog_repository.dart';
import 'catalog_providers.dart';
import 'widgets/catalog_widgets.dart';

/// Prototype "Browse": header, search + filter button (pinned under the
/// header, glass when scrolled), filter panel, product grid, empty states.
/// `GET products` with q, category, brand, vendor, minRating, sort.
class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({
    super.key,
    this.initialQuery = const ProductQuery(),
    this.brandName,
    this.focusSearch = false,
  });

  final ProductQuery initialQuery;
  final String? brandName;
  final bool focusSearch;

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  late ProductQuery _query = widget.initialQuery;
  late final _search = TextEditingController(text: widget.initialQuery.q);
  bool _filterOpen = false;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _search.dispose();
    super.dispose();
  }

  void _onSearch(String text) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() => _query = _query.copyWith(q: text.trim()));
    });
  }

  bool get _filtersActive =>
      _query.category != 'all' ||
      _query.sort != 'featured' ||
      _query.vendor != null ||
      (_query.brand != null && _query.brand != widget.initialQuery.brand) ||
      _query.minRating != null;

  void _reset() => setState(
    () => _query = ProductQuery(q: _query.q, brand: widget.initialQuery.brand),
  );

  @override
  Widget build(BuildContext context) {
    final provider = productSearchProvider(_query);
    final search = ref.watch(provider);
    final data = search.value;
    final deals = widget.initialQuery.category == 'on_sale';

    final title = widget.brandName ?? (deals ? 'Flash Deals' : 'All Products');
    final subtitle = widget.brandName != null
        ? 'Browse ${widget.brandName} products'
        : deals
        ? 'Limited-time offers'
        : data == null
        ? null
        : '${data.result.total} products';

    final facets = data?.result.facets ?? const SearchFacetsDto();

    return NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (n.metrics.axis == Axis.vertical && n.metrics.extentAfter < 400) {
          ref.read(provider.notifier).loadMore();
        }
        return false;
      },
      child: PageScaffold(
        title: title,
        subtitle: subtitle,
        // Prototype: 16 between header, search row and content.
        pinnedHeight: 12 + 48 + 16,
        pinnedBelowHeader: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 16),
          child: SearchFilterBar(
            controller: _search,
            autofocus: widget.focusSearch,
            placeholder: 'Search products',
            onChanged: _onSearch,
            filterOpen: _filterOpen,
            filterActive: _filtersActive,
            onFilter: () => setState(() => _filterOpen = !_filterOpen),
          ),
        ),
        onRefresh: () => ref.refresh(provider.future),
        slivers: [
          if (_filterOpen)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              sliver: SliverToBoxAdapter(
                child: FilterPanel(
                  onReset: _filtersActive ? _reset : null,
                  groups: [
                    FilterGroup(
                      'Category',
                      [for (final f in facets.categories) (f.key, f.label)],
                      _query.category,
                      (k) =>
                          setState(() => _query = _query.copyWith(category: k)),
                    ),
                    FilterGroup(
                      'Store',
                      [
                        ('', 'All Stores'),
                        for (final f in facets.vendors) (f.key, f.label),
                      ],
                      _query.vendor ?? '',
                      (k) => setState(
                        () => _query = _query.copyWith(
                          vendor: () => k.isEmpty ? null : k,
                        ),
                      ),
                    ),
                    if (widget.initialQuery.brand == null)
                      FilterGroup(
                        'Brand',
                        [
                          ('', 'All Brands'),
                          for (final f in facets.brands) (f.key, f.label),
                        ],
                        _query.brand ?? '',
                        (k) => setState(
                          () => _query = _query.copyWith(
                            brand: () => k.isEmpty ? null : k,
                          ),
                        ),
                      ),
                    FilterGroup(
                      'Rating',
                      const [
                        ('', 'Any'),
                        ('4.0', '4.0+'),
                        ('4.5', '4.5+'),
                        ('4.8', '4.8+'),
                      ],
                      _query.minRating?.toStringAsFixed(1) ?? '',
                      (k) => setState(
                        () => _query = _query.copyWith(
                          minRating: () => double.tryParse(k),
                        ),
                      ),
                    ),
                    FilterGroup(
                      'Sort by',
                      const [
                        ('featured', 'Featured'),
                        ('price_low', 'Price: Low to High'),
                        ('price_high', 'Price: High to Low'),
                        ('top_rated', 'Top Rated'),
                      ],
                      _query.sort,
                      (k) => setState(() => _query = _query.copyWith(sort: k)),
                    ),
                  ],
                ),
              ),
            ),
          ...switch (search) {
            AsyncData(:final value) => _results(value),
            AsyncError(:final error) when !search.isLoading => [
              SliverToBoxAdapter(
                child: EmptyState(
                  icon: LucideIcons.wifiOff,
                  title: "Couldn't load products",
                  description: error is ApiException ? error.userMessage : null,
                  action: SureLink(
                    'Try again',
                    onTap: () => ref.invalidate(provider),
                  ),
                ),
              ),
            ],
            _ => [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 48),
                  child: Center(child: _Spinner()),
                ),
              ),
            ],
          },
        ],
      ),
    );
  }

  List<Widget> _results(SearchState s) {
    if (s.items.isEmpty) {
      final brandEmpty = s.result.brandHasProducts == false;
      return [
        SliverToBoxAdapter(
          child: brandEmpty
              ? EmptyState(
                  icon: LucideIcons.store,
                  title: 'New arrivals coming soon',
                  description:
                      "We're stocking ${widget.brandName ?? 'this brand'} — "
                      'browse everything in the meantime',
                  action: SureButton(
                    label: 'Browse all products',
                    size: SureButtonSize.small,
                    fullWidth: false,
                    onPressed: () =>
                        context.pushReplacement(AppRoutes.products),
                  ),
                )
              : EmptyState(
                  icon: LucideIcons.searchX,
                  title: 'No matches',
                  description: 'Try a different search or browse all products',
                  action: _filtersActive
                      ? SureButton(
                          label: 'Clear filters',
                          size: SureButtonSize.small,
                          fullWidth: false,
                          onPressed: _reset,
                        )
                      : null,
                ),
        ),
      ];
    }
    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        sliver: SliverToBoxAdapter(child: ProductGrid(products: s.items)),
      ),
      if (s.loadingMore)
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(child: _Spinner()),
          ),
        ),
    ];
  }
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: 20,
    child: CircularProgressIndicator(
      strokeWidth: 2.5,
      color: context.colors.primaryInk,
    ),
  );
}
