import 'package:flutter/material.dart';

import '../glass/glass_surface.dart';
import '../glass/liquid_glass.dart';
import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';

/// The surface of a sticky footer (Add to Cart, Place Order, Checkout,
/// Claim): 20/14 padding plus the home-indicator inset.
///
/// iOS 26: a Liquid Glass bar the content scrolls under. Elsewhere: the
/// prototype footer, page fill with a top hairline.
class BottomBarSurface extends StatelessWidget {
  const BottomBarSurface({
    super.key,
    required this.child,
    required this.hairline,
    this.padding = const EdgeInsets.fromLTRB(20, 14, 20, 14),
  });

  final Widget child;

  /// Top hairline colour of the solid footer.
  final Color hairline;

  /// Before the home-indicator inset, which is added to the bottom.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final inner = Padding(
      padding: padding.copyWith(
        bottom: padding.bottom + MediaQuery.paddingOf(context).bottom,
      ),
      child: child,
    );
    return LiquidGlassSwitch(
      liquid: (_) => GlassSurface(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(SureRadius.xl),
        ),
        child: inner,
      ),
      otherwise: (context) => ColoredBox(
        color: context.colors.page,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: hairline)),
          ),
          child: inner,
        ),
      ),
    );
  }
}
