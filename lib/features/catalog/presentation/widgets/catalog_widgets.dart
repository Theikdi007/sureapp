import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/myanmar_time.dart';
import '../../../../design_system/adaptive/window_class.dart';
import '../../../../design_system/components/item_card.dart';
import '../../../../design_system/components/section_header.dart';
import '../../../../design_system/components/sure_toast.dart';
import '../../../../design_system/theme/app_theme.dart';
import '../../../../design_system/tokens/sure_colors.dart';
import '../../../../design_system/tokens/sure_metrics.dart';
import '../../../../design_system/tokens/sure_typography.dart';
import '../../../../shared/models/money.dart';
import '../../data/catalog_dtos.dart';
import '../../../cart/presentation/cart_sheet.dart';
import '../../../orders/presentation/orders_screen.dart'
    show requestedOrdersTabProvider;
import '../shop_state.dart';

/// Toast for features that land in a later build.
void comingSoon(BuildContext context, String what) => SureToast.show(
  context,
  '$what is coming in the next build',
  icon: LucideIcons.hammer,
  color: SureToastColor.neutral,
);

void showApiError(BuildContext context, Object e) => SureToast.show(
  context,
  e is ApiException ? e.userMessage : 'Something went wrong. Try again.',
  icon: LucideIcons.circleAlert,
  color: SureToastColor.critical,
);

/// Follows an API `LinkDto` (banners, notifications).
void openLink(BuildContext context, LinkDto link) {
  final v = link.value ?? '';
  switch (link.type) {
    case 'search':
      context.push(AppRoutes.browse(q: v.isEmpty ? null : v));
    case 'brand':
      context.push(AppRoutes.browse(brand: v));
    case 'vendor':
      context.push(AppRoutes.store(v));
    case 'product':
      context.push(AppRoutes.product(v));
    case 'deals':
      context.push(AppRoutes.browse(category: 'on_sale'));
    case 'order' when v.isNotEmpty:
      context.push(AppRoutes.order(v));
    case 'reward' when v.isNotEmpty:
      context.push(AppRoutes.reward(v));
    case 'warranty_claim':
      context.push(AppRoutes.warranty);
    case 'home_setup':
      ProviderScope.containerOf(
        context,
        listen: false,
      ).read(requestedOrdersTabProvider.notifier).request('setup');
      context.go(AppRoutes.orders);
    case 'url' when Uri.tryParse(v)?.hasScheme ?? false:
      launchUrl(Uri.parse(v), mode: LaunchMode.externalApplication);
    default:
      comingSoon(context, 'That page');
  }
}

/// Button label for a [LinkDto], e.g. on a notification.
String linkActionLabel(LinkDto link) => switch (link.type) {
  'order' => 'Track this order',
  'reward' => 'View reward',
  'warranty_claim' => 'View warranty claim',
  'home_setup' => 'View home setup visit',
  'product' => 'View product',
  'vendor' => 'Visit store',
  'deals' => 'See deals',
  'url' => 'Open link',
  _ => 'Open',
};

/// Opens product detail.
void openProduct(BuildContext context, String id) =>
    context.push(AppRoutes.product(id));

/// [ItemCard] wired to wishlist, bag and product detail.
class ProductCardTile extends ConsumerWidget {
  const ProductCardTile({super.key, required this.product});

  final ProductCardDto product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wishedProductsProvider);
    final wished = ref.read(wishedProductsProvider.notifier).isWished(product);
    final adding = ref.watch(bagActionsProvider).contains(product.id);
    return ItemCard(
      title: product.name,
      brand: product.brand,
      imageUrl: product.imageUrl,
      price: product.price.display,
      compareAt: product.compareAt?.display,
      discount: product.discountPercent == null
          ? null
          : '-${product.discountPercent}%',
      wished: wished,
      adding: adding,
      onTap: () => openProduct(context, product.id),
      onWish: () async {
        try {
          await ref.read(wishedProductsProvider.notifier).toggle(product);
        } on Object catch (e) {
          if (context.mounted) showApiError(context, e);
        }
      },
      onAdd: () => addToBag(context, ref, product),
    );
  }
}

Future<void> addToBag(
  BuildContext context,
  WidgetRef ref,
  ProductCardDto product,
) async {
  if (!product.inStock) {
    SureToast.show(
      context,
      'This item is out of stock',
      icon: LucideIcons.packageX,
      color: SureToastColor.neutral,
    );
    return;
  }
  try {
    await ref.read(bagActionsProvider.notifier).add(product);
    // Prototype: adding opens the bag sheet.
    if (context.mounted) await showCartSheet(context);
  } on Object catch (e) {
    if (context.mounted) showApiError(context, e);
  }
}

/// Columns for product grids: 2 phone, 3 medium, 4 expanded.
int productColumns(BuildContext context) => switch (WindowClass.of(context)) {
  WindowClass.compact => 2,
  WindowClass.medium => 3,
  WindowClass.expanded => 4,
};

