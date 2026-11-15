import 'package:flutter/material.dart';

import '../components/glass_nav_bar.dart';
import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import 'fold_info.dart';
import 'two_pane.dart';
import 'window_class.dart';

class ShellDestination {
  const ShellDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

/// Top-level tab layout.
///
/// * compact: floating glass bottom bar over the body.
/// * medium/expanded: navigation rail (extended labels on expanded).
/// * tabletop posture: body above the hinge, bar below it.
///
/// [body] (the router's navigator shell) is kept under a [GlobalKey], so tab
/// stacks, scroll positions and form input survive fold/unfold and rotation.
class AdaptiveShell extends StatefulWidget {
  const AdaptiveShell({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onSelect,
    required this.body,
    this.onSearch,
    this.badges = const {},
  });

  final List<ShellDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final Widget body;

  /// The round Search button next to the bar (compact) / top of the rail.
  final VoidCallback? onSearch;

  /// Destination index → unread count (0 hides the badge).
  final Map<int, int> badges;

  @override
  State<AdaptiveShell> createState() => _AdaptiveShellState();
}

class _AdaptiveShellState extends State<AdaptiveShell> {
  final _bodyKey = GlobalKey(debugLabel: 'AdaptiveShell.body');

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final mq = MediaQuery.of(context);
    final windowClass = WindowClass.fromWidth(mq.size.width);
    final fold = FoldInfo.of(context);
    final body = KeyedSubtree(key: _bodyKey, child: widget.body);

    final bar = GlassNavBar(
      destinations: widget.destinations,
      selectedIndex: widget.selectedIndex,
      onSelect: widget.onSelect,
      onSearch: widget.onSearch,
      badges: widget.badges,
    );

    if (fold.posture == FoldPosture.tabletop) {
      return ColoredBox(
        color: c.page,
        child: HingeSplit(
          axis: Axis.vertical,
          first: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            child: body,
          ),
          second: SafeArea(
            top: false,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: SureSize.maxContentWidth,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(SureSpace.x4),
                  child: bar,
                ),
              ),
            ),
          ),
        ),
      );
    }

    if (!windowClass.usesRail) {
      // Prototype: the bar floats 25 pt in from the sides and 25 pt above
      // the bottom edge (over the home-indicator area); 16 pt without one.
      // Side insets are added too: e.g. the iPhone Duo cover screen reports
      // an 84 pt right inset.
      // The glass overhangs by 4 pt, so the bar box sits 21/21 pt in.
      final bottom = mq.padding.bottom > 0 ? 21.0 : SureSpace.x3;
      const side = 21.0;
      final barSpace = bottom + GlassNavBar.height + SureSpace.x4;
      return ColoredBox(
        color: c.page,
        child: Stack(
          children: [
            // Body scrolls under the glass bar; its bottom inset tells
            // screens how much room to leave.
            Positioned.fill(
              child: MediaQuery(
                data: mq.copyWith(
                  padding: mq.padding.copyWith(
                    bottom: barSpace > mq.padding.bottom
                        ? barSpace
                        : mq.padding.bottom,
                  ),
                ),
                child: body,
              ),
            ),
            Positioned(
              left: side + mq.padding.left,
              right: side + mq.padding.right,
              bottom: bottom,
              child: bar,
            ),
          ],
        ),
      );
    }

    final extended = windowClass == WindowClass.expanded;
    final railWidth = extended
        ? SureSize.railExtendedWidth
        : SureSize.railWidth;
    final railTotal = railWidth + mq.padding.left;

    return ColoredBox(
      color: c.page,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: railTotal,
            child: Padding(
              // Top inset + a little extra keeps the first item clear of the
              // rounded display corner.
              padding: EdgeInsets.only(
                left: mq.padding.left,
                top: mq.padding.top + SureSpace.x2,
                bottom: mq.padding.bottom,
              ),
              child: _Rail(
                extended: extended,
                destinations: widget.destinations,
                selectedIndex: widget.selectedIndex,
                onSelect: widget.onSelect,
                badges: widget.badges,
              ),
            ),
          ),
          VerticalDivider(width: 1, color: c.borderFaded),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeLeft: true,
              child: ShiftDisplayFeatures(
                offset: Offset(railTotal + 1, 0),
                child: body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Rail extends StatelessWidget {
  const _Rail({
    required this.extended,
    required this.destinations,
    required this.selectedIndex,
    required this.onSelect,
    required this.badges,
  });

  final bool extended;
  final List<ShellDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final Map<int, int> badges;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        // Large text / landscape phones: the rail scrolls instead of
        // overflowing.
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: NavigationRail(
              extended: extended,
              minWidth: SureSize.railWidth,
              minExtendedWidth: SureSize.railExtendedWidth,
              labelType: extended
                  ? NavigationRailLabelType.none
                  : NavigationRailLabelType.all,
              groupAlignment: -1,
              selectedIndex: selectedIndex,
              onDestinationSelected: onSelect,
              destinations: [
                for (var i = 0; i < destinations.length; i++)
                  NavigationRailDestination(
                    icon: CountBadge(
                      count: badges[i] ?? 0,
                      child: Icon(destinations[i].icon),
                    ),
                    selectedIcon: CountBadge(
                      count: badges[i] ?? 0,
                      child: Icon(destinations[i].selectedIcon),
                    ),
                    label: Text(destinations[i].label),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
