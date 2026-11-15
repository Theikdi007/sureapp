import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../glass/glass_surface.dart';
import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';
import 'section_header.dart';

/// Design system `BottomSheet` as Liquid Glass: 24 pt top radius, 40×4
/// handle, featured-3 title with a ghost close button, 20/28 padding.
/// Scrim is the prototype's 50% black.
Future<T?> showSureSheet<T>(
  BuildContext context, {
  String? title,
  bool showClose = true,
  double maxHeightFactor = 0.76,
  required Widget Function(BuildContext context) builder,
}) => showModalBottomSheet<T>(
  context: context,
  // Above the tab bar and floating buttons.
  useRootNavigator: true,
  isScrollControlled: true,
  useSafeArea: true,
  backgroundColor: Colors.transparent,
  barrierColor: context.colors.scrim,
  builder: (context) => ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.sizeOf(context).height * maxHeightFactor,
      maxWidth: 640,
    ),
    child: SureSheet(
      title: title,
      showClose: showClose,
      child: builder(context),
    ),
  ),
);

class SureSheet extends StatelessWidget {
  const SureSheet({
    super.key,
    this.title,
    this.showClose = true,
    required this.child,
  });

  final String? title;
  final bool showClose;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return GlassSurface(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(SureRadius.xl),
      ),
      // Prototype sheets are solid white (`elevation-base`): over the dark
      // scrim any see-through turns them grey, so the fill is opaque; the
      // glass rim still lights the top edge.
      tint: c.page,
      solidColor: c.page,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 28 + bottom * 0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  // `background-neutral`.
                  color: c.neutral,
                  borderRadius: SureRadius.all(SureRadius.pill),
                ),
              ),
            ),
            const SizedBox(height: 14),
            if (title != null || showClose) ...[
              Row(
                children: [
                  Expanded(
                    child: title == null
                        ? const SizedBox.shrink()
                        : Semantics(
                            header: true,
                            child: Text(
                              title!,
                              style: SureText.featured3().copyWith(
                                color: c.ink,
                              ),
                            ),
                          ),
                  ),
                  if (showClose)
                    IconButton(
                      tooltip: 'Close',
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: Icon(LucideIcons.x, size: 20, color: c.ink),
                    ),
                ],
              ),
              const SizedBox(height: 14),
            ],
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}

/// Design system `Payment` row (also used for shipping, stores, addresses):
/// 24 pt icon, body-3 medium title, caption-1 description, trailing, radio.
/// Selected: neon-faded fill with a 1.5 pt fresh-green border.
class SelectRow extends StatelessWidget {
  const SelectRow({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.trailing,
    required this.selected,
    this.enabled = true,
    required this.onSelect,
  });

  final IconData icon;
  final String title;
  final String? description;
  final String? trailing;
  final bool selected;
  final bool enabled;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final row = AnimatedContainer(
      duration: SureMotion.fast,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: selected ? c.primaryFaded : c.raised,
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(
          color: selected ? c.borderPrimary : c.border,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: selected ? c.primaryInk : c.ink),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: SureText.body3(SureTypography.medium)
                      .copyWith(color: c.ink),
                ),
                if (description != null)
                  Text(
                    description!,
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 12),
            Text(trailing!, style: SureText.body2().copyWith(color: c.ink)),
          ],
          const SizedBox(width: 12),
          _Radio(selected: selected),
        ],
      ),
    );
    return Semantics(
      button: true,
      selected: selected,
      enabled: enabled,
      child: Opacity(
        opacity: enabled ? 1 : 0.5,
        child: PressScale(
          onTap: enabled ? onSelect : null,
          scale: 0.99,
          child: row,
        ),
      ),
    );
  }
}