/// Rows of equal cells, top-aligned (prototype `gap: 20px 14px`).
class CellGrid extends StatelessWidget {
  const CellGrid({
    super.key,
    required this.columns,
    required this.children,
    this.rowGap = 20,
    this.colGap = 14,
  });

  final int columns;
  final List<Widget> children;
  final double rowGap;
  final double colGap;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += columns) {
      if (rows.isNotEmpty) rows.add(SizedBox(height: rowGap));
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var j = 0; j < columns; j++) ...[
              if (j > 0) SizedBox(width: colGap),
              Expanded(
                child: i + j < children.length
                    ? children[i + j]
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.products});

  final List<ProductCardDto> products;

  @override
  Widget build(BuildContext context) => CellGrid(
    columns: productColumns(context),
    children: [
      for (var i = 0; i < products.length; i++)
        KeyedSubtree(
          key: ValueKey('p$i-${products[i].id}'),
          child: ProductCardTile(product: products[i]),
        ),
    ],
  );
}

/// Horizontal row of 150 pt product cards, edge to edge.
class ProductRail extends StatelessWidget {
  const ProductRail({super.key, required this.products, this.side = 20});

  final List<ProductCardDto> products;
  final double side;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.fromLTRB(side, 14, side, 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < products.length; i++) ...[
          if (i > 0) const SizedBox(width: 14),
          SizedBox(width: 150, child: ProductCardTile(product: products[i])),
        ],
      ],
    ),
  );
}

