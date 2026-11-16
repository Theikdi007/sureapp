import 'package:flutter/material.dart';

import '../../../../design_system/adaptive/fold_info.dart';
import '../../../../design_system/adaptive/two_pane.dart';
import '../../../../design_system/components/sure_logo.dart';

/// Frame of the prototype's sign-in screens: content from the top, the
/// action (button or number pad) at the bottom, 24 pt side and bottom
/// padding. [topPadding] is the gap under the status bar (prototype: 28 on
/// Login, 16 under a `PageHeader`).
///
/// * Fills the screen; scrolls when the content is taller (keyboard,
///   landscape, large text).
/// * Wide windows: centered at 480 pt.
/// * Book posture (vertical hinge): logo on one side, the screen on the
///   other. Tabletop posture: content above the hinge, action below.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.content,
    this.bottom,
    this.topPadding = 16,
  });

  final Widget content;
  final Widget? bottom;
  final double topPadding;

  static const double _side = 24;
  static const double _maxWidth = 480;

  @override
  Widget build(BuildContext context) {
    final fold = FoldInfo.of(context);

    Widget padded(Widget child, {double top = 0, double bottom = 24}) => Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _maxWidth),
        child: Padding(
          padding: EdgeInsets.fromLTRB(_side, top, _side, bottom),
          child: child,
        ),
      ),
    );

    if (fold.posture == FoldPosture.tabletop) {
      return Scaffold(
        body: HingeSplit(
          axis: Axis.vertical,
          first: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: padded(content, top: topPadding),
            ),
          ),
          second: SafeArea(
            top: false,
            child: Center(child: padded(bottom ?? const SizedBox.shrink())),
          ),
        ),
      );
    }

    // Prototype: 24 pt from the bottom edge, home indicator included, so
    // the inset and the padding don't add up.
    final column = SafeArea(
      minimum: const EdgeInsets.only(bottom: 24),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: padded(
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [content, const Spacer(), ?bottom],
              ),
              top: topPadding,
              bottom: 0,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: fold.isSeparating && fold.isVertical
          ? HingeSplit(
              axis: Axis.horizontal,
              first: const SafeArea(child: Center(child: SureLogo(height: 64))),
              second: column,
            )
          : column,
    );
  }
}
