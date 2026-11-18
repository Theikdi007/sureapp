import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/adaptive/window_class.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_image.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../data/catalog_dtos.dart';
import '../data/catalog_repository.dart';
import 'shop_state.dart';
import 'catalog_providers.dart';
import 'product_detail_screen.dart' show RateBox;
import 'widgets/catalog_widgets.dart';
import '../../../core/utils/plural.dart';

/// Loading / error / data slivers for a simple list screen.
List<Widget> _asyncSlivers<T>(
  AsyncValue<T> value,
  VoidCallback onRetry,
  List<Widget> Function(T data) builder,
) => switch (value) {
  AsyncData(:final value) => builder(value),
  AsyncError(:final error) when !value.isLoading => [
    SliverToBoxAdapter(
      child: EmptyState(
        icon: LucideIcons.wifiOff,
        title: "Couldn't load this",
        description: error is ApiException ? error.userMessage : null,
        action: SureLink('Try again', onTap: onRetry),
      ),
    ),
  ],
  _ => [
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Builder(
          builder: (context) => Center(
            child: SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: context.colors.primaryInk,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
};

/// PageScaffold's content starts 4 pt under the 48 pt PageHeader; this
/// tops it up to the prototype's 16 pt screen gap.
const double _belowHeader = 12;

String _compact(int n) =>
    n >= 1000 ? '${(n / 1000).toStringAsFixed(n >= 10000 ? 0 : 1)}k' : '$n';

// ─── All Brands ──────────────────────────────────────────────────────────

/// Prototype "All Brands": 3-column tiles with logo, name and count.
class BrandsScreen extends ConsumerWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brands = ref.watch(allBrandsProvider);
    final c = context.colors;
    final cols = switch (WindowClass.of(context)) {
      WindowClass.compact => 3,
      WindowClass.medium => 5,
      WindowClass.expanded => 6,
    };
    return PageScaffold(
      title: 'Shop by Brand',
      subtitle: brands.value == null
          ? null
          : '${brands.value!.length} official partner stores',
      onRefresh: () => ref.refresh(allBrandsProvider.future),
      slivers: _asyncSlivers(
        brands,
        () => ref.invalidate(allBrandsProvider),
        (list) => [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, _belowHeader, 20, 0),
            sliver: SliverToBoxAdapter(
              child: CellGrid(
                columns: cols,
                rowGap: 12,
                colGap: 12,
                children: [
                  for (final b in list)
                    PressScale(
                      semanticLabel: b.name,
                      onTap: () => context.push(
                        AppRoutes.browse(brand: b.id, brandName: b.name),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: SureRadius.all(SureRadius.large),
                          border: Border.all(color: c.boxBorderFaded),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 64,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: SureRadius.all(10),
                                child: SureImage(
                                  b.logoUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              b.name,
                              style: SureText.caption1(SureTypography.medium)
                                  .copyWith(color: c.ink),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              b.productCount == 0
                                  ? 'Coming soon'
                                  : '${b.productCount} '
                                        'product${b.productCount == 1 ? '' : 's'}',
                              style: TextStyle(
                                fontFamily: SureTypography.fontFamily,
                                fontSize: 10,
                                color: c.inkFaded,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── All Stores ──────────────────────────────────────────────────────────

/// Prototype "All Stores": one outlined row per official store.
class StoresScreen extends ConsumerWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vendors = ref.watch(allVendorsProvider);
    final c = context.colors;
    return PageScaffold(
      title: 'Shop by Store',
      subtitle: vendors.value == null
          ? null
          : '${vendors.value!.length} official stores',
      onRefresh: () => ref.refresh(allVendorsProvider.future),
      slivers: _asyncSlivers(
        vendors,
        () => ref.invalidate(allVendorsProvider),
        (list) => [
          SliverPadding(
            // Prototype "All Stores" uses a 12 pt screen gap.
            padding: const EdgeInsets.fromLTRB(20, _belowHeader - 4, 20, 0),
            sliver: SliverList.separated(
              itemCount: list.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final v = list[i];
                return PressScale(
                  scale: 0.98,
                  semanticLabel: '${v.name}, ${v.tagline}',
                  onTap: () => context.push(AppRoutes.store(v.id)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: SureRadius.all(SureRadius.large),
                      border: Border.all(color: c.boxBorderFaded),
                    ),
                    child: Row(
                      children: [
                        VendorAvatar(
                          initials: v.initials,
                          color: v.color,
                          backgroundColor: v.backgroundColor,
                          size: 48,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VerifiedName(
                                v.name,
                                style: TextStyle(
                                  fontFamily: SureTypography.fontFamily,
                                  fontSize: 15,
                                  fontWeight: SureTypography.bold,
                                  color: c.ink,
                                ),
                              ),
                              Text(
                                v.tagline,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: SureText.caption1().copyWith(
                                  color: c.inkFaded,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${v.rating} ★ · ${plural(v.productCount, 'product')}',
                                style: TextStyle(
                                  fontFamily: SureTypography.fontFamily,
                                  fontSize: 11,
                                  color: c.inkFaded,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          LucideIcons.chevronRight,
                          size: 16,
                          color: c.inkFaded,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Vendor Store ────────────────────────────────────────────────────────

/// Prototype "Vendor Store": store card (rating, products, Store Rating),
/// search + filter (Category, Rating, Sort by), the store's products.
/// `GET vendors/{id}`, `GET products?vendor=`, rating sheet:
/// `GET vendors/{id}/rating`, `GET vendors/{id}/reviews`,
/// `POST vendors/{id}/reviews`.
class VendorStoreScreen extends ConsumerStatefulWidget {
  const VendorStoreScreen({super.key, required this.vendorId});

  final String vendorId;

  @override
  ConsumerState<VendorStoreScreen> createState() => _VendorStoreScreenState();
}

class _VendorStoreScreenState extends ConsumerState<VendorStoreScreen> {
  late ProductQuery _query = ProductQuery(vendor: widget.vendorId);
  final _search = TextEditingController();
  bool _filterOpen = false;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _search.dispose();
    super.dispose();
  }

  bool get _active =>
      _query.category != 'all' ||
      _query.sort != 'featured' ||
      _query.minRating != null;

  @override
  Widget build(BuildContext context) {
    final vendor = ref.watch(vendorDetailProvider(widget.vendorId));
    final products = ref.watch(productSearchProvider(_query));
    final v = vendor.value;
    final facets = products.value?.result.facets ?? const SearchFacetsDto();

    return PageScaffold(
      title: v?.name ?? '',
      subtitle: 'Official store',
      onRefresh: () async {
        ref.invalidate(vendorDetailProvider(widget.vendorId));
        ref.invalidate(productSearchProvider(_query));
        await ref.read(productSearchProvider(_query).future);
      },
      slivers: [
        if (v != null)
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, _belowHeader, 20, 16),
            sliver: SliverToBoxAdapter(child: _StoreCard(vendor: v)),
          ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            20,
            v == null ? _belowHeader : 0,
            20,
            16,
          ),
          sliver: SliverToBoxAdapter(
            child: SearchFilterBar(
              controller: _search,
              placeholder: 'Search in this store',
              onChanged: (t) {
                _debounce?.cancel();
                _debounce = Timer(
                  const Duration(milliseconds: 300),
                  () => setState(() => _query = _query.copyWith(q: t.trim())),
                );
              },
              filterOpen: _filterOpen,
              filterActive: _active,
              onFilter: () => setState(() => _filterOpen = !_filterOpen),
            ),
          ),
        ),
        if (_filterOpen)
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            sliver: SliverToBoxAdapter(
              child: FilterPanel(
                onReset: _active
                    ? () => setState(
                        () => _query = ProductQuery(
                          vendor: widget.vendorId,
                          q: _query.q,
                        ),
                      )
                    : null,
                groups: [
                  FilterGroup(
                    'Category',
                    [for (final f in facets.categories) (f.key, f.label)],
                    _query.category,
                    (k) =>
                        setState(() => _query = _query.copyWith(category: k)),
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
        ..._asyncSlivers(
          products,
          () => ref.invalidate(productSearchProvider(_query)),
          (s) => [
            // A search or filter with no hits is "no matches", not an
            // empty store.
            if (s.items.isEmpty &&
                ((_query.q ?? '').isNotEmpty ||
                    _query !=
                        ProductQuery(vendor: widget.vendorId, q: _query.q)))
              const SliverToBoxAdapter(
                child: EmptyState(
                  icon: LucideIcons.searchX,
                  title: 'No matches',
                  description: 'Try a different search or clear the filters',
                ),
              )
            else if (s.items.isEmpty)
              const SliverToBoxAdapter(
                child: EmptyState(
                  icon: LucideIcons.store,
                  title: 'New arrivals coming soon',
                  description: 'Check back soon for new products',
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverToBoxAdapter(
                  child: ProductGrid(products: s.items),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _StoreCard extends StatelessWidget {
  const _StoreCard({required this.vendor});

  final VendorDto vendor;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final v = vendor;
    Widget stat(String value, String label) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontFamily: SureTypography.fontFamily,
            fontSize: 15,
            fontWeight: SureTypography.bold,
            color: c.ink,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: SureTypography.fontFamily,
            fontSize: 11,
            color: c.inkFaded,
          ),
        ),
      ],
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(color: c.boxBorderFaded),
      ),
      child: Column(
        children: [
          Row(
            children: [
              VendorAvatar(
                initials: v.initials,
                color: v.color,
                backgroundColor: v.backgroundColor,
                size: 56,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerifiedName(
                      v.name,
                      gap: 5,
                      style: TextStyle(
                        fontFamily: SureTypography.fontFamily,
                        fontSize: 17,
                        fontWeight: SureTypography.bold,
                        color: c.ink,
                      ),
                    ),
                    Text(
                      v.tagline,
                      style: SureText.caption1().copyWith(color: c.inkFaded),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _FollowPill(vendor: v),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              stat('${v.rating}', 'Rating'),
              const SizedBox(width: 24),
              stat(_compact(v.productCount), 'Products'),
              const Spacer(),
              PressScale(
                scale: 0.96,
                semanticLabel: 'Store Rating',
                onTap: () => _showStoreRating(context, v),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: c.primaryFaded,
                    borderRadius: SureRadius.all(SureRadius.pill),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Prototype `starSm`: filled 14 pt star.
                      Icon(
                        Icons.star_rounded,
                        size: 14 * 1.15,
                        color: c.primaryInk,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Store Rating',
                        style: TextStyle(
                          fontFamily: SureTypography.fontFamily,
                          fontSize: 13,
                          fontWeight: SureTypography.medium,
                          color: c.primaryInk,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Follow / Following pill (`PUT|DELETE vendors/{id}/follow`). Same pill
/// as the card's Store Rating button: neon-faded "Follow", solid neon
/// "Following" (like the coupon Copy / Copied pill). Flips at once and
/// rolls back if the call fails.
class _FollowPill extends ConsumerStatefulWidget {
  const _FollowPill({required this.vendor});

  final VendorDto vendor;

  @override
  ConsumerState<_FollowPill> createState() => _FollowPillState();
}

class _FollowPillState extends ConsumerState<_FollowPill> {
  bool? _pending;
  bool _busy = false;

  Future<void> _toggle() async {
    if (_busy) return;
    final next = !(_pending ?? widget.vendor.following);
    setState(() {
      _pending = next;
      _busy = true;
    });
    final repo = ref.read(catalogRepositoryProvider);
    try {
      next
          ? await repo.follow(widget.vendor.id)
          : await repo.unfollow(widget.vendor.id);
      ref.invalidate(vendorDetailProvider(widget.vendor.id));
      ref.invalidate(allVendorsProvider);
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _pending = !next);
      SureToast.show(
        context,
        e.userMessage,
        icon: LucideIcons.circleAlert,
        color: SureToastColor.critical,
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  void didUpdateWidget(_FollowPill old) {
    super.didUpdateWidget(old);
    // The refreshed store is the truth once it arrives.
    if (!_busy && old.vendor != widget.vendor) _pending = null;
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final on = _pending ?? widget.vendor.following;
    return PressScale(
      scale: 0.95,
      semanticLabel: on
          ? 'Following ${widget.vendor.name}'
          : 'Follow ${widget.vendor.name}',
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: on ? c.primary : c.primaryFaded,
          borderRadius: SureRadius.all(SureRadius.pill),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              on ? LucideIcons.check : LucideIcons.plus,
              size: 14,
              color: on ? c.onPrimary : c.primaryInk,
            ),
            const SizedBox(width: 4),
            Text(
              on ? 'Following' : 'Follow',
              style: SureTypography.style(
                size: 13,
                weight: SureTypography.bold,
                color: on ? c.onPrimary : c.primaryInk,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Store rating sheet (prototype `STORE RATING SHEET`): the store's star
/// breakdown, rate the store, recent reviews. Shared `SureSheet` (Liquid
/// Glass, 80% max height, no title row).
void _showStoreRating(BuildContext context, VendorDto v) {
  showSureSheet<void>(
    context,
    showClose: false,
    maxHeightFactor: 0.8,
    builder: (_) => _StoreRatingSheet(vendor: v),
  );
}

class _StoreRatingSheet extends ConsumerStatefulWidget {
  const _StoreRatingSheet({required this.vendor});

  final VendorDto vendor;

  @override
  ConsumerState<_StoreRatingSheet> createState() => _StoreRatingSheetState();
}

class _StoreRatingSheetState extends ConsumerState<_StoreRatingSheet> {
  late Future<(RatingSummaryDto, List<ReviewDto>)> _load = _fetch();

  Future<(RatingSummaryDto, List<ReviewDto>)> _fetch() async {
    final repo = ref.read(catalogRepositoryProvider);
    final r = await repo.vendorRating(widget.vendor.id);
    final reviews = await repo.vendorReviews(widget.vendor.id);
    return (r, reviews.items);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final divider = Container(height: 1, color: c.borderFaded);
    return SingleChildScrollView(
      child: FutureBuilder(
        future: _load,
        builder: (context, snap) {
          if (snap.hasError) {
            return EmptyState(
              icon: LucideIcons.wifiOff,
              title: "Couldn't load ratings",
              action: SureLink(
                'Try again',
                onTap: () => setState(() => _load = _fetch()),
              ),
            );
          }
          if (!snap.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: c.primaryInk,
                  ),
                ),
              ),
            );
          }
          final (summary, reviews) = snap.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Semantics(
                label: '${widget.vendor.name} rating',
                child: RatingSummaryView(
                  gap: 14,
                  showPercent: false,
                  summary: summary.count == 0
                      ? RatingSummaryDto(
                          average: widget.vendor.rating,
                          count: widget.vendor.ratingCount,
                        )
                      : summary,
                ),
              ),
              const SizedBox(height: 16),
              divider,
              const SizedBox(height: 16),
              RateBox(
                title: 'Rate this store',
                submitLabel: 'Submit rating',
                inline: true,
                onSubmit: (rating, text, key) async {
                  await ref
                      .read(catalogRepositoryProvider)
                      .reviewVendor(
                        widget.vendor.id,
                        rating: rating,
                        text: text,
                        key: key,
                      );
                  setState(() => _load = _fetch());
                },
              ),
              if (reviews.isNotEmpty) ...[const SizedBox(height: 16), divider],
              for (final r in reviews) ...[
                const SizedBox(height: 16),
                _StoreReviewTile(review: r),
              ],
            ],
          );
        },
      ),
    );
  }
}

/// Review row in the store rating sheet: 32 pt initial disc, 13/600 name,
/// 11 pt date, 12 pt stars on the right, 13/1.5 text.
class _StoreReviewTile extends StatelessWidget {
  const _StoreReviewTile({required this.review});

  final ReviewDto review;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final name = review.name.trim();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: c.primaryFaded,
                shape: BoxShape.circle,
              ),
              child: Text(
                name.isEmpty ? '?' : name.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  fontFamily: SureTypography.fontFamily,
                  fontSize: 13,
                  fontWeight: SureTypography.bold,
                  color: c.primaryInk,
                ),
              ),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: SureTypography.fontFamily,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: c.ink,
                    ),
                  ),
                  Text(
                    MyanmarTime.format(review.createdAt, pattern: 'dd MMM y'),
                    style: TextStyle(
                      fontFamily: SureTypography.fontFamily,
                      fontSize: 11,
                      color: c.inkFaded,
                    ),
                  ),
                ],
              ),
            ),
            StarRow(rating: review.rating, size: 12, gap: 1),
          ],
        ),
        if (review.text != null && review.text!.isNotEmpty) ...[
          const SizedBox(height: 5),
          Text(
            review.text!,
            style: TextStyle(
              fontFamily: SureTypography.fontFamily,
              fontSize: 13,
              height: 1.5,
              color: c.inkFaded,
            ),
          ),
        ],
      ],
    );
  }
}

// ─── Wishlist ────────────────────────────────────────────────────────────

/// Prototype "Wishlist": saved products, or "No favorites yet".
/// Hearts turned off here disappear from the list.
class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(wishlistItemsProvider);
    final overrides = ref.watch(wishedProductsProvider);
    final saved = [
      for (final p in items.value ?? const <ProductCardDto>[])
        if (overrides[p.id] ?? true) p,
    ].length;
    return PageScaffold(
      title: 'Wishlist',
      subtitle: saved == 0
          ? 'Your saved products'
          : '$saved saved item${saved == 1 ? '' : 's'}',
      onRefresh: () => ref.refresh(wishlistItemsProvider.future),
      slivers: _asyncSlivers(
        items,
        () => ref.invalidate(wishlistItemsProvider),
        (list) {
          final shown = [
            for (final p in list)
              if (overrides[p.id] ?? true) p,
          ];
          if (shown.isEmpty) {
            return const [
              SliverToBoxAdapter(
                child: EmptyState(
                  icon: LucideIcons.heart,
                  title: 'No favorites yet',
                  description: 'Tap the heart on any product to save it here',
                ),
              ),
            ];
          }
          return [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, _belowHeader, 20, 0),
              sliver: SliverToBoxAdapter(child: ProductGrid(products: shown)),
            ),
          ];
        },
      ),
    );
  }
}
