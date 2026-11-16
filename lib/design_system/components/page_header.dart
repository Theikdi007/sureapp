import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

/// Design system `PageHeader` (navigation/PageHeader.jsx): 40 pt round back
/// button on `background-neutral-faded`, centered body-1 bold title and
/// caption-1 subtitle, a 40 pt slot on the right to keep the title centered.
class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
    this.actions = const [],
    this.subtitleMaxLines = 1,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onBack;
  final List<Widget> actions;

  /// 1 in the fixed-height scaffold header; sign-in screens let a long
  /// subtitle wrap to 2 like the prototype.
  final int subtitleMaxLines;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final centered = onBack != null || actions.isNotEmpty;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48),
      child: Row(
        children: [
          if (onBack != null) ...[
            Semantics(
              button: true,
              label: MaterialLocalizations.of(context).backButtonTooltip,
              excludeSemantics: true,
              child: Material(
                color: c.neutralFaded,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: onBack,
                  child: SizedBox.square(
                    dimension: 40,
                    child: Icon(LucideIcons.arrowLeft, size: 20, color: c.ink),
                  ),
                ),
              ),
            ),
            const SizedBox(width: SureSpace.x3),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: centered
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Semantics(
                  header: true,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: SureText.body1(SureTypography.bold)
                        .copyWith(color: c.ink),
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    maxLines: subtitleMaxLines,
                    overflow: TextOverflow.ellipsis,
                    textAlign: centered ? TextAlign.center : TextAlign.start,
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
              ],
            ),
          ),
          const SizedBox(width: SureSpace.x3),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: onBack != null ? 40 : 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                for (var i = 0; i < actions.length; i++) ...[
                  if (i > 0) const SizedBox(width: SureSpace.x2),
                  actions[i],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
