import 'dart:ui' show DisplayFeature;

import 'package:flutter/material.dart';

import '../tokens/sure_metrics.dart';
import 'fold_info.dart';
import 'window_class.dart';

/// List-detail layout.
///
/// * compact: only [list] (the caller pushes the detail as a route), or only
///   [detail] when [showDetailWhenSingle] is true.
/// * medium/expanded: list pane + detail pane.
/// * book posture: panes split exactly at the hinge, nothing under it.
///
/// Pane widgets keep their state when the layout switches (fold/unfold,
/// rotate) because each is wrapped in a [GlobalKey]ed subtree.
class TwoPane extends StatefulWidget {
  const TwoPane({
    super.key,
    required this.list,
    required this.detail,
    this.emptyDetail,
    this.showDetailWhenSingle = false,
  });

  final Widget list;

  /// Null when nothing is selected; [emptyDetail] shows in the pane instead.
  final Widget? detail;
  final Widget? emptyDetail;
  final bool showDetailWhenSingle;

  @override
  State<TwoPane> createState() => _TwoPaneState();
}

class _TwoPaneState extends State<TwoPane> {
  final _listKey = GlobalKey(debugLabel: 'TwoPane.list');
  final _detailKey = GlobalKey(debugLabel: 'TwoPane.detail');

  @override
  Widget build(BuildContext context) {
    final list = KeyedSubtree(key: _listKey, child: widget.list);
    final detailChild = widget.detail ?? widget.emptyDetail ?? const SizedBox();
    final detail = KeyedSubtree(key: _detailKey, child: detailChild);

    return LayoutBuilder(
      builder: (context, constraints) {
        final fold = FoldInfo.of(context);
        if (fold.isSeparating && fold.isVertical) {
          return HingeSplit(axis: Axis.horizontal, first: list, second: detail);
        }
        if (WindowClass.fromWidth(constraints.maxWidth).isCompact) {
          return widget.showDetailWhenSingle && widget.detail != null
              ? detail
              : list;
        }
        final listWidth = (constraints.maxWidth * 0.4).clamp(
          280.0,
          SureSize.listPaneWidth,
        );
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: listWidth, child: list),
            const VerticalDivider(width: 1),
            Expanded(child: detail),
          ],
        );
      },
    );
  }
}

/// Splits [first]/[second] at the reported hinge so no content sits on it.
///
/// [axis] horizontal: hinge is vertical, panes side by side (book).
/// [axis] vertical: hinge is horizontal, panes stacked (tabletop).
///
/// Hinge bounds are read from the nearest MediaQuery, which must share this
/// widget's origin. A parent that offsets its child (e.g. the shell placing
/// the body right of the rail) wraps it in [ShiftDisplayFeatures]. Falls back
/// to an even split when no hinge is reported.
class HingeSplit extends StatelessWidget {
  const HingeSplit({
    super.key,
    required this.axis,
    required this.first,
    required this.second,
  });

  final Axis axis;
  final Widget first;
  final Widget second;

  @override
  Widget build(BuildContext context) {
    final hinge = FoldInfo.of(context).hinge;
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontal = axis == Axis.horizontal;
        final extent = horizontal
            ? constraints.maxWidth
            : constraints.maxHeight;

        var start = extent / 2;
        var end = extent / 2;
        if (hinge != null) {
          start = (horizontal ? hinge.left : hinge.top).clamp(0, extent);
          end = (horizontal ? hinge.right : hinge.bottom).clamp(start, extent);
        }
        final gap = end - start;

        return Flex(
          direction: axis,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: horizontal ? start : null,
              height: horizontal ? null : start,
              // Panes drop the hinge so nested layouts don't split again.
              child: _withoutDisplayFeatures(context, first),
            ),
            SizedBox(
              width: horizontal ? gap : null,
              height: horizontal ? null : gap,
            ),
            Expanded(child: _withoutDisplayFeatures(context, second)),
          ],
        );
      },
    );
  }

  static Widget _withoutDisplayFeatures(BuildContext context, Widget child) =>
      MediaQuery(
        data: MediaQuery.of(context).copyWith(displayFeatures: const []),
        child: child,
      );
}

/// Re-bases `MediaQuery.displayFeatures` for a child laid out [offset] away
/// from its parent's origin, so [FoldInfo]/[HingeSplit] inside it see the
/// hinge in their own coordinates.
class ShiftDisplayFeatures extends StatelessWidget {
  const ShiftDisplayFeatures({
    super.key,
    required this.offset,
    required this.child,
  });

  final Offset offset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    if (mq.displayFeatures.isEmpty || offset == Offset.zero) return child;
    return MediaQuery(
      data: mq.copyWith(
        displayFeatures: [
          for (final f in mq.displayFeatures)
            DisplayFeature(
              bounds: f.bounds.shift(-offset),
              type: f.type,
              state: f.state,
            ),
        ],
      ),
      child: child,
    );
  }
}
