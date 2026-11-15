import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/adaptive/window_class.dart';
import '../../../design_system/components/flash_timer.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_image.dart';
import '../../../design_system/glass/glass_surface.dart';
import '../../../design_system/components/page_scaffold.dart'
    show StatusBarStrip;
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_colors.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../catalog/data/catalog_dtos.dart';
import '../../catalog/presentation/shop_state.dart';
import '../../loyalty/data/loyalty_repository.dart';
import '../data/home_dtos.dart';
import '../../catalog/presentation/widgets/catalog_widgets.dart';
import 'home_providers.dart';
import '../../cart/presentation/location_sheet.dart';

/// Home tab (prototype `HomeScreen`): deliver-to header with wishlist and
/// bell, hero carousel, tier card, Rewards banner, What's New, Flash Deals,
/// Shop by Store, Shop by Brand, For You.
///
/// Calls `GET home`, `GET notifications/unread-count`, `GET products/feed`
/// and, for the tier card's points, `GET loyalty/summary`.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _onScroll(ScrollNotification n) {
    if (n.metrics.axis == Axis.vertical && n.metrics.extentAfter < 400) {
      ref.read(forYouFeedProvider.notifier).loadMore();
    }
    return false;
  }

  Future<void> _refresh() async {
    ref.invalidate(homeDataProvider);
    ref.invalidate(loyaltySummaryProvider);
    await ref.read(homeDataProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    final home = ref.watch(homeDataProvider);
    final c = context.colors;

    final Widget body = switch (home) {
      AsyncData(:final value) => _HomeContent(home: value),
      AsyncError(:final error) when !home.isLoading => _HomeError(
        error: error,
        onRetry: () => ref.invalidate(homeDataProvider),
      ),
      _ => const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: _Loader()),
      ),
    };

    return Scaffold(
      backgroundColor: c.page,
      body: NotificationListener<ScrollNotification>(
        onNotification: _onScroll,
        child: RefreshIndicator(
          color: c.primaryInk,
          edgeOffset: MediaQuery.paddingOf(context).top,
          onRefresh: _refresh,
          child: CustomScrollView(
            key: const PageStorageKey('home'),
            slivers: [
              const StatusBarStrip(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: _HomeHeaderRow.height,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: _maxHomeWidth,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        // The member's pick, else the API's default.
                        child: _HomeHeader(
                          deliverTo:
                              ref.watch(deliveryAddressProvider) ??
                              home.value?.deliverTo,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              body,
            ],
          ),
        ),
      ),
    );
  }
}

/// Max width of home content on tablets/desktop so rows stay readable.
const double _maxHomeWidth = 1040;

/// The deliver-to row's height. As in the prototype it scrolls away with
/// the page; only the status bar strip stays.
abstract final class _HomeHeaderRow {
  static const double height = 56;
}

class _HomeHeader extends ConsumerWidget {
  const _HomeHeader({required this.deliverTo});

