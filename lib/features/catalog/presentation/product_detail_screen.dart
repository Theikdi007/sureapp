import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/photo_brightness.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_image.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/glass/glass_surface.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_colors.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../cart/presentation/cart_sheet.dart';
import '../../orders/data/order_dtos.dart';
import '../../orders/presentation/home_setup_sheet.dart';
import '../../orders/presentation/order_detail_screen.dart'
    show HomeSetupVisitCard;
import '../../orders/presentation/orders_screen.dart'
    show homeSetupBookingsProvider;
import '../data/catalog_dtos.dart';
import '../data/catalog_repository.dart';
import 'shop_state.dart';
import 'catalog_providers.dart';
import 'widgets/catalog_widgets.dart';

/// Prototype "Product Detail". `GET products/{id}` (price and stock fresh
/// from Cin7), `GET products/{id}/reviews`, `POST products/{id}/reviews`,
/// `PUT wishlist/{id}`, `POST cart/items`.
class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(productDetailProvider(productId));
    return switch (detail) {
      AsyncData(:final value) => _ProductView(product: value),
      AsyncError(:final error) when !detail.isLoading => _Failed(
        error: error,
        onRetry: () => ref.invalidate(productDetailProvider(productId)),
      ),
      _ => const _Loading(),
    };
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.page,
    body: Stack(
      children: [
        Center(
          child: SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: context.colors.primaryInk,
            ),
          ),
        ),
        const _TopButtons(),
      ],
    ),
  );
}

class _Failed extends StatelessWidget {
  const _Failed({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.page,
    body: Stack(
      children: [
        Center(
          child: EmptyState(
            icon: LucideIcons.packageX,
            title: "Couldn't load this product",
            description: error is ApiException
                ? (error as ApiException).userMessage
                : null,
            action: SureLink('Try again', onTap: onRetry),
          ),
        ),
        const _TopButtons(),
      ],
    ),
  );
}

class _ProductView extends ConsumerStatefulWidget {
  const _ProductView({required this.product});

  final ProductDetailDto product;

