import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../adaptive/adaptive_shell.dart';
import '../glass/glass_surface.dart';
import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

/// The prototype's floating tab bar: a 60 pt glass pill holding the tabs,
/// and a separate 62 pt glass circle with Search. In the prototype both
/// glass shapes overhang their 53/54 pt layout boxes by 4 pt, so the shell
/// places this 4 pt further out and the gap between them is 8 pt.
///
/// Tab cell: 50 pt high, 24 pt icon over a 10/12 medium label; the
/// selected tab sits on a `neon-faded` capsule in `primary-ink`.
class GlassNavBar extends StatelessWidget {
  const GlassNavBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onSelect,
    this.onSearch,
    this.badges = const {},
  });

  final List<ShellDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final VoidCallback? onSearch;
  final Map<int, int> badges;

  /// Total height, for content insets.
  static const double height = 62;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    // Labels grow with the user's text size, capped so five tabs still fit.
    return MediaQuery.withClampedTextScaling(
      maxScaleFactor: 1.3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GlassSurface(
              borderRadius: SureRadius.all(SureRadius.pill),
              padding: const EdgeInsets.fromLTRB(6, 4, 6, 6),
              shadow: true,
              child: Material(
                type: MaterialType.transparency,
                child: Row(
                  children: [
                    for (var i = 0; i < destinations.length; i++)
                      Expanded(
                        child: _Cell(
                          destination: destinations[i],
                          selected: i == selectedIndex,
                          badge: badges[i] ?? 0,
                          onTap: () => onSelect(i),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (onSearch != null) ...[
            const SizedBox(width: SureSpace.x2),
            // Prototype: the search bubble is a touch lighter (opacity 0.9).
            // Done with the tint: an Opacity layer would cut the glass off
            // from the content it blurs.
            GlassSurface(
              tint: c.glassTint.withValues(alpha: c.glassTint.a * 0.9),
              interactive: true,
              borderRadius: SureRadius.all(SureRadius.pill),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onSearch,
                  child: SizedBox.square(
                    dimension: height,
                    child: Semantics(
                      button: true,
                      label: 'Search',
                      excludeSemantics: true,
                      child: Icon(
                        LucideIcons.search,
                        size: 24,
                        color: c.navInk,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Cell extends StatefulWidget {
  const _Cell({
    required this.destination,
    required this.selected,
    required this.badge,
    required this.onTap,
  });

  final ShellDestination destination;
  final bool selected;
  final int badge;
  final VoidCallback onTap;

  @override
  State<_Cell> createState() => _CellState();
}

class _CellState extends State<_Cell> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final fg = widget.selected ? c.primaryInk : c.navInk;
    final d = widget.destination;
    return Semantics(
      selected: widget.selected,
      button: true,
      label: widget.badge > 0 ? '${d.label}, ${widget.badge} unread' : d.label,
      excludeSemantics: true,
      child: AnimatedScale(
        scale: _down ? 0.95 : 1,
        duration: const Duration(milliseconds: 60),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onTap,
          onTapDown: (_) => setState(() => _down = true),
          onTapUp: (_) => setState(() => _down = false),
          onTapCancel: () => setState(() => _down = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            constraints: const BoxConstraints(minHeight: 50),
            padding: const EdgeInsets.fromLTRB(2, 6, 2, 7),
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: widget.selected
                  ? c.primaryFaded
                  : c.primaryFaded.withValues(alpha: 0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountBadge(
                  count: widget.badge,
                  child: Icon(
                    widget.selected ? d.selectedIcon : d.icon,
                    size: 24,
                    color: fg,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  d.label,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: SureText.caption2().copyWith(color: fg),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Red count badge on an icon. Hidden at 0, "99+" above 99.
class CountBadge extends StatelessWidget {
  const CountBadge({super.key, required this.count, required this.child});

  final int count;
  final Widget child;

  @override
  Widget build(BuildContext context) => Badge(
    isLabelVisible: count > 0,
    label: Text(count > 99 ? '99+' : '$count'),
    child: child,
  );
}