  final AddressDto? deliverTo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final counts = ref.watch(shopCountsProvider);
    return Row(
      children: [
        Expanded(
          child: Semantics(
            button: true,
            label: 'Deliver to ${deliverTo?.shortLabel ?? 'choose an address'}',
            excludeSemantics: true,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                final picked = await showLocationSheet(
                  context,
                  selectedId: deliverTo?.id,
                );
                if (picked != null) {
                  ref.read(deliveryAddressProvider.notifier).choose(picked);
                }
              },
              child: Row(
                children: [
                  Icon(LucideIcons.mapPinHouse, size: 20, color: c.ink),
                  const SizedBox(width: SureSpace.x2),
                  Flexible(
                    child: Text(
                      deliverTo?.shortLabel ?? 'Add an address',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: SureText.body1(SureTypography.bold)
                          .copyWith(color: c.ink),
                    ),
                  ),
                  const SizedBox(width: SureSpace.x2),
                  Icon(LucideIcons.chevronDown, size: 18, color: c.inkFaded),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: SureSpace.x3),
        _CountIconButton(
          icon: LucideIcons.heart,
          label: 'Wishlist',
          count: counts.wishlist,
          onTap: () => context.push(AppRoutes.wishlist),
        ),
        const SizedBox(width: 2),
        _CountIconButton(
          icon: LucideIcons.bell,
          label: 'Notifications',
          count: counts.unreadNotifications,
          onTap: () => context.push(AppRoutes.notifications),
        ),
      ],
    );
  }
}

/// 40 pt round icon button with the prototype's red count dot (15 pt,
/// 10/750, top 5 right 6).
class _CountIconButton extends StatelessWidget {
  const _CountIconButton({
    required this.icon,
    required this.label,
    required this.count,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: true,
      label: count > 0 ? '$label, $count' : label,
      excludeSemantics: true,
      child: PressScale(
        onTap: onTap,
        scale: 0.94,
        child: SizedBox.square(
          dimension: 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(icon, size: 22, color: c.ink),
              if (count > 0)
                Positioned(
                  top: 5,
                  right: 6,
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 15),
                    height: 15,
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: c.badge,
                      borderRadius: SureRadius.all(SureRadius.pill),
                    ),
                    child: Text(
                      count > 99 ? '99+' : '$count',
                      style: TextStyle(
                        fontFamily: SureTypography.fontFamily,
                        fontSize: 10,
                        height: 1,
                        fontWeight: SureTypography.bold,
                        color: c.onBadge,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeContent extends ConsumerWidget {
  const _HomeContent({required this.home});

  final HomeDto home;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    // (section, padded). Unpadded sections bleed to the edges: the tier
    // card and the horizontal rails (which pad their own headers).
    final sections = <(Widget, bool)>[
      if (home.hero.isNotEmpty) (_HeroCarousel(banners: home.hero), true),
      (const _TierCard(), false),
      (const _RewardsBanner(), true),
      if (home.whatsNew.isNotEmpty) (_WhatsNew(banners: home.whatsNew), true),
      if (home.flashDeals.items.isNotEmpty)
        (_FlashDeals(deals: home.flashDeals), false),
      if (home.vendors.isNotEmpty) (_Stores(vendors: home.vendors), false),
      if (home.brands.isNotEmpty) (_Brands(brands: home.brands), true),
      (const _ForYou(), true),
    ];
    // Prototype gaps: 24 between sections, Rewards banner tucked 8 closer
    // to the tier card, What's New 4 closer to the banner.
    double gapBefore(Widget w) => switch (w) {
      _RewardsBanner() => 16,
      _WhatsNew() => 20,
      _ => 24,
    };
    return SliverToBoxAdapter(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxHomeWidth),
          child: Padding(
            // 8 under the 56 pt header row's 40 pt buttons + 16 = the
            // prototype's 24 gap.
            padding: EdgeInsets.only(top: 16, bottom: bottom + 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < sections.length; i++) ...[
                  if (i > 0) SizedBox(height: gapBefore(sections[i].$1)),
                  if (sections[i].$2)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: _side),
                      child: sections[i].$1,
                    )
                  else
                    sections[i].$1,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Home's side padding (prototype 20).
const double _side = 20;

class _HomeError extends StatelessWidget {
  const _HomeError({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => SliverFillRemaining(
    hasScrollBody: false,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(SureSpace.x6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.wifiOff, size: 32, color: context.colors.inkFaded),
            const SizedBox(height: SureSpace.x3),
            Text(
              error is ApiException
                  ? (error as ApiException).userMessage
                  : 'Something went wrong. Try again.',
              textAlign: TextAlign.center,
              style: SureText.body2().copyWith(color: context.colors.ink),
            ),
            const SizedBox(height: SureSpace.x5),
            SureButton(
              label: 'Try again',
              fullWidth: false,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    ),
  );
}

/// Design system `Loader` (medium, 20 pt, primary).
class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: 20,
    child: CircularProgressIndicator(
      strokeWidth: 2.5,
      color: context.colors.primaryInk,
      backgroundColor: context.colors.primaryInk.withValues(alpha: 0.22),
    ),
  );
}

// ─── Hero ────────────────────────────────────────────────────────────────

/// 16:9, radius 24, auto-advances every 4.5 s; dots 28/10 × 10 (neon /
/// rgb(225,229,235)), 12 pt under the image.
class _HeroCarousel extends StatefulWidget {
  const _HeroCarousel({required this.banners});

  final List<BannerDto> banners;

  @override
  State<_HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<_HeroCarousel> {
  final _pages = PageController();
  Timer? _auto;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _auto = Timer.periodic(const Duration(milliseconds: 4500), (_) {
      if (!mounted || widget.banners.length < 2 || !_pages.hasClients) return;
      if (MediaQuery.disableAnimationsOf(context)) return;
      _pages.animateToPage(
        (_index + 1) % widget.banners.length,
        duration: SureMotion.slow,
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _auto?.cancel();
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: SureRadius.all(SureRadius.xl),
            child: ColoredBox(
              color: c.pageFaded,
              child: PageView.builder(
                controller: _pages,
                itemCount: widget.banners.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) {
                  final b = widget.banners[i];
                  return PressScale(
                    scale: 1,
                    semanticLabel: b.title ?? 'Banner ${i + 1}',
                    onTap: () => openLink(context, b.link),
                    child: SureImage(b.imageUrl),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: SureSpace.x3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.banners.length; i++) ...[
              if (i > 0) const SizedBox(width: SureSpace.x1),
              GestureDetector(
                onTap: () => _pages.animateToPage(
                  i,
                  duration: SureMotion.slow,
                  curve: Curves.easeOutCubic,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  width: i == _index ? 28 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: i == _index ? SureBrand.neon : c.dotInactive,
                    borderRadius: SureRadius.all(SureRadius.pill),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

// ─── Tier card ───────────────────────────────────────────────────────────

/// Member card: tier gradient (full bleed, radius 28) around a white card
/// (radius 24) with "Tier Level", the tier name, points and the tier coin.
/// VSP and above get a Liquid Glass inner card with white text.
class _TierCard extends ConsumerWidget {
  const _TierCard();

  static const _gradients = [
    [Color(0xFFE6EDF3), Color(0xFFD8E1EE)], // classic
    [Color(0xFFEFE5FF), Color(0xFF816EA2)], // exclusive
    [Color(0xFFE2B254), Color(0xFF8A5C14)], // vsp
    [Color(0xFF707885), Color(0xFF1E2229)], // vvsp
    [Color(0xFF14372D), Color(0xFF001400)], // xsp
  ];
  static const _tierInk = [Color(0xFF9333EA), Color(0xFFBA5820)];
  static const _coins = ['classic', 'exclusive', 'vsp', 'vvsp', 'xsp'];

  static int _index(String tier) => switch (tier.toLowerCase()) {
    'exclusive' => 1,
    'vsp' => 2,
    'vvsp' => 3,
    'xsp' => 4,
    _ => 0, // newbie, classic
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final summary = ref.watch(loyaltySummaryProvider).value;
    final session = ref.watch(sessionProvider).value;
    final member = session is SignedIn ? session.member : null;
    final tier = summary?.tier ?? member?.tier ?? 'classic';
    final tierLabel = summary?.tierLabel ?? member?.tierLabel ?? 'Classic';
    final idx = _index(tier);
    final dark = idx >= 2;
    final ink = dark ? Colors.white : c.ink;
    final sub = dark ? Colors.white.withValues(alpha: 0.8) : c.inkFaded;
    final titleInk = dark ? Colors.white : _tierInk[idx];

    final inner = Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tier Level',
                  style: SureText.caption1(SureTypography.medium)
                      .copyWith(color: sub),
                ),
                Text(
                  '$tierLabel Member',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: SureText.featured3().copyWith(color: titleInk),
                ),
              ],
            ),
          ),
          const SizedBox(width: SureSpace.x3),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  summary == null
                      ? '—'
                      : NumberFormat('#,##0').format(summary.points),
                  style: SureText.body1(SureTypography.bold)
                      .copyWith(color: ink),
                ),
                Text(
                  'Points',
                  style: SureText.caption1(SureTypography.medium)
                      .copyWith(color: sub),
                ),
              ],
            ),
          ),
          const SizedBox(width: SureSpace.x2),
          SvgPicture.asset(
            'assets/images/tiers/${_coins[idx]}.svg',
            width: 44,
            height: 44,
            excludeFromSemantics: true,
          ),
        ],
      ),
    );

    return Semantics(
      button: true,
      label:
          '$tierLabel Member, '
          '${summary == null ? '' : '${summary.points} points'}',
      excludeSemantics: true,
      child: PressScale(
        scale: 0.985,
        onTap: () => context.go(AppRoutes.profile),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: SureRadius.all(SureRadius.xl2),
            gradient: LinearGradient(
              begin: const Alignment(-0.892, -0.453),
              end: const Alignment(0.892, 0.453),
              colors: _gradients[idx],
              stops: const [0.1216, 0.7358],
            ),
          ),
          child: dark
              ? GlassSurface(
                  borderRadius: SureRadius.all(SureRadius.xl),
                  tint: Colors.white.withValues(alpha: 0.2),
                  solidColor: Colors.black.withValues(alpha: 0.25),
                  child: inner,
                )
              : DecoratedBox(
                  decoration: BoxDecoration(
                    color: c.raised,
                    borderRadius: SureRadius.all(SureRadius.xl),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0D000000),
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Color(0x12000000),
                        offset: Offset(0, 15),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                  child: inner,
                ),
        ),
      ),
    );
  }
}

class _RewardsBanner extends StatelessWidget {
  const _RewardsBanner();

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PressScale(
      scale: 0.985,
      semanticLabel: 'Rewards. Turn points into coupons, gear and services',
      onTap: () => context.go(AppRoutes.rewards),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: c.primaryFaded,
          borderRadius: SureRadius.all(SureRadius.larger),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: c.raised,
                borderRadius: SureRadius.all(SureRadius.medium),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0F000000),
                    offset: Offset(0, 1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Icon(LucideIcons.gift, size: 20, color: c.primaryInk),
            ),
            const SizedBox(width: SureSpace.x3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rewards',
                    style: TextStyle(
                      fontFamily: SureTypography.fontFamily,
                      fontSize: 15,
                      fontWeight: SureTypography.bold,
                      color: c.ink,
                    ),
                  ),
                  Text(
                    'Turn points into coupons, gear and services',
                    style: SureText.caption1().copyWith(color: c.inkFaded),
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

class _WhatsNew extends StatelessWidget {
  const _WhatsNew({required this.banners});

  final List<BannerDto> banners;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final tiles = banners.take(3).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionHeader(
          title: "What's New",
          description: "Don't miss the new products",
        ),
        const SizedBox(height: SureSpace.x6),
        SizedBox(
          height: 156,
          child: Row(
            children: [
              for (var i = 0; i < tiles.length; i++) ...[
                if (i > 0) const SizedBox(width: 6),
                Expanded(
                  child: PressScale(
                    semanticLabel: tiles[i].title ?? "What's new ${i + 1}",
                    onTap: () => openLink(context, tiles[i].link),
                    child: ClipRRect(
                      borderRadius: SureRadius.all(SureRadius.large),
                      child: ColoredBox(
                        color: c.pageFaded,
                        child: SureImage(tiles[i].imageUrl),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Product rows ────────────────────────────────────────────────────────

class _FlashDeals extends StatelessWidget {
  const _FlashDeals({required this.deals});

  final FlashDealsDto deals;

  @override
  Widget build(BuildContext context) {
    final ends = deals.endsAt == null ? null : DateTime.tryParse(deals.endsAt!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Padded(
          SectionHeader(
            title: 'Flash Deals',
            icon: LucideIcons.zap,
            action: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (ends != null) FlashTimer(endsAt: ends),
                const SizedBox(width: 10),
                SureLink(
                  'See All',
                  onTap: () =>
                      context.push(AppRoutes.browse(category: 'on_sale')),
                ),
              ],
            ),
          ),
        ),
        _HorizontalRail(
          gap: 14,
          children: [
            for (final p in deals.items)
              SizedBox(width: 150, child: ProductCardTile(product: p)),
          ],
        ),
      ],
    );
  }
}

/// Full-bleed horizontal row (prototype: padding 14 20 4, edge to edge).
class _HorizontalRail extends StatelessWidget {
  const _HorizontalRail({required this.children, required this.gap});

  final List<Widget> children;
  final double gap;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.fromLTRB(_side, 14, _side, 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) SizedBox(width: gap),
          children[i],
        ],
      ],
    ),
  );
}

class _Stores extends StatelessWidget {
  const _Stores({required this.vendors});

  final List<VendorDto> vendors;

  static String _count(int n) =>
      n >= 1000 ? '${(n / 1000).toStringAsFixed(n >= 10000 ? 0 : 1)}k' : '$n';

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Padded(
          SectionHeader(
            title: 'Shop by Store',
            description: 'Multi-vendor official stores',
            action: SureLink(
              'See All',
              onTap: () => context.push(AppRoutes.stores),
            ),
          ),
        ),
        _HorizontalRail(
          gap: 12,
          children: [
            for (final v in vendors)
              PressScale(
                semanticLabel: '${v.name}, ${v.tagline}',
                onTap: () => context.push(AppRoutes.store(v.id)),
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: SureRadius.all(SureRadius.large),
                    border: Border.all(color: c.boxBorderFaded),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(
                                parseApiColor(v.backgroundColor) ?? 0xFF14161B,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              v.initials,
                              style: TextStyle(
                                fontFamily: SureTypography.fontFamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(
                                  parseApiColor(v.color) ?? 0xFFFFFFFF,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        v.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: SureText.body3(
                                          SureTypography.bold,
                                        ).copyWith(color: c.ink),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      LucideIcons.badgeCheck,
                                      size: 15,
                                      color: SureBrand.electric,
                                    ),
                                  ],
                                ),
                                Text(
                                  '${v.rating} ★ · ${_count(v.productCount)} products',
                                  style: TextStyle(
                                    fontFamily: SureTypography.fontFamily,
                                    fontSize: 11,
                                    color: c.inkFaded,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        v.tagline,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: SureText.caption1().copyWith(
                          color: c.inkFaded,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _Brands extends StatelessWidget {
  const _Brands({required this.brands});

  final List<BrandDto> brands;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final cols = switch (WindowClass.of(context)) {
      WindowClass.compact => 3,
      WindowClass.medium => 5,
      WindowClass.expanded => 6,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: 'Shop by Brand',
          description: 'Official partner stores',
          action: SureLink(
            'See All',
            onTap: () => context.push(AppRoutes.brands),
          ),
        ),
        const SizedBox(height: 14),
        _Grid(
          columns: cols,
          rowGap: 12,
          colGap: 12,
          children: [
            for (final b in brands)
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
                            fallback: _BrandInitial(brand: b),
                          ),
                        ),
                      ),
                      const SizedBox(height: SureSpace.x2),
                      Text(
                        b.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: SureText.caption1(SureTypography.medium)
                            .copyWith(color: c.ink),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _BrandInitial extends StatelessWidget {
  const _BrandInitial({required this.brand});

  final BrandDto brand;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: Color(parseApiColor(brand.backgroundColor) ?? 0xFFF5F5F7),
    child: Center(
      child: Text(
        brand.initial.isEmpty ? brand.name.substring(0, 1) : brand.initial,
        style: SureText.featured3().copyWith(
          color: Color(parseApiColor(brand.color) ?? 0xFF14161B),
        ),
      ),
    ),
  );
}

class _ForYou extends ConsumerWidget {
  const _ForYou();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final feed = ref.watch(forYouFeedProvider);
    final cols = switch (WindowClass.of(context)) {
      WindowClass.compact => 2,
      WindowClass.medium => 3,
      WindowClass.expanded => 4,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: 'For You',
          description: 'The best picks tailored for you',
          action: SureLink(
            'See All',
            onTap: () => context.push(AppRoutes.products),
          ),
        ),
        const SizedBox(height: 14),
        _Grid(
          columns: cols,
          rowGap: 20,
          colGap: 14,
          children: [
            for (var i = 0; i < feed.items.length; i++)
              KeyedSubtree(
                key: ValueKey('fy$i'),
                child: ProductCardTile(product: feed.items[i]),
              ),
          ],
        ),
        if (feed.loading)
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 18, 0, 4),
            child: Center(child: _Loader()),
          )
        else if (feed.error != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 18, 0, 4),
            child: Center(
              child: SureLink(
                'Couldn\'t load more. Tap to retry',
                onTap: () => ref.read(forYouFeedProvider.notifier).loadMore(),
              ),
            ),
          )
        else if (feed.done)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 18, 0, 4),
            child: Center(
              child: Text(
                "You're all caught up",
                style: SureText.caption1().copyWith(color: c.inkFaded),
              ),
            ),
          ),
      ],
    );
  }
}

class _Padded extends StatelessWidget {
  const _Padded(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: _side),
    child: child,
  );
}

/// Rows of [columns] equal-width cells, top-aligned.
class _Grid extends StatelessWidget {
  const _Grid({
    required this.columns,
    required this.rowGap,
    required this.colGap,
    required this.children,
  });

  final int columns;
  final double rowGap;
  final double colGap;
  final List<Widget> children;

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
