import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_colors.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

/// API status colors (`statusColor`: warning | primary | positive |
/// critical | neutral) as (faded bg, ink, dot).
(Color, Color, Color) statusColors(SureColors c, String color) =>
    switch (color) {
      'positive' => (c.positiveFaded, c.positiveInk, c.positive),
      'warning' => (c.warningFaded, c.warningInk, c.warning),
      'critical' => (c.criticalFaded, c.criticalInk, c.critical),
      'neutral' => (c.neutralFaded, c.inkFaded, c.inkFaded),
      _ => (c.primaryFaded, c.primaryInk, c.primary),
    };

/// Design system `Badge` faded, rounded, small (18 pt, 10/500).
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label, required this.color});

  final String label;
  final String color;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, _) = statusColors(context.colors, color);
    return Container(
      // 18 pt at normal size; grows with large text instead of clipping.
      constraints: const BoxConstraints(minHeight: 18),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: SureRadius.all(SureRadius.pill),
      ),
      // Hugs the label, and ellipsizes when its parent is narrower.
      child: Center(
        widthFactor: 1,
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: SureText.caption2().copyWith(color: fg, height: 1),
        ),
      ),
    );
  }
}

/// Design system `StatusStyle`: 8 pt colored dot + 12/500 label.
class StatusDot extends StatelessWidget {
  const StatusDot({super.key, required this.label, required this.color});

  final String label;
  final String color;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final (_, _, dot) = statusColors(c, color);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: SureText.caption1(SureTypography.medium)
              .copyWith(color: c.ink),
        ),
      ],
    );
  }
}

class StepItem {
  const StepItem({
    required this.label,
    this.description,
    this.done = false,
    this.current = false,
  });

  final String label;
  final String? description;
  final bool done;
  final bool current;
}

/// Design system `Stepper` (column): 24 pt discs (neon with a check when
/// done, neon number when current, neutral number ahead), 2 pt rail,
/// 13 pt labels (750 current) with 11 pt descriptions.
class VerticalStepper extends StatelessWidget {
  const VerticalStepper({super.key, required this.steps});

  final List<StepItem> steps;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          Semantics(
            label:
                '${steps[i].label}${steps[i].done
                    ? ', done'
                    : steps[i].current
                    ? ', current'
                    : ''}',
            excludeSemantics: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Disc(index: i, step: steps[i]),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        steps[i].label,
                        style: TextStyle(
                          fontFamily: SureTypography.fontFamily,
                          fontSize: 13,
                          fontWeight: steps[i].current
                              ? SureTypography.bold
                              : SureTypography.medium,
                          color: steps[i].current || steps[i].done
                              ? c.ink
                              : c.inkFaded,
                        ),
                      ),
                      if (steps[i].description != null)
                        Text(
                          steps[i].description!,
                          style: TextStyle(
                            fontFamily: SureTypography.fontFamily,
                            fontSize: 11,
                            color: c.inkFaded,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (i < steps.length - 1)
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 2,
                height: 20,
                margin: const EdgeInsets.fromLTRB(11, 4, 0, 4),
                decoration: BoxDecoration(
                  // `background-neutral` rail ahead.
                  color: steps[i].done ? c.primary : c.neutral,
                  borderRadius: SureRadius.all(2),
                ),
              ),
            ),
        ],
      ],
    );
  }
}

class _Disc extends StatelessWidget {
  const _Disc({required this.index, required this.step});

  final int index;
  final StepItem step;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final on = step.done || step.current;
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: on ? c.primary : c.neutralFaded,
        shape: BoxShape.circle,
      ),
      child: step.done
          ? Icon(LucideIcons.check, size: 12, color: c.onPrimary)
          : Text(
              '${index + 1}',
              style: TextStyle(
                fontFamily: SureTypography.fontFamily,
                fontSize: 12,
                fontWeight: SureTypography.bold,
                color: on ? c.onPrimary : c.inkFaded,
              ),
            ),
    );
  }
}

/// Outlined card container used across order screens (radius 16, 1 pt
/// neutral border).
class OutlinedCard extends StatelessWidget {
  const OutlinedCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.radius = SureRadius.large,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      borderRadius: SureRadius.all(radius),
      border: Border.all(color: context.colors.boxBorder),
    ),
    child: child,
  );
}

/// Design system `CalendarCell`: 48 pt wide, radius 12; picked is neon.
class CalendarCell extends StatelessWidget {
  const CalendarCell({
    super.key,
    required this.weekday,
    required this.day,
    required this.selected,
    required this.onTap,
  });

  final String weekday;
  final String day;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: true,
      selected: selected,
      label: '$weekday $day',
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: SureMotion.fast,
          width: 48,
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
          decoration: BoxDecoration(
            color: selected ? c.primary : c.raised,
            borderRadius: SureRadius.all(SureRadius.medium),
            border: Border.all(
              color: selected ? Colors.transparent : c.borderFaded,
            ),
          ),
          child: Column(
            children: [
              Text(
                weekday.toUpperCase(),
                style: TextStyle(
                  fontFamily: SureTypography.fontFamily,
                  fontSize: 10,
                  fontWeight: SureTypography.medium,
                  letterSpacing: 0.4,
                  color: selected
                      ? SureBrand.darkGreen.withValues(alpha: 0.72)
                      : c.inkFaded,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                day,
                style: TextStyle(
                  fontFamily: SureTypography.fontFamily,
                  fontSize: 16,
                  fontWeight: SureTypography.bold,
                  color: selected ? c.onPrimary : c.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Design system `Button` small (28 pt, 13 pt): solid neon or outline.
class SmallChoiceButton extends StatelessWidget {
  const SmallChoiceButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: true,
      selected: selected,
      enabled: onTap != null,
      child: Opacity(
        opacity: onTap == null ? 0.4 : 1,
        child: Material(
          color: selected ? c.primary : Colors.transparent,
          shape: StadiumBorder(
            side: BorderSide(color: selected ? Colors.transparent : c.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // widthFactor 1: as wide as the label, centered vertically.
              child: Center(
                widthFactor: 1,
                child: Text(
                  label,
                  style: TextStyle(
                    fontFamily: SureTypography.fontFamily,
                    fontSize: 13,
                    fontWeight: SureTypography.medium,
                    color: selected ? c.onPrimary : c.ink,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
