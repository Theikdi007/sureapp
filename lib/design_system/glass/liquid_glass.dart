import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'glass_surface.dart';
import 'glass_tier.dart';

/// True where the app draws iOS 26 Liquid Glass: the liquid tier (iOS 26+,
/// transparency allowed, not dropping frames) and no high-contrast request.
bool liquidGlassOn(BuildContext context, WidgetRef ref) {
  if (MediaQuery.highContrastOf(context)) return false;
  final tier =
      GlassTierOverride.maybeOf(context) ?? ref.watch(glassTierProvider);
  return tier == GlassTier.liquid;
}

/// Builds [liquid] where Liquid Glass is on and [otherwise] everywhere else.
///
/// On iOS 26+ every control layer (headers, bottom bars, tabs, toasts,
/// dialogs) is glass, as in Apple's own apps. Android, older iOS and
/// Reduce Transparency keep the prototype's solid look, so [otherwise] is
/// the element as it was before.
class LiquidGlassSwitch extends ConsumerWidget {
  const LiquidGlassSwitch({
    super.key,
    required this.liquid,
    required this.otherwise,
  });

  final WidgetBuilder liquid;
  final WidgetBuilder otherwise;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      liquidGlassOn(context, ref) ? liquid(context) : otherwise(context);
}
