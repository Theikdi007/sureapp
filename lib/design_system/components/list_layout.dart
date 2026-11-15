import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

/// Design system `ListLayout` row: 20 pt primary-ink icon, body-3 medium
/// title, caption-1 subtitle, trailing slot (chevron by default).
class ListRow extends StatelessWidget {
  const ListRow({
    super.key,
    required this.title,
    this.icon,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.semanticLabel,
  });

  final String title;
  final IconData? icon;

  /// Replaces [icon] (e.g. an avatar).
  final Widget? leading;
  final String? subtitle;

  /// Defaults to a chevron when [onTap] is set.
  final Widget? trailing;
  final VoidCallback? onTap;

  /// Read instead of title + subtitle (e.g. a switch's state).
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final trail =
        trailing ??
        (onTap == null
            ? null
            : Icon(LucideIcons.chevronRight, size: 16, color: c.inkFaded));
    return Semantics(
      button: onTap != null,
      label: semanticLabel ?? [title, ?subtitle].join(', '),
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                if (leading != null)
                  leading!
                else if (icon != null)
                  Icon(icon, size: 20, color: c.primaryInk),
                if (leading != null || icon != null)
                  const SizedBox(width: SureSpace.x3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: SureText.body3(SureTypography.medium)
                            .copyWith(color: c.ink),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: SureText.caption1().copyWith(
                            color: c.inkFaded,
                          ),
                        ),
                    ],
                  ),
                ),
                if (trail != null) ...[
                  const SizedBox(width: SureSpace.x3),
                  trail,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Rows in one outlined card with hairlines between them (prototype
/// settings and address lists).
class ListGroup extends StatelessWidget {
  const ListGroup({
    super.key,
    required this.children,
    this.radius = SureRadius.xl,
  });

  final List<Widget> children;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      decoration: BoxDecoration(
        // Inline prototype box: no fill, the inline ring (see boxBorder).
        borderRadius: SureRadius.all(radius),
        border: Border.all(color: c.boxBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) Divider(height: 1, color: c.boxBorderFaded),
              children[i],
            ],
          ],
        ),
      ),
    );
  }
}
