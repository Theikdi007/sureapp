import 'package:flutter/material.dart';

import '../../../design_system/adaptive/fold_info.dart';
import '../../../design_system/adaptive/two_pane.dart';
import '../../../design_system/adaptive/window_class.dart';
import '../../../design_system/components/page_header.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/theme/app_theme.dart';

/// True when a pushed screen should show list and detail side by side:
/// medium/expanded widths, or a book-posture fold (panes meet at the hinge).
bool useSplitLayout(BuildContext context, double width) {
  final fold = FoldInfo.of(context);
  return (fold.isSeparating && fold.isVertical) ||
      !WindowClass.fromWidth(width).isCompact;
}

/// A pushed screen in list-detail form: the page header on top, then
/// [TwoPane] (which keeps both panes off the hinge).
///
/// Use it when [useSplitLayout] is true; compact screens use
/// [PageScaffold] with the same content as slivers.
class SplitPage extends StatelessWidget {
  const SplitPage({
    super.key,
    required this.title,
    this.subtitle,
    required this.list,
    required this.detail,
    this.emptyDetail,
    this.actions = const [],
  });

  final String title;
  final String? subtitle;
  final List<Widget> actions;

  /// Scrollable pane content (each pane scrolls on its own).
  final List<Widget> list;
  final List<Widget>? detail;
  final Widget? emptyDetail;

  static const _pad = EdgeInsets.fromLTRB(
    PageScaffold.sidePadding,
    8,
    PageScaffold.sidePadding,
    60,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.page,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                PageScaffold.sidePadding,
                8,
                PageScaffold.sidePadding,
                8,
              ),
              child: PageHeader(
                title: title,
                subtitle: subtitle,
                onBack: () => Navigator.of(context).maybePop(),
                actions: actions,
              ),
            ),
            Expanded(
              child: TwoPane(
                list: ListView(padding: _pad, children: list),
                detail: detail == null
                    ? null
                    : ListView(padding: _pad, children: detail!),
                emptyDetail: emptyDetail == null
                    ? null
                    : Center(child: emptyDetail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Vertical gaps between pane children.
List<Widget> spaced(List<Widget> children, {double gap = 16}) => [
  for (var i = 0; i < children.length; i++) ...[
    if (i > 0) SizedBox(height: gap),
    children[i],
  ],
];
