import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_colors.dart';
import '../tokens/sure_metrics.dart';
import 'glass_tier.dart';

/// Forces every [GlassSurface] below it to one tier (previews, QA, tests).
class GlassTierOverride extends InheritedWidget {
  const GlassTierOverride({
    super.key,
    required this.tier,
    required super.child,
  });

  /// Null = use the device tier.
  final GlassTier? tier;

  static GlassTier? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GlassTierOverride>()?.tier;

  @override
  bool updateShouldNotify(GlassTierOverride old) => old.tier != tier;
}

/// The only way to draw glass in the app (nav bars, sheets, floating
/// buttons, overlays). Picks its tier from [glassTierProvider].
class GlassSurface extends ConsumerWidget {
  const GlassSurface({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(SureRadius.xl)),
    this.padding,
    this.shadow = true,
    this.tier,
    this.tint,
    this.solidColor,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool shadow;

  /// Forces a tier (previews, tests). Normally null.
  final GlassTier? tier;

  /// Overrides the `glassTint` token, e.g. white 20% over a dark gradient.
  /// The solid tier then uses it at full opacity.
  final Color? tint;

  /// Fill for the solid tier (Reduce Transparency, low power). Defaults to
  /// the opaque tint or `raised`.
  final Color? solidColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    var t =
        tier ??
        GlassTierOverride.maybeOf(context) ??
        ref.watch(glassTierProvider);
    if (MediaQuery.highContrastOf(context)) t = GlassTier.solid;

    Widget content = padding == null
        ? child
        : Padding(padding: padding!, child: child);

    final shadows = shadow ? SureShadow.glass(c.shadow) : null;

    if (t == GlassTier.solid) {
      return DecoratedBox(
        decoration: BoxDecoration(
          // Without blur the tint is shown opaque (over the page color) so
          // text keeps its contrast; [solidColor] overrides, e.g. on a
          // dark gradient.
          color:
              solidColor ??
              (this.tint == null
                  ? c.raised
                  : Color.alphaBlend(this.tint!.withValues(alpha: 1), c.page)),
          borderRadius: borderRadius,
          border: Border.all(color: c.border),
          boxShadow: shadows,
        ),
        child: ClipRRect(borderRadius: borderRadius, child: content),
      );
    }

    final liquid = t == GlassTier.liquid;
    // Frosted has no saturation boost, so it gets a denser tint to keep text
    // contrast at the same level.
    final base = this.tint ?? c.glassTint;
    final tint = liquid
        ? base
        : base.withValues(alpha: (base.a + 0.15).clamp(0, 1));

    content = BackdropFilter(
      filter: liquid ? _liquidFilter : _frostedFilter,
      child: DecoratedBox(
        decoration: BoxDecoration(color: tint, borderRadius: borderRadius),
        position: DecorationPosition.background,
        child: liquid
            // Behind the content: the sheen must not wash out the colors of
            // buttons and text sitting on the glass.
            ? CustomPaint(
                painter: _SpecularRimPainter(radius: borderRadius, colors: c),
                child: content,
              )
            : DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: Border.all(color: c.borderFaded),
                ),
                child: content,
              ),
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: borderRadius, boxShadow: shadows),
      child: RepaintBoundary(
        child: ClipRRect(borderRadius: borderRadius, child: content),
      ),
    );
  }

  static final ui.ImageFilter _frostedFilter = ui.ImageFilter.blur(
    sigmaX: 12,
    sigmaY: 12,
    tileMode: TileMode.mirror,
  );

  static final ui.ImageFilter _liquidFilter = ui.ImageFilter.compose(
    outer: const ColorFilter.matrix(_saturate18),
    inner: ui.ImageFilter.blur(
      sigmaX: 20,
      sigmaY: 20,
      tileMode: TileMode.mirror,
    ),
  );

  /// Saturation 1.8 (the prototype's `saturate(1.8)`), Rec. 709 luma weights.
  static const List<double> _saturate18 = [
    1.6299, -0.5722, -0.0578, 0, 0, //
    -0.1701, 1.2278, -0.0578, 0, 0, //
    -0.1701, -0.5722, 1.7422, 0, 0, //
    0, 0, 0, 1, 0,
  ];
}

/// Light catching the top-left edge and a soft sheen across the top, the
/// cues that make glass read as a lens rather than a blur.
class _SpecularRimPainter extends CustomPainter {
  _SpecularRimPainter({required this.radius, required this.colors});

  final BorderRadius radius;
  final SureColors colors;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = radius.toRRect(rect).deflate(0.5);
    final rim = colors.glassRim;

    canvas.drawRRect(
      rrect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            rim,
            rim.withValues(alpha: 0),
            rim.withValues(alpha: rim.a * 0.5),
          ],
          stops: const [0, 0.5, 1],
        ).createShader(rect),
    );

    canvas.save();
    canvas.clipRRect(rrect);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height * 0.5),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            rim.withValues(alpha: rim.a * 0.25),
            rim.withValues(alpha: 0),
          ],
        ).createShader(rect),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_SpecularRimPainter old) =>
      old.radius != radius || old.colors != colors;
}
