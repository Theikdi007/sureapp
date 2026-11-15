import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';

/// Tier coin artwork (`assets/images/tiers`). Unknown tiers (e.g. iSure's
/// "newbie") fall back to the first coin.
class TierCoin extends StatelessWidget {
  const TierCoin({super.key, required this.tier, this.size = 48});

  final String tier;
  final double size;

  static const known = ['classic', 'exclusive', 'vsp', 'vvsp', 'xsp'];

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/tiers/${known.contains(tier) ? tier : known.first}.svg',
    width: size,
    height: size,
    excludeFromSemantics: true,
  );
}

/// Design system `LoyalActions` item: 48 pt faded disc, caption label.
class LoyalAction {
  const LoyalAction(this.icon, this.label, this.onTap);

  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

class LoyalActions extends StatelessWidget {
  const LoyalActions({super.key, required this.items});

  final List<LoyalAction> items;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final it in items)
          Expanded(
            child: Semantics(
              button: true,
              label: it.label,
              excludeSemantics: true,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: it.onTap,
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: c.primaryFaded,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(it.icon, size: 20, color: c.primaryInk),
                    ),
                    Text(
                      it.label,
                      textAlign: TextAlign.center,
                      style: SureText.caption1(SureTypography.medium)
                          .copyWith(color: c.ink),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Design system `DataDisplay` (caption label over a bold value).
class DataDisplay extends StatelessWidget {
  const DataDisplay({
    super.key,
    required this.label,
    required this.value,
    this.large = true,
  });

  final String label;
  final String value;
  final bool large;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 1,
    children: [
      Text(
        label,
        style: SureText.caption1().copyWith(color: context.colors.inkFaded),
      ),
      Text(
        value,
        style: (large ? SureText.featured2() : SureText.featured3()).copyWith(
          color: context.colors.ink,
        ),
      ),
    ],
  );
}

/// Design system `VarientButton`: 48 pt, radius 12, neon when selected.
class VariantButton extends StatelessWidget {
  const VariantButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: SureMotion.fast,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: selected ? c.primary : c.raised,
            borderRadius: SureRadius.all(SureRadius.medium),
            border: Border.all(color: selected ? Colors.transparent : c.border),
          ),
          // Hugs the label: `alignment` would stretch it to the full row.
          child: Center(
            widthFactor: 1,
            child: Text(
              label,
              style: SureText.body2(SureTypography.medium)
                  .copyWith(color: selected ? c.onPrimary : c.ink),
            ),
          ),
        ),
      ),
    );
  }
}

/// Outlined small tile (Club Score / Earn Rate).
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: onTap != null,
      label: '$label $value',
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: SureRadius.all(SureRadius.medium),
            border: Border.all(color: c.boxBorderFaded),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: SureTypography.style(size: 11, color: c.inkFaded),
              ),
              Text(
                value,
                style: SureTypography.style(
                  size: 16,
                  weight: SureTypography.bold,
                  color: c.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Design system `Progress` (8 pt track, neon fill).
class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.percent});

  final num percent;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final p = (percent.clamp(0, 100)) / 100;
    return Semantics(
      value: '${(p * 100).round()}%',
      child: ClipRRect(
        borderRadius: SureRadius.all(SureRadius.pill),
        child: SizedBox(
          height: 8,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(color: c.neutralFaded),
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: p.toDouble(),
                child: ColoredBox(color: c.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
