import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_typography.dart';

/// `outline`: transparent with a 1 pt neutral border and ink label.
/// `faded`: primary-faded fill with a primary-ink label.
enum SureButtonVariant { solid, ghost, outline, faded }

/// Design system `Button` sizes (core/Button.jsx).
enum SureButtonSize {
  /// 48 high, 20 pt sides, 16 pt label, 20 pt icons 8 apart.
  large(48, 20, 16, 20, 8),

  /// 36 high, 14 pt sides, 14 pt label, 18 pt icons 8 apart.
  medium(36, 14, 14, 18, 8),

  /// 28 high, 10 pt sides, 13 pt label, 16 pt icons 6 apart.
  small(28, 10, 13, 16, 6);

  const SureButtonSize(this.height, this.side, this.font, this.icon, this.gap);

  final double height;
  final double side;
  final double font;
  final double icon;
  final double gap;
}

/// Design system `Button` (core/Button.jsx): pill, 500-weight label, scales
/// to 0.97 while pressed. Disabled: `background-disabled` /
/// `foreground-disabled`. Use [SureButtonSize.large] for primary actions;
/// the smaller sizes are below the 48 pt tap guideline, as in the design.
class SureButton extends StatefulWidget {
  const SureButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.variant = SureButtonVariant.solid,
    this.size = SureButtonSize.large,
    this.endIcon,
    this.startIcon,
    this.fullWidth = true,
    this.critical = false,
  });

  /// Destructive action (e.g. "Log out"): critical label and border on the
  /// ghost and outline variants.
  final bool critical;

  final String label;

  /// Null disables the button.
  final VoidCallback? onPressed;
  final bool loading;
  final SureButtonVariant variant;
  final SureButtonSize size;
  final IconData? endIcon;
  final IconData? startIcon;
  final bool fullWidth;

  /// Height of the default (large) size.
  static const double height = 48;

  @override
  State<SureButton> createState() => _SureButtonState();
}

class _SureButtonState extends State<SureButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = widget.size;
    final enabled = widget.onPressed != null && !widget.loading;
    final variant = widget.variant;
    final solid = variant == SureButtonVariant.solid;
    final faded = variant == SureButtonVariant.faded;
    final outline = variant == SureButtonVariant.outline;

    final Color bg;
    final Color fg;
    if (widget.onPressed == null) {
      bg = solid ? c.disabled : Colors.transparent;
      fg = c.disabledInk;
    } else {
      bg = solid
          ? c.primary
          : faded
          ? (widget.critical ? c.criticalFaded : c.primaryFaded)
          : Colors.transparent;
      fg = solid
          ? c.onPrimary
          : widget.critical
          ? c.critical
          : outline
          ? c.ink
          : c.primaryInk;
    }

    final content = widget.loading
        ? SizedBox.square(
            dimension: s.icon,
            child: CircularProgressIndicator(strokeWidth: 2.2, color: fg),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.startIcon != null) ...[
                Icon(widget.startIcon, size: s.icon, color: fg),
                SizedBox(width: s.gap),
              ],
              Flexible(
                child: Text(
                  widget.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: SureTypography.style(
                    size: s.font,
                    height: 1,
                    weight: SureTypography.medium,
                    color: fg,
                  ),
                ),
              ),
              if (widget.endIcon != null) ...[
                SizedBox(width: s.gap),
                Icon(widget.endIcon, size: s.icon, color: fg),
              ],
            ],
          );

    final button = AnimatedScale(
      scale: _pressed ? 0.97 : 1,
      duration: const Duration(milliseconds: 50),
      child: Material(
        color: bg,
        shape: StadiumBorder(
          // DS Button: a coloured outline (critical too, e.g. Log out) uses
          // `border-primary`; only the label turns red.
          side: outline
              ? BorderSide(color: widget.critical ? c.borderPrimary : c.border)
              : BorderSide.none,
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: enabled ? widget.onPressed : null,
          onHighlightChanged: (v) => setState(() => _pressed = v && enabled),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: s.height,
              minWidth: s.height,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: s.side),
              child: widget.fullWidth
                  ? Center(child: content)
                  : Align(widthFactor: 1, child: content),
            ),
          ),
        ),
      ),
    );

    return Semantics(
      button: true,
      enabled: enabled,
      label: widget.loading ? '${widget.label}, loading' : widget.label,
      excludeSemantics: true,
      child: button,
    );
  }
}
