import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../glass/glass_surface.dart';
import '../glass/liquid_glass.dart';
import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';
import 'page_header.dart';

/// A screen in the prototype's layout: `PageHeader` at the top, content
/// with 20 pt sides, 60 pt bottom room.
///
/// As in the prototype there is no app bar: the page is plain and the
/// header scrolls away with the content. Only the status bar area stays,
/// as a strip of page colour ([StatusBarStrip]) so the clock remains
/// readable over scrolled content. [pinnedBelowHeader] (e.g. a search row)
/// sits under the header and scrolls with it.
///
/// iOS 26 (Liquid Glass): the status bar area, header and
/// [pinnedBelowHeader] form one pinned glass bar the content scrolls
/// under, as in Apple's own apps.
class PageScaffold extends ConsumerWidget {
  const PageScaffold({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
    this.showBack = true,
    this.actions = const [],
    this.pinnedBelowHeader,
    this.pinnedHeight = 0,
    required this.slivers,
    this.bottomBar,
    this.controller,
    this.onRefresh,
    this.maxContentWidth = 1040,
    this.headerGap = _headerRowGap,
    this.showHeader = true,
  });

  /// False when the prototype screen has no `PageHeader` (Profile starts
  /// with the member header): content starts 8 pt under the status bar.
  final bool showHeader;

  /// Space between the header and the first content: the prototype screen's
  /// column `gap` (12–20). The header row itself leaves [_headerRowGap];
  /// screens that pin a row below the header handle their own spacing.
  final double headerGap;

  static const double _headerRowGap = 4;

  final String title;
  final String? subtitle;

  /// Defaults to popping the route.
  final VoidCallback? onBack;

  /// False for tab roots (title left-aligned, no back button).
  final bool showBack;
  final List<Widget> actions;
  final Widget? pinnedBelowHeader;
  final double pinnedHeight;
  final List<Widget> slivers;

  /// Floats over the bottom (e.g. a glass "Add to Cart" bar).
  final Widget? bottomBar;
  final ScrollController? controller;
  final Future<void> Function()? onRefresh;
  final double maxContentWidth;

  static const double sidePadding = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context);
    final top = mq.padding.top;
    final liquid = liquidGlassOn(context, ref);
    final header = showHeader
        ? _HeaderBlock(
            maxWidth: maxContentWidth,
            header: PageHeader(
              title: title,
              subtitle: subtitle,
              onBack: showBack
                  ? (onBack ?? () => Navigator.of(context).maybePop())
                  : null,
              actions: actions,
            ),
            below: pinnedBelowHeader,
            belowHeight: pinnedHeight,
          )
        : null;
    Widget scroll = CustomScrollView(
      controller: controller,
      slivers: [
        if (liquid)
          PinnedHeaderSliver(
            child: GlassSurface(
              borderRadius: BorderRadius.zero,
              shadow: false,
              child: Padding(
                padding: EdgeInsets.only(top: top, bottom: 8),
                child: header ?? const SizedBox(height: 0),
              ),
            ),
          )
        else ...[
          const StatusBarStrip(),
          if (header == null)
            const SliverToBoxAdapter(child: SizedBox(height: 8))
          else
            SliverToBoxAdapter(child: header),
        ],
        if (showHeader &&
            pinnedBelowHeader == null &&
            headerGap > _headerRowGap)
          SliverToBoxAdapter(
            child: SizedBox(height: headerGap - _headerRowGap),
          ),
        for (final s in slivers)
          SliverConstrainedCrossAxis(maxExtent: maxContentWidth, sliver: s),
        SliverToBoxAdapter(
          child: SizedBox(
            height: mq.padding.bottom + (bottomBar == null ? 60 : 120),
          ),
        ),
      ],
    );
    if (onRefresh != null) {
      scroll = RefreshIndicator(
        color: context.colors.primaryInk,
        // Under the pinned glass bar on iOS 26, else under the status bar.
        edgeOffset: liquid && showHeader ? top + 64 + pinnedHeight : top,
        onRefresh: () => refreshQuietly(onRefresh!),
        child: scroll,
      );
    }
    return Scaffold(
      backgroundColor: context.colors.page,
      body: Stack(
        children: [
          Positioned.fill(child: scroll),
          if (bottomBar != null)
            Positioned(left: 0, right: 0, bottom: 0, child: bottomBar!),
        ],
      ),
    );
  }
}