/// Design system `Radio` (medium, 20 pt). Selected: neon fill, 1.5 pt
/// dark-green ring, dark-green dot (half size). Off: page fill, 1.5 pt
/// neutral ring.
class _Radio extends StatelessWidget {
  const _Radio({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return AnimatedContainer(
      duration: SureMotion.fast,
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? c.primary : c.raised,
        border: Border.all(
          color: selected ? c.onPrimary : c.border,
          width: 1.5,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: c.onPrimary,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}

/// Design system `Switch` (medium 40×22, 18 pt thumb): neon when on.
class SureSwitch extends StatelessWidget {
  const SureSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      toggled: value,
      label: label,
      button: true,
      child: GestureDetector(
        onTap: onChanged == null ? null : () => onChanged!(!value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 40,
          height: 22,
          padding: const EdgeInsets.all(2),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          decoration: BoxDecoration(
            // Off track: `background-neutral`.
            color: value ? c.primary : c.neutral,
            borderRadius: SureRadius.all(SureRadius.pill),
          ),
          child: Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  offset: Offset(0, 1),
                  blurRadius: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Design system `Tabs` (pills, medium = 36 pt / 14 pt, full width):
/// selected is neon-faded with primary-ink 750 text; others ink-faded 500.
class PillTabs extends StatelessWidget {
  const PillTabs({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.fullWidth = true,
  });

  /// (id, label)
  final List<(String, String)> items;
  final String value;
  final ValueChanged<String> onChanged;

  /// True: tabs share the row. False: each tab hugs its label (16 pt
  /// sides), as the prototype's `Tabs` without `fullWidth`.
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    Widget tab((String, String) item) {
      final on = item.$1 == value;
      return Semantics(
        selected: on,
        button: true,
        child: GestureDetector(
          onTap: () => onChanged(item.$1),
          child: AnimatedContainer(
            duration: SureMotion.fast,
            height: 36,
            padding: fullWidth
                ? null
                : const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: on ? c.primaryFaded : Colors.transparent,
              borderRadius: SureRadius.all(SureRadius.pill),
            ),
            child: Text(
              item.$2,
              maxLines: 1,
              style: SureText.body3(
                on ? SureTypography.bold : SureTypography.medium,
              ).copyWith(color: on ? c.primaryInk : c.inkFaded),
            ),
          ),
        ),
      );
    }

    if (!fullWidth) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(spacing: 6, children: [for (final it in items) tab(it)]),
      );
    }
    return Row(
      spacing: 6,
      children: [for (final it in items) Expanded(child: tab(it))],
    );
  }
}

/// Design system `PayBreakdown`: label/value rows (body-3; positive rows
/// green), divider, bold total.
class PayBreakdown extends StatelessWidget {
  const PayBreakdown({
    super.key,
    required this.rows,
    required this.total,
    this.totalLabel = 'Total',
  });

  /// (label, value, positive)
  final List<(String, String, bool)> rows;
  final String total;
  final String totalLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (label, value, positive) in rows) ...[
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: SureText.body3().copyWith(color: c.inkFaded),
                ),
              ),
              Text(
                value,
                style: SureText.body3(SureTypography.medium)
                    .copyWith(color: positive ? c.positiveInk : c.ink),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
        Divider(height: 1, color: c.boxBorderFaded),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Text(
                totalLabel,
                style: SureText.body2(SureTypography.bold)
                    .copyWith(color: c.ink),
              ),
            ),
            Text(
              total,
              style: SureText.body2(SureTypography.bold).copyWith(color: c.ink),
            ),
          ],
        ),
      ],
    );
  }
}

/// Outlined pill − qty + stepper (28 pt buttons, 13/600 count).
class QtyStepper extends StatelessWidget {
  const QtyStepper({
    super.key,
    required this.qty,
    required this.onChanged,
    this.min = 1,
    this.max = 20,
    this.busy = false,
  });

  final int qty;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    Widget btn(String glyph, String label, VoidCallback? onTap) => Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: PressScale(
        onTap: busy ? null : onTap,
        scale: 0.9,
        child: SizedBox.square(
          dimension: 28,
          child: Center(
            child: Text(
              glyph,
              style: SureText.body2(FontWeight.w600)
                  .copyWith(color: onTap == null ? c.disabledInk : c.ink),
            ),
          ),
        ),
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: SureRadius.all(SureRadius.pill),
        border: Border.all(color: c.boxBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          btn(
            '−',
            'Decrease quantity',
            qty > min ? () => onChanged(qty - 1) : null,
          ),
          SizedBox(
            width: 24,
            child: Text(
              '$qty',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: SureTypography.fontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: c.ink,
              ),
            ),
          ),
          btn(
            '+',
            'Increase quantity',
            qty < max ? () => onChanged(qty + 1) : null,
          ),
        ],
      ),
    );
  }
}

/// Design system `Alert` inline (primary / critical).
class InlineAlert extends StatelessWidget {
  const InlineAlert({
    super.key,
    required this.icon,
    required this.text,
    this.critical = false,
  });

  final IconData icon;
  final String text;
  final bool critical;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: critical ? c.criticalFaded : c.primaryFaded,
        borderRadius: SureRadius.all(SureRadius.medium),
        border: Border.all(
          color: critical
              ? c.criticalInk.withValues(alpha: 0.3)
              : c.primaryFadedBorder,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: critical ? c.criticalInk : c.primaryInk),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: SureText.body3().copyWith(color: c.inkFaded),
            ),
          ),
        ],
      ),
    );
  }
}

/// Design system `CartFloatingBtn`: 56 pt neon disc, bag icon, red count.
class CartFab extends StatelessWidget {
  const CartFab({super.key, required this.count, required this.onTap});

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: true,
      label: 'Cart, $count items',
      excludeSemantics: true,
      child: PressScale(
        onTap: onTap,
        scale: 0.94,
        child: SizedBox.square(
          dimension: 56,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: c.primary,
                  shape: BoxShape.circle,
                  boxShadow: SureShadow.float(c.shadow),
                ),
                child: Center(
                  child: Icon(
                    LucideIcons.shoppingBag,
                    size: 24,
                    color: c.onPrimary,
                  ),
                ),
              ),
              if (count > 0)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 20),
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: c.critical,
                      borderRadius: SureRadius.all(SureRadius.pill),
                      border: Border.all(color: c.page, width: 2),
                    ),
                    child: Text(
                      '$count',
                      style: TextStyle(
                        fontFamily: SureTypography.fontFamily,
                        fontSize: 11,
                        height: 1,
                        fontWeight: SureTypography.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
