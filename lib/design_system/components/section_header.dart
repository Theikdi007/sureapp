import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

enum SectionHeaderSize { large, medium, small }

/// Design system `SectionHeader`: featured-3 bold title with an
/// optional 20 pt primary icon, caption-1 description, trailing action.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.action,
    this.size = SectionHeaderSize.large,
  });

  final SectionHeaderSize size;

  final String title;
  final String? description;
  final IconData? icon;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20, color: c.primaryInk),
                    const SizedBox(width: SureSpace.x2),
                  ],
                  Flexible(
                    child: Semantics(
                      header: true,
                      child: Text(
                        title,
                        style: switch (size) {
                          SectionHeaderSize.large => SureText.featured3(),
                          SectionHeaderSize.medium => SureText.body1(
                            SureTypography.bold,
                          ),
                          SectionHeaderSize.small => SureText.body2(
                            SureTypography.bold,
                          ),
                        }.copyWith(color: c.ink),
                      ),
                    ),
                  ),
                ],
              ),
              if (description != null) ...[
                const SizedBox(height: 2),
                Text(
                  description!,
                  style: SureText.caption1().copyWith(color: c.inkFaded),
                ),
              ],
            ],
          ),
        ),
        if (action != null) ...[const SizedBox(width: SureSpace.x3), action!],
      ],
    );
  }
}

/// Design system `Link`: primary-ink, medium weight (e.g. "See All").
class SureLink extends StatelessWidget {
  const SureLink(this.label, {super.key, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    child: InkWell(
      onTap: onTap,
      borderRadius: SureRadius.all(SureRadius.small),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(
          label,
          style: SureText.body2(SureTypography.medium)
              .copyWith(color: context.colors.primaryInk),
        ),
      ),
    ),
  );
}

/// Scales its child while pressed (prototype `style-active` scale).
class PressScale extends StatefulWidget {
  const PressScale({
    super.key,
    required this.child,
    this.onTap,
    this.scale = 0.97,
    this.semanticLabel,
  });

  final Widget child;
  final VoidCallback? onTap;
  final double scale;
  final String? semanticLabel;

  @override
  State<PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<PressScale> {
  bool _down = false;

  void _set(bool v) {
    if (widget.onTap != null && v != _down) setState(() => _down = v);
  }

  @override
  Widget build(BuildContext context) => Semantics(
    button: widget.onTap != null,
    label: widget.semanticLabel,
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      onTapDown: (_) => _set(true),
      onTapUp: (_) => _set(false),
      onTapCancel: () => _set(false),
      child: AnimatedScale(
        scale: _down ? widget.scale : 1,
        duration: const Duration(milliseconds: 90),
        child: widget.child,
      ),
    ),
  );
}