/// Rounded search field + 48 pt filter button (neon when open/active, red
/// dot when filters are applied but the panel is closed).
class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.onChanged,
    required this.filterOpen,
    required this.filterActive,
    required this.onFilter,
    this.autofocus = false,
  });

  final TextEditingController controller;
  final String placeholder;
  final ValueChanged<String> onChanged;
  final bool filterOpen;
  final bool filterActive;
  final VoidCallback onFilter;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final on = filterOpen || filterActive;
    final border = OutlineInputBorder(
      borderRadius: SureRadius.all(SureRadius.pill),
      borderSide: BorderSide(color: c.border),
    );
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: controller,
              autofocus: autofocus,
              onChanged: onChanged,
              textInputAction: TextInputAction.search,
              textAlignVertical: TextAlignVertical.center,
              // Fill the 40 pt box so the outline is the full height.
              expands: true,
              maxLines: null,
              style: SureText.body3().copyWith(color: c.ink),
              cursorColor: c.primaryInk,
              decoration: InputDecoration(
                isCollapsed: true,
                filled: true,
                fillColor: c.raised,
                hintText: placeholder,
                hintStyle: SureText.body3().copyWith(color: c.inkFaded),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12, end: 8),
                  child: Icon(LucideIcons.search, size: 18, color: c.inkFaded),
                ),
                prefixIconConstraints: const BoxConstraints(),
                border: border,
                enabledBorder: border,
                focusedBorder: border,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Semantics(
          button: true,
          toggled: filterOpen,
          label: filterActive ? 'Filters, applied' : 'Filters',
          excludeSemantics: true,
          child: PressScale(
            onTap: onFilter,
            scale: 0.96,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: on ? c.primary : c.keypad,
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    LucideIcons.slidersHorizontal,
                    size: 20,
                    color: on ? c.onPrimary : c.ink,
                  ),
                  if (filterActive && !filterOpen)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: c.critical,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FilterGroup {
  const FilterGroup(this.title, this.options, this.selected, this.onPick);

  final String title;

  /// (key, label)
  final List<(String, String)> options;
  final String selected;
  final ValueChanged<String> onPick;
}

/// Prototype filter panel: outlined box, 13/750 group titles, pill chips
/// (selected: neon-faded with a 1.5 pt dark-green ring), "Clear all filters".
class FilterPanel extends StatelessWidget {
  const FilterPanel({super.key, required this.groups, this.onReset});

  final List<FilterGroup> groups;

  /// Shown when non-null (filters applied).
  final VoidCallback? onReset;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(color: c.boxBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var g = 0; g < groups.length; g++) ...[
            if (g > 0) const SizedBox(height: 12),
            Text(
              groups[g].title,
              style: TextStyle(
                fontFamily: SureTypography.fontFamily,
                fontSize: 13,
                fontWeight: SureTypography.bold,
                color: c.ink,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final (key, label) in groups[g].options)
                  FilterChipPill(
                    label: label,
                    selected: groups[g].selected == key,
                    onTap: () => groups[g].onPick(key),
                  ),
              ],
            ),
          ],
          if (onReset != null) ...[
            const SizedBox(height: 16),
            PressScale(
              onTap: onReset,
              scale: 0.96,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: c.keypad,
                  borderRadius: SureRadius.all(SureRadius.pill),
                ),
                child: Text(
                  'Clear all filters',
                  style: SureText.caption1(SureTypography.bold)
                      .copyWith(color: c.critical),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class FilterChipPill extends StatelessWidget {
  const FilterChipPill({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      selected: selected,
      child: PressScale(
        onTap: onTap,
        scale: 0.96,
        child: AnimatedContainer(
          duration: SureMotion.fast,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? c.primaryFaded : c.keypad,
            borderRadius: SureRadius.all(SureRadius.pill),
            border: Border.all(
              color: selected ? SureBrand.darkGreen : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Text(
            label,
            style: SureText.caption1(SureTypography.medium)
                .copyWith(color: selected ? c.primaryInk : c.ink),
          ),
        ),
      ),
    );
  }
}

/// Five stars, filled to [rating] (rounded to whole stars).
class StarRow extends StatelessWidget {
  const StarRow({
    super.key,
    required this.rating,
    this.size = 16,
    this.gap = 2,
  });

  final num rating;
  final double size;
  final double gap;

  static const amber = Color(0xFFF5A623);

  @override
  Widget build(BuildContext context) {
    final full = rating.round();
    return Semantics(
      label: '$rating out of 5 stars',
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 5; i++) ...[
            if (i > 0) SizedBox(width: gap),
            // Filled stars (prototype: Lucide star with fill).
            Icon(
              Icons.star_rounded,
              size: size * 1.15,
              color: i < full ? amber : context.colors.border,
            ),
          ],
        ],
      ),
    );
  }
}

/// Big average, stars, count, and 5→1 bars (prototype Ratings and Reviews).
/// The store rating sheet uses a 14 pt gap and no percent column.
class RatingSummaryView extends StatelessWidget {
  const RatingSummaryView({
    super.key,
    required this.summary,
    this.gap = 20,
    this.showPercent = true,
  });

  final RatingSummaryDto summary;
  final double gap;
  final bool showPercent;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final buckets = {for (final b in summary.distribution) b.stars: b};
    return Row(
      children: [
        Column(
          children: [
            Text(
              summary.average.toStringAsFixed(1),
              style: TextStyle(
                fontFamily: SureTypography.titleFamily,
                fontSize: 40,
                height: 1,
                fontWeight: FontWeight.w900,
                color: c.ink,
              ),
            ),
            const SizedBox(height: 6),
            StarRow(rating: summary.average, size: 14),
            const SizedBox(height: 5),
            Text(
              '${summary.count} reviews',
              style: TextStyle(
                fontFamily: SureTypography.fontFamily,
                fontSize: 11,
                color: c.inkFaded,
              ),
            ),
          ],
        ),
        SizedBox(width: gap),
        Expanded(
          child: Column(
            children: [
              for (var s = 5; s >= 1; s--) ...[
                if (s < 5) const SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                      child: Text('$s', style: _small(c.inkFaded)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: SureRadius.all(SureRadius.pill),
                        child: LinearProgressIndicator(
                          value: (buckets[s]?.percent ?? 0) / 100,
                          minHeight: 6,
                          backgroundColor: SureColors.ratingTrack,
                          color: StarRow.amber,
                        ),
                      ),
                    ),
                    if (showPercent) ...[
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 28,
                        child: Text(
                          '${(buckets[s]?.percent ?? 0).round()}%',
                          textAlign: TextAlign.right,
                          style: _small(c.inkFaded),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  static TextStyle _small(Color color) => TextStyle(
    fontFamily: SureTypography.fontFamily,
    fontSize: 11,
    color: color,
  );
}

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});

  final ReviewDto review;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                review.name,
                style: SureText.body3(FontWeight.w600).copyWith(color: c.ink),
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
        const SizedBox(height: 5),
        StarRow(rating: review.rating, size: 12),
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

/// Initials disc for stores (API colors).
class VendorAvatar extends StatelessWidget {
  const VendorAvatar({
    super.key,
    required this.initials,
    required this.color,
    required this.backgroundColor,
    this.size = 44,
  });

  final String initials;
  final String color;
  final String backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Color(parseApiColor(backgroundColor) ?? 0xFF14161B),
      shape: BoxShape.circle,
    ),
    child: Text(
      initials,
      style: TextStyle(
        fontFamily: SureTypography.familyFor(size * 0.36, FontWeight.w900),
        fontSize: size * 0.36,
        fontWeight: FontWeight.w900,
        color: Color(parseApiColor(color) ?? 0xFFFFFFFF),
      ),
    ),
  );
}

/// Name + 15 pt electric-blue verified badge (prototype `ico.verified`).
class VerifiedName extends StatelessWidget {
  const VerifiedName(this.name, {super.key, required this.style, this.gap = 4});

  final String name;
  final TextStyle style;
  final double gap;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: style,
        ),
      ),
      SizedBox(width: gap),
      const Icon(LucideIcons.badgeCheck, size: 15, color: SureBrand.electric),
    ],
  );
}