  @override
  ConsumerState<_ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<_ProductView> {
  late Map<String, String> _picks = _defaultPicks();
  int _image = 0;
  bool _adding = false;

  /// Status bar sits on the dark photo until it scrolls away: light icons
  /// there (prototype), page-colored icons after.
  bool _overPhoto = true;
  bool _homeSetupOpen = false;

  ProductDetailDto get p => widget.product;

  Map<String, String> _defaultPicks() {
    final v = p.variants.where((v) => v.sku == p.defaultSku).firstOrNull;
    if (v != null) return Map.of(v.picks);
    return {
      for (final g in p.options)
        if (g.options.isNotEmpty) g.key: g.options.first.value,
    };
  }

  /// The variant matching every pick (API: `variants[].picks`).
  VariantDto? get _variant => p.variants
      .where((v) => _picks.entries.every((e) => v.picks[e.key] == e.value))
      .firstOrNull;

  ProductCardDto get _asCard => ProductCardDto(
    id: p.id,
    name: p.name,
    brand: p.brand,
    imageUrl: p.images.firstOrNull,
    price: p.price,
    inStock: p.inStock,
    wished: p.wished,
    defaultSku: p.defaultSku,
  );

  Future<void> _addToCart() async {
    final v = _variant;
    if (_adding) return;
    setState(() => _adding = true);
    try {
      await ref
          .read(bagProvider.notifier)
          .add(productId: p.id, sku: v?.sku, key: IdempotencyKey.generate());
      if (mounted) await showCartSheet(context);
    } on Object catch (e) {
      if (mounted) showApiError(context, e);
    } finally {
      if (mounted) setState(() => _adding = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final v = _variant;
    final price = v?.price ?? p.price;
    final inStock = v?.inStock ?? p.inStock;
    final bottom = MediaQuery.paddingOf(context).bottom;

    final panels = <Widget>[
      _TitlePanel(product: p, inStock: inStock),
      if (p.seller != null) _SellerRow(seller: p.seller!),
      if (p.options.isNotEmpty)
        _OptionsPanel(
          groups: p.options,
          picks: _picks,
          onPick: (k, val) => setState(() => _picks = {..._picks, k: val}),
        ),
      if (p.description != null && p.description!.isNotEmpty)
        _Panel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SectionHeader(
                title: 'About this product',
                size: SectionHeaderSize.small,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: SureColors.literalPanel,
                  borderRadius: SureRadius.all(SureRadius.large),
                ),
                child: Text(
                  p.description!,
                  style: SureText.body3().copyWith(
                    color: c.inkFaded,
                    height: 1.55,
                  ),
                ),
              ),
            ],
          ),
        ),
      if (p.specs.isNotEmpty) _SpecsPanel(specs: p.specs),
      if (p.homeSetup.eligible)
        _Panel(
          child: _HomeSetupCard(
            offer: p.homeSetup,
            onSchedule: () async {
              final b = await showScheduleHomeVisit(
                context,
                productId: p.id,
                device: p.name,
              );
              if (b == null || !context.mounted) return;
              ref
                ..invalidate(productDetailProvider(p.id))
                ..invalidate(homeSetupBookingsProvider);
              SureToast.show(
                context,
                'Home visit booked · ${b.slotLabel}',
                icon: LucideIcons.calendarCheck,
                color: SureToastColor.positive,
              );
            },
            open: _homeSetupOpen,
            onToggle: () => setState(() => _homeSetupOpen = !_homeSetupOpen),
          ),
        ),
      _ReviewsPanel(product: p),
      if (p.similar.isNotEmpty)
        Container(
          color: c.page,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SectionHeader(
                  title: 'You might also like',
                  description: "Don't miss the new products",
                ),
              ),
              ProductRail(products: p.similar),
            ],
          ),
        ),
    ];

    final top = MediaQuery.paddingOf(context).top;
    // Over the photo the status bar follows the photo, not the theme: white
    // on the dark product shots, dark on a light photo (or the API's light
    // grey "no photo" picture), where white icons would vanish.
    final shown = p.images.isEmpty
        ? null
        : p.images[_image.clamp(0, p.images.length - 1)];
    final lightPhoto =
        shown != null &&
        (ref.watch(photoTopIsLightProvider(shown)).value ?? false);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.statusBar(
        _overPhoto
            ? (lightPhoto ? Brightness.light : Brightness.dark)
            : Theme.of(context).brightness,
      ),
      child: Scaffold(
        backgroundColor: c.pageFaded,
        body: NotificationListener<ScrollNotification>(
          onNotification: (n) {
            if (n.metrics.axis != Axis.vertical) return false;
            final over = n.metrics.pixels < 340 + top * 0.5 - top;
            if (over != _overPhoto) setState(() => _overPhoto = over);
            return false;
          },
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: _Gallery(
                      images: p.images,
                      index: _image,
                      onIndex: (i) => setState(() => _image = i),
                    ),
                  ),
                  SliverConstrainedCrossAxis(
                    maxExtent: 840,
                    sliver: SliverList.separated(
                      itemCount: panels.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      itemBuilder: (_, i) => panels[i],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 100 + bottom)),
                ],
              ),
              _TopButtons(product: _asCard, shareUrl: p.shareUrl),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _BuyBar(
                  total: price.displayCode,
                  enabled: inStock,
                  loading: _adding,
                  onAdd: _addToCart,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// White section on the page-faded background (prototype PDP panels).
class _Panel extends StatelessWidget {
  const _Panel({required this.child, this.padding = const EdgeInsets.all(16)});

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) =>
      Container(color: context.colors.page, padding: padding, child: child);
}

// ─── Gallery ─────────────────────────────────────────────────────────────