/// The header row (8 pt above a 56 pt row holding the 48 pt `PageHeader`)
/// and an optional row under it. Scrolls with the page.
class _HeaderBlock extends StatelessWidget {
  const _HeaderBlock({
    required this.header,
    required this.maxWidth,
    this.below,
    this.belowHeight = 0,
  });

  final Widget header;
  final Widget? below;
  final double belowHeight;
  final double maxWidth;

  static const double _headerRow = 64;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PageScaffold.sidePadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 56 pt at normal size; taller with large text, so the
              // title and subtitle never run into the row below.
              Container(
                constraints: const BoxConstraints(minHeight: _headerRow - 8),
                alignment: Alignment.center,
                child: header,
              ),
              // At least [belowHeight]; taller when its content needs it
              // (a glass tab capsule, large text).
              if (below != null)
                Container(
                  constraints: BoxConstraints(minHeight: belowHeight),
                  alignment: Alignment.center,
                  child: below,
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

/// Keeps the status bar area covered in the page colour while content
/// scrolls under it (the prototype's status bar sits on the plain page).
/// Put it first in a [CustomScrollView].
class StatusBarStrip extends StatelessWidget {
  const StatusBarStrip({super.key, this.color});

  /// Defaults to the page colour.
  final Color? color;

  @override
  Widget build(BuildContext context) => SliverPersistentHeader(
    pinned: true,
    delegate: _StripDelegate(
      height: MediaQuery.paddingOf(context).top,
      color: color ?? context.colors.page,
      // iOS 26: glass, like the system's status bar over scrolled content.
      glass: color == null,
    ),
  );
}

class _StripDelegate extends SliverPersistentHeaderDelegate {
  _StripDelegate({
    required this.height,
    required this.color,
    this.glass = false,
  });

  final double height;
  final Color color;
  final bool glass;

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlaps) {
    // Must fill the extent: an unsized box would paint 0 of it.
    final solid = SizedBox.expand(child: ColoredBox(color: color));
    if (!glass) return solid;
    return LiquidGlassSwitch(
      liquid: (_) => const SizedBox.expand(
        child: GlassSurface(
          borderRadius: BorderRadius.zero,
          shadow: false,
          child: SizedBox.expand(),
        ),
      ),
      otherwise: (_) => solid,
    );
  }

  @override
  bool shouldRebuild(_StripDelegate old) =>
      old.height != height || old.color != color || old.glass != glass;
}

/// Design system `EmptyState`: 40 pt disabled-color icon, body-1 bold title,
/// body-3 description (max 260), optional action.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.action,
  });

  final IconData icon;
  final String title;
  final String? description;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: c.disabledInk),
          const SizedBox(height: SureSpace.x2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: SureText.body1(SureTypography.bold).copyWith(color: c.ink),
          ),
          if (description != null) ...[
            const SizedBox(height: SureSpace.x2),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 260),
              child: Text(
                description!,
                textAlign: TextAlign.center,
                style: SureText.body3().copyWith(color: c.inkFaded),
              ),
            ),
          ],
          if (action != null) ...[const SizedBox(height: 16), action!],
        ],
      ),
    );
  }
}

/// Runs a pull-to-refresh. A failed reload (offline, server error) is shown
/// by the page's own error state, so it must not also escape as an
/// unhandled error from the [RefreshIndicator].
Future<void> refreshQuietly(Future<void> Function() refresh) async {
  try {
    await refresh();
  } on Object {
    // The provider now holds the error; the page renders it.
  }
}