/// 340 pt photo pager on ink; dots bottom-left, glass "1/3" pill
/// bottom-right; tap opens the zoomable viewer.
class _Gallery extends StatefulWidget {
  const _Gallery({
    required this.images,
    required this.index,
    required this.onIndex,
  });

  final List<String> images;
  final int index;
  final ValueChanged<int> onIndex;

  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  late final _pages = PageController(initialPage: widget.index);

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final n = widget.images.length;
    final top = MediaQuery.paddingOf(context).top;
    return SizedBox(
      height: 340 + top * 0.5,
      child: ColoredBox(
        color: SureBrand.darkGray,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (n > 0)
              PageView.builder(
                controller: _pages,
                itemCount: n,
                onPageChanged: widget.onIndex,
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    PageRouteBuilder<void>(
                      opaque: false,
                      pageBuilder: (_, _, _) =>
                          _ImageViewer(images: widget.images, initial: i),
                      transitionsBuilder: (_, a, _, child) =>
                          FadeTransition(opacity: a, child: child),
                    ),
                  ),
                  child: Semantics(
                    label: 'Product photo ${i + 1} of $n. Tap to zoom',
                    image: true,
                    child: SureImage(widget.images[i]),
                  ),
                ),
              ),
            if (n > 1)
              Positioned(
                left: 20,
                right: 20,
                bottom: 16,
                child: Row(
                  children: [
                    for (var i = 0; i < n; i++) ...[
                      if (i > 0) const SizedBox(width: 4),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        width: i == widget.index ? 18 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: i == widget.index
                              ? SureBrand.neon
                              : Colors.white.withValues(alpha: 0.8),
                          borderRadius: SureRadius.all(SureRadius.pill),
                        ),
                      ),
                    ],
                    const Spacer(),
                    GlassSurface(
                      borderRadius: SureRadius.all(SureRadius.pill),
                      shadow: false,
                      // Prototype: near-solid white for contrast on photos,
                      // in dark mode too (a literal colour there).
                      tint: Colors.white.withValues(alpha: 0.92),
                      solidColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        '${widget.index + 1}/$n',
                        style: SureText.caption1(SureTypography.bold)
                            .copyWith(color: SureColors.literalInk),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Full-screen photo viewer: pinch/double-tap zoom, prev/next.
class _ImageViewer extends StatefulWidget {
  const _ImageViewer({required this.images, required this.initial});

  final List<String> images;
  final int initial;

  @override
  State<_ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<_ImageViewer> {
  late final _pages = PageController(initialPage: widget.initial);
  late int _i = widget.initial;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  Widget _round(IconData icon, String label, VoidCallback? onTap) => Semantics(
    button: true,
    label: label,
    excludeSemantics: true,
    child: PressScale(
      onTap: onTap,
      scale: 0.94,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: Colors.white),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final n = widget.images.length;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.statusBar(Brightness.dark),
      child: Scaffold(
        backgroundColor: const Color(0xF50A0B0E),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: [
                    Text(
                      '${_i + 1}/$n',
                      style: TextStyle(
                        fontFamily: SureTypography.fontFamily,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    const Spacer(),
                    _round(
                      LucideIcons.x,
                      'Close',
                      () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pages,
                  itemCount: n,
                  onPageChanged: (i) => setState(() => _i = i),
                  itemBuilder: (_, i) => InteractiveViewer(
                    maxScale: 4,
                    child: Center(
                      child: SureImage(widget.images[i], fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _round(
                      LucideIcons.arrowLeft,
                      'Previous image',
                      _i == 0
                          ? null
                          : () => _pages.previousPage(
                              duration: SureMotion.medium,
                              curve: Curves.easeOut,
                            ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Pinch to zoom',
                      style: SureText.caption1(FontWeight.w600)
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    _round(
                      LucideIcons.arrowRight,
                      'Next image',
                      _i >= n - 1
                          ? null
                          : () => _pages.nextPage(
                              duration: SureMotion.medium,
                              curve: Curves.easeOut,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Back, share and wishlist as 40 pt Liquid Glass discs over the photo.
class _TopButtons extends ConsumerWidget {
  const _TopButtons({this.product, this.shareUrl});

  final ProductCardDto? product;
  final String? shareUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    ref.watch(wishedProductsProvider);
    final wished =
        product != null &&
        ref.read(wishedProductsProvider.notifier).isWished(product!);

    Widget disc(IconData icon, String label, VoidCallback onTap, {Color? fg}) =>
        Semantics(
          button: true,
          label: label,
          excludeSemantics: true,
          child: PressScale(
            onTap: onTap,
            // The glass itself swells under the finger (iOS 26).
            scale: 1,
            child: SizedBox.square(
              dimension: 40,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1F000000),
                      offset: Offset(0, 1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                // Prototype: white 95% discs; Liquid Glass keeps the color.
                child: GlassSurface(
                  borderRadius: SureRadius.all(SureRadius.pill),
                  shadow: false,
                  interactive: true,
                  tint: Colors.white.withValues(alpha: 0.9),
                  solidColor: Colors.white,
                  child: Center(
                    child: Icon(
                      icon,
                      size: 20,
                      color: fg ?? SureColors.literalInk,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

    return Positioned(
      top: MediaQuery.paddingOf(context).top + 8,
      left: 16,
      right: 16,
      child: Row(
        children: [
          disc(
            LucideIcons.arrowLeft,
            'Back',
            () => Navigator.of(context).maybePop(),
          ),
          const Spacer(),
          if (product != null) ...[
            disc(LucideIcons.share2, 'Share', () async {
              await Clipboard.setData(ClipboardData(text: shareUrl ?? ''));
              if (context.mounted) {
                SureToast.show(context, 'Link copied', icon: LucideIcons.link);
              }
            }),
            const SizedBox(width: 8),
            disc(
              LucideIcons.heart,
              wished ? 'Remove from wishlist' : 'Add to wishlist',
              () async {
                try {
                  await ref
                      .read(wishedProductsProvider.notifier)
                      .toggle(product!);
                } on Object catch (e) {
                  if (context.mounted) showApiError(context, e);
                }
              },
              fg: wished ? c.critical : null,
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Panels ──────────────────────────────────────────────────────────────

class _TitlePanel extends StatelessWidget {
  const _TitlePanel({required this.product, required this.inStock});

  final ProductDetailDto product;
  final bool inStock;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final p = product;
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (p.brand != null)
            Text(
              p.brand!.toUpperCase(),
              style: SureText.caption1(SureTypography.medium)
                  .copyWith(color: c.inkFaded, letterSpacing: 0.48),
            ),
          const SizedBox(height: 4),
          Semantics(
            header: true,
            child: Text(
              p.name,
              style: SureText.featured3().copyWith(color: c.ink),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              StarRow(rating: p.rating.average, gap: 4),
              const SizedBox(width: 7),
              Text(
                p.rating.count == 0
                    ? 'No reviews yet'
                    : '${p.rating.average.toStringAsFixed(1)} '
                          '(${p.rating.count} reviews)',
                style: SureText.body3().copyWith(color: c.inkFaded),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _FadedBadge(
                icon: LucideIcons.packageCheck,
                label: inStock ? 'In Stock' : 'Out of Stock',
                bg: inStock ? c.positiveFaded : c.criticalFaded,
                fg: inStock ? c.positiveInk : c.criticalInk,
              ),
              if (inStock && p.deliveryPromise != null)
                _FadedBadge(
                  icon: LucideIcons.truck,
                  label: p.deliveryPromise!,
                  bg: c.primaryFaded,
                  fg: c.primaryInk,
                ),
            ],
          ),
          // Only when price/stock aren't live (API: freshness).
          if (p.freshness != null && !p.freshness!.isLive) ...[
            const SizedBox(height: 10),
            Text(
              p.freshness!.checkedAt == null
                  ? 'Price and stock may have changed.'
                  : 'Price and stock as of '
                        '${MyanmarTime.format(p.freshness!.checkedAt!, pattern: 'd MMM, h:mm a')}',
              style: SureText.caption1().copyWith(color: c.warningInk),
            ),
          ],
        ],
      ),
    );
  }
}

/// Design system `Badge` faded, rounded, medium, with a 12 pt icon.
class _FadedBadge extends StatelessWidget {
  const _FadedBadge({
    required this.icon,
    required this.label,
    required this.bg,
    required this.fg,
  });

  final IconData icon;
  final String label;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) => Container(
    height: 24,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: SureRadius.all(SureRadius.pill),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: fg),
        const SizedBox(width: 4),
        Text(
          label,
          style: SureText.caption1(SureTypography.medium)
              .copyWith(color: fg, height: 1),
        ),
      ],
    ),
  );
}

class _SellerRow extends StatelessWidget {
  const _SellerRow({required this.seller});

  final SellerDto seller;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return _Panel(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: PressScale(
        scale: 0.99,
        semanticLabel: 'Sold by ${seller.name}',
        onTap: () => context.push(AppRoutes.store(seller.id)),
        child: Row(
          children: [
            VendorAvatar(
              initials: seller.initials,
              color: seller.color,
              backgroundColor: seller.backgroundColor,
              size: 36,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sold by',
                    style: TextStyle(
                      fontFamily: SureTypography.fontFamily,
                      fontSize: 11,
                      color: c.inkFaded,
                    ),
                  ),
                  VerifiedName(
                    seller.name,
                    style: SureText.body3(FontWeight.w600)
                        .copyWith(color: c.ink),
                  ),
                ],
              ),
            ),
            Icon(LucideIcons.chevronRight, size: 16, color: c.inkFaded),
          ],
        ),
      ),
    );
  }
}

class _OptionsPanel extends StatelessWidget {
  const _OptionsPanel({
    required this.groups,
    required this.picks,
    required this.onPick,
  });

  final List<OptionGroupDto> groups;
  final Map<String, String> picks;
  final void Function(String key, String value) onPick;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var gi = 0; gi < groups.length; gi++) ...[
            if (gi > 0) const SizedBox(height: 24),
            Builder(
              builder: (context) {
                final g = groups[gi];
                final selected = g.options
                    .where((o) => o.value == picks[g.key])
                    .firstOrNull;
                final swatches = g.options.any((o) => o.hex != null);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          g.label,
                          style: SureText.body2(SureTypography.medium)
                              .copyWith(color: swatches ? c.ink : c.inkFaded),
                        ),
                        if (swatches && selected != null) ...[
                          const SizedBox(width: 12),
                          Text(
                            selected.label,
                            style: SureText.body2().copyWith(color: c.inkFaded),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (swatches)
                      Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        children: [
                          for (final o in g.options)
                            _ColorCircle(
                              option: o,
                              selected: o.value == picks[g.key],
                              onTap: () => onPick(g.key, o.value),
                            ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          for (var i = 0; i < g.options.length; i++) ...[
                            if (i > 0) const SizedBox(width: 8),
                            Expanded(
                              child: _VariantButton(
                                label: g.options[i].label,
                                selected: g.options[i].value == picks[g.key],
                                onTap: () => onPick(g.key, g.options[i].value),
                              ),
                            ),
                          ],
                        ],
                      ),
                  ],
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

/// Design system `ColorCircle`: 48 pt swatch; selected gets a 2 pt gap,
/// a 2 pt primary-ink ring outside the swatch and a check.
class _ColorCircle extends StatelessWidget {
  const _ColorCircle({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final SwatchDto option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final color = Color(parseApiColor(option.hex) ?? 0xFFCCCCCC);
    final dark = color.computeLuminance() < 0.4;
    return Semantics(
      button: true,
      selected: selected,
      label: '${option.label}${option.available ? '' : ', unavailable'}',
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        // 48 pt in layout; the selected ring (2 pt gap + 2 pt ring) is
        // drawn outside it, like the prototype's box-shadow.
        child: SizedBox.square(
          dimension: 48,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (selected)
                Positioned(
                  left: -4,
                  top: -4,
                  right: -4,
                  bottom: -4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: c.primaryInk, width: 2),
                    ),
                  ),
                ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: selected ? null : Border.all(color: c.border),
                  ),
                  child: selected
                      ? Icon(
                          LucideIcons.check,
                          size: 18,
                          color: dark ? Colors.white : c.primaryInk,
                        )
                      : option.available
                      ? null
                      : Icon(LucideIcons.slash, size: 18, color: c.inkFaded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Design system `VarientButton`: 48 high, radius 12, 16/500; selected is
/// neon with on-primary text, otherwise outlined.
class _VariantButton extends StatelessWidget {
  const _VariantButton({
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
      button: true,
      selected: selected,
      child: PressScale(
        onTap: onTap,
        scale: 0.97,
        child: AnimatedContainer(
          duration: SureMotion.fast,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? c.primary : c.raised,
            borderRadius: SureRadius.all(SureRadius.medium),
            border: Border.all(color: selected ? Colors.transparent : c.border),
          ),
          child: Text(
            label,
            style: SureText.body2(SureTypography.medium)
                .copyWith(color: selected ? c.onPrimary : c.ink),
          ),
        ),
      ),
    );
  }
}

class _SpecsPanel extends StatelessWidget {
  const _SpecsPanel({required this.specs});

  final List<SpecDto> specs;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final style = TextStyle(
      fontFamily: SureTypography.fontFamily,
      fontSize: 13,
    );
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionHeader(
            title: 'Specifications',
            size: SectionHeaderSize.small,
          ),
          const SizedBox(height: 6),
          for (final s in specs)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 11),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: c.borderFaded)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.label, style: style.copyWith(color: c.inkFaded)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      s.value,
                      textAlign: TextAlign.right,
                      style: style.copyWith(
                        color: c.ink,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Design system `HomeSetup`: outlined card, 40 pt house tile, title and
/// summary, chevron; opens to the perks.
class _HomeSetupCard extends StatelessWidget {
  const _HomeSetupCard({
    required this.offer,
    required this.open,
    required this.onToggle,
    required this.onSchedule,
  });

  final HomeSetupOfferDto offer;
  final VoidCallback onSchedule;
  final bool open;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: c.raised,
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(color: c.borderFaded),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            button: true,
            expanded: open,
            child: InkWell(
              onTap: onToggle,
              borderRadius: SureRadius.all(SureRadius.large),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: c.primaryFaded,
                        borderRadius: SureRadius.all(SureRadius.medium),
                      ),
                      child: Icon(
                        LucideIcons.house,
                        size: 20,
                        color: c.primaryInk,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home Setup Service',
                            style: SureText.body3(SureTypography.bold)
                                .copyWith(color: c.ink),
                          ),
                          Text(
                            offer.summary,
                            style: SureText.caption1().copyWith(
                              color: c.inkFaded,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      turns: open ? 0.5 : 0,
                      duration: const Duration(milliseconds: 180),
                      child: Icon(
                        LucideIcons.chevronDown,
                        size: 18,
                        color: c.inkFaded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (open)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final raw in offer.upcoming) ...[
                    HomeSetupVisitCard(
                      booking: HomeSetupBookingDto.fromJson(raw),
                    ),
                    const SizedBox(height: 8),
                  ],
                  for (final perk in offer.perks) ...[
                    Row(
                      children: [
                        Icon(LucideIcons.check, size: 14, color: c.primaryInk),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            perk,
                            style: TextStyle(
                              fontFamily: SureTypography.fontFamily,
                              fontSize: 13,
                              height: 18 / 13,
                              color: c.inkFaded,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                  const SizedBox(height: 4),
                  // Prototype: design system Button size small.
                  SureButton(
                    label: 'Schedule home visit',
                    size: SureButtonSize.small,
                    onPressed: onSchedule,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Reviews ─────────────────────────────────────────────────────────────

class _ReviewsPanel extends ConsumerStatefulWidget {
  const _ReviewsPanel({required this.product});

  final ProductDetailDto product;

  @override
  ConsumerState<_ReviewsPanel> createState() => _ReviewsPanelState();
}

class _ReviewsPanelState extends ConsumerState<_ReviewsPanel> {
  List<ReviewDto>? _all;
  bool _loadingAll = false;

  Future<void> _toggleAll() async {
    if (_all != null) return setState(() => _all = null);
    setState(() => _loadingAll = true);
    try {
      final page = await ref
          .read(catalogRepositoryProvider)
          .productReviews(widget.product.id);
      if (mounted) setState(() => _all = page.items);
    } on Object catch (e) {
      if (mounted) showApiError(context, e);
    } finally {
      if (mounted) setState(() => _loadingAll = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final p = widget.product;
    final reviews = _all ?? p.topReviews;
    return _Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
            title: 'Ratings and Reviews',
            description: p.rating.count == 0
                ? 'Be the first to rate this product'
                : '${p.rating.count} verified buyers rated this product',
            size: SectionHeaderSize.small,
          ),
          if (p.rating.count > 0) ...[
            const SizedBox(height: 16),
            RatingSummaryView(summary: p.rating),
          ],
          const SizedBox(height: 16),
          RateBox(
            title: 'Rate this product',
            onSubmit: (rating, text, key) async {
              await ref
                  .read(catalogRepositoryProvider)
                  .reviewProduct(p.id, rating: rating, text: text, key: key);
              ref.invalidate(productDetailProvider(p.id));
            },
          ),
          for (final r in reviews) ...[
            const SizedBox(height: 16),
            ReviewTile(review: r),
          ],
          if (p.rating.count > p.topReviews.length) ...[
            const SizedBox(height: 16),
            PressScale(
              onTap: _loadingAll ? null : _toggleAll,
              scale: 0.98,
              child: Container(
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: c.keypad,
                  borderRadius: SureRadius.all(SureRadius.pill),
                ),
                child: Text(
                  _loadingAll
                      ? 'Loading…'
                      : _all == null
                      ? 'See all ${p.rating.count} reviews'
                      : 'Show fewer reviews',
                  style: SureText.body3(FontWeight.w600).copyWith(color: c.ink),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Collapsible "Rate this …" box: tap stars, optional text, Submit. One
/// Idempotency-Key per submit, reused if that submit is retried.
///
/// [inline] is the store rating sheet's form: no outline, always open,
/// 15/750 title, 30 pt stars 6 apart, 10 pt gaps, no hint line.
class RateBox extends StatefulWidget {
  const RateBox({
    super.key,
    required this.title,
    required this.onSubmit,
    this.submitLabel = 'Submit review',
    this.thanks = 'Thanks for your review',
    this.inline = false,
  });

  final String title;
  final String submitLabel;
  final bool inline;

  /// Toast after a successful submit; null shows none (the caller swaps
  /// the box for its own confirmation).
  final String? thanks;
  final Future<void> Function(int rating, String? text, IdempotencyKey key)
  onSubmit;

  @override
  State<RateBox> createState() => _RateBoxState();
}

class _RateBoxState extends State<RateBox> {
  bool _open = true;
  int _stars = 0;
  bool _sending = false;
  IdempotencyKey? _key;
  final _text = TextEditingController();

  static const _hints = ['Poor', 'Fair', 'Good', 'Very good', 'Excellent'];

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_stars == 0 || _sending) return;
    _key ??= IdempotencyKey.generate();
    setState(() => _sending = true);
    try {
      final t = _text.text.trim();
      await widget.onSubmit(_stars, t.isEmpty ? null : t, _key!);
      if (!mounted) return;
      if (widget.thanks case final thanks?) {
        SureToast.show(
          context,
          thanks,
          icon: LucideIcons.star,
          color: SureToastColor.positive,
        );
      }
      setState(() {
        _key = null;
        _stars = 0;
        _text.clear();
        _open = false;
      });
    } on Object catch (e) {
      if (mounted) showApiError(context, e);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final inline = widget.inline;
    final open = inline || _open;
    final gap = inline ? 10.0 : 12.0;
    final border = OutlineInputBorder(
      borderRadius: SureRadius.all(SureRadius.medium),
      borderSide: BorderSide(color: c.border),
    );
    return Container(
      padding: inline ? EdgeInsets.zero : const EdgeInsets.all(16),
      decoration: inline
          ? null
          : BoxDecoration(
              borderRadius: SureRadius.all(SureRadius.large),
              border: Border.all(color: c.boxBorder),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (inline)
            Semantics(
              header: true,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontFamily: SureTypography.fontFamily,
                  fontSize: 15,
                  fontWeight: SureTypography.bold,
                  color: c.ink,
                ),
              ),
            )
          else
            Semantics(
              button: true,
              expanded: _open,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => setState(() => _open = !_open),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: SureText.body3(SureTypography.bold)
                            .copyWith(color: c.ink),
                      ),
                    ),
                    AnimatedRotation(
                      turns: _open ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        LucideIcons.chevronDown,
                        size: 18,
                        color: c.inkFaded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (open) ...[
            SizedBox(height: gap),
            Row(
              children: [
                for (var i = 1; i <= 5; i++) ...[
                  if (i > 1) SizedBox(width: inline ? 6 : 8),
                  Semantics(
                    button: true,
                    label: '$i star${i == 1 ? '' : 's'}',
                    selected: _stars == i,
                    excludeSemantics: true,
                    child: PressScale(
                      onTap: () => setState(() => _stars = i),
                      scale: 0.88,
                      child: Icon(
                        Icons.star_rounded,
                        size: inline ? 30 : 32,
                        color: i <= _stars ? StarRow.amber : c.border,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            if (!inline) ...[
              SizedBox(height: gap),
              Text(
                _stars == 0 ? 'Tap a star to rate' : _hints[_stars - 1],
                style: SureText.caption1().copyWith(color: c.inkFaded),
              ),
            ],
            SizedBox(height: gap),
            TextField(
              controller: _text,
              maxLength: 1000,
              minLines: 1,
              maxLines: 4,
              style: SureText.body3().copyWith(color: c.ink),
              decoration: InputDecoration(
                isDense: true,
                counterText: '',
                hintText: 'Share your experience (optional)',
                hintStyle: SureText.body3().copyWith(color: c.inkFaded),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                border: border,
                enabledBorder: border,
                focusedBorder: border,
              ),
            ),
            SizedBox(height: gap),
            SureButton(
              label: widget.submitLabel,
              loading: _sending,
              onPressed: _stars == 0 ? null : _submit,
            ),
          ],
        ],
      ),
    );
  }
}

/// Liquid Glass bar: Total and Add to Cart (prototype sticky footer).
class _BuyBar extends StatelessWidget {
  const _BuyBar({
    required this.total,
    required this.enabled,
    required this.loading,
    required this.onAdd,
  });

  final String total;
  final bool enabled;
  final bool loading;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return // Prototype footer: page fill (no glass), top hairline.
    ColoredBox(
      color: c.page,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: c.boxBorder)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, bottom > 0 ? bottom : 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 840),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total',
                            style: SureText.caption1(SureTypography.medium)
                                .copyWith(color: c.ink),
                          ),
                          Text(
                            total,
                            style: SureText.body2(SureTypography.medium)
                                .copyWith(color: c.ink),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 140),
                    child: SureButton(
                      label: enabled ? 'Add to Cart' : 'Sold out',
                      fullWidth: false,
                      loading: loading,
                      onPressed: enabled ? onAdd : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
