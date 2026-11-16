import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_colors.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';
import 'order_components.dart';
import 'section_header.dart';

/// Support-screen components from the design system's commerce set
/// (ServiceCards.jsx, RepairListCard, TechVaultListCard).

/// Shared card shell: radius 16, `elevation-base` fill, 1 pt faded border.
class _CardShell extends StatelessWidget {
  const _CardShell({
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.fill,
    this.border = true,
    this.semanticLabel,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color? fill;
  final bool border;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final box = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: fill ?? c.raised,
        borderRadius: SureRadius.all(SureRadius.large),
        border: border ? Border.all(color: c.borderFaded) : null,
      ),
      child: child,
    );
    return onTap == null
        ? Semantics(label: semanticLabel, child: box)
        : PressScale(onTap: onTap, semanticLabel: semanticLabel, child: box);
  }
}

/// Design system `Avatar` icon, `primary`, squared: 40 pt, radius 28%,
/// neon-faded fill, primary-ink glyph.
class IconTile extends StatelessWidget {
  const IconTile({
    super.key,
    required this.icon,
    this.size = 40,
    this.iconSize,
    this.solid = false,
    this.muted = false,
  });

  final IconData icon;
  final double size;

  /// Defaults to half of [size].
  final double? iconSize;

  /// Neon fill (an active TechVault plan).
  final bool solid;

  /// Neutral fill (an expired plan).
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final (bg, fg) = solid
        ? (c.primary, c.onPrimary)
        : muted
        ? (c.neutralFaded, c.inkFaded)
        : (c.primaryFaded, c.primaryInk);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        // Avatar `squared`: radius is 28% of the size.
        borderRadius: SureRadius.all((size * 0.28).roundToDouble()),
      ),
      child: Icon(icon, size: iconSize ?? size / 2, color: fg),
    );
  }
}

/// Design system `ServiceCards`: icon tile, body-2 medium title, caption-1
/// description, chevron.
class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String? description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return _CardShell(
      onTap: onTap,
      semanticLabel: [title, ?description].join('. '),
      child: ExcludeSemantics(
        child: Row(
          children: [
            IconTile(icon: icon, iconSize: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: SureText.body2(SureTypography.medium)
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
            Icon(LucideIcons.chevronRight, size: 18, color: c.inkFaded),
          ],
        ),
      ),
    );
  }
}

class ServiceMenuItem {
  const ServiceMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.badge,
  });

  final IconData icon;
  final String label;
  final String? badge;
  final VoidCallback onTap;
}

/// Design system `ServiceMenuList`: compact rows in one outlined card,
/// hairlines between them.
class ServiceMenuList extends StatelessWidget {
  const ServiceMenuList({super.key, required this.items});

  final List<ServiceMenuItem> items;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: c.raised,
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(color: c.borderFaded),
      ),
      clipBehavior: Clip.antiAlias,
      // `padding: 2px 14px` (rows carry the sides).
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0)
              Divider(
                height: 1,
                indent: 14,
                endIndent: 14,
                color: c.borderFaded,
              ),
            Semantics(
              button: true,
              label: items[i].label,
              excludeSemantics: true,
              child: InkWell(
                onTap: items[i].onTap,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: SureSize.minTap),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 13,
                    ),
                    child: Row(
                      children: [
                        Icon(items[i].icon, size: 20, color: c.ink),
                        const SizedBox(width: SureSpace.x3),
                        Expanded(
                          child: Text(
                            items[i].label,
                            style: SureText.body3(SureTypography.medium)
                                .copyWith(color: c.ink),
                          ),
                        ),
                        if (items[i].badge != null) ...[
                          StatusBadge(label: items[i].badge!, color: 'primary'),
                          const SizedBox(width: SureSpace.x2),
                        ],
                        Icon(
                          LucideIcons.chevronRight,
                          size: 16,
                          color: c.inkFaded,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Design system `RepairListCard`: 52 pt tile, body-3 bold device with the
/// state badge, caption-1 issue and meta lines.
class RepairListCard extends StatelessWidget {
  const RepairListCard({
    super.key,
    required this.device,
    required this.issue,
    required this.meta,
    required this.badgeLabel,
    required this.badgeColor,
    this.onTap,
  });

  final String device;
  final String issue;
  final String meta;
  final String badgeLabel;

  /// A `statusColors` key.
  final String badgeColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return _CardShell(
      onTap: onTap,
      semanticLabel: '$device, $badgeLabel. $issue. $meta',
      child: ExcludeSemantics(
        child: Row(
          children: [
            // Prototype: an `Image` tile (neutral-faded placeholder).
            const IconTile(icon: LucideIcons.wrench, size: 52, muted: true),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          device,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: SureText.body3(SureTypography.bold)
                              .copyWith(color: c.ink),
                        ),
                      ),
                      const SizedBox(width: SureSpace.x2),
                      StatusBadge(label: badgeLabel, color: badgeColor),
                    ],
                  ),
                  Text(
                    issue,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
                  Text(
                    meta,
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Design system `TechVaultListCard`: shield tile, plan, device and expiry.
/// Active plans sit on neon-faded with a neon tile; expired ones are
/// outlined and muted.
class TechVaultListCard extends StatelessWidget {
  const TechVaultListCard({
    super.key,
    required this.plan,
    required this.device,
    required this.expiry,
    required this.active,
    this.selected = false,
    this.onTap,
  });

  final String plan;
  final String device;
  final String expiry;
  final bool active;

  /// Shown in the detail pane (two-pane layouts).
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Stack(
      children: [
        _CardShell(
          onTap: onTap,
          fill: active ? c.primaryFaded : null,
          border: !active,
          semanticLabel: '$plan, $device, $expiry',
          child: ExcludeSemantics(
            child: Row(
              children: [
                IconTile(
                  icon: LucideIcons.shieldCheck,
                  solid: active,
                  muted: !active,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan,
                        style: SureText.body3(SureTypography.bold)
                            .copyWith(color: c.ink),
                      ),
                      Text(
                        device,
                        style: SureText.caption1().copyWith(color: c.inkFaded),
                      ),
                      Text(
                        expiry,
                        style: SureText.caption1(
                          active
                              ? SureTypography.medium
                              : SureTypography.regular,
                        ).copyWith(color: active ? c.primaryInk : c.inkFaded),
                      ),
                    ],
                  ),
                ),
                if (onTap != null)
                  Icon(LucideIcons.chevronRight, size: 18, color: c.inkFaded),
              ],
            ),
          ),
        ),
        if (selected)
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: SureRadius.all(SureRadius.large),
                  border: Border.all(color: c.borderPrimary, width: 1.5),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Design system `StoreList`: body-3 bold name, caption-1 address, Open /
/// Closed badge with the distance, primary map pin.
class StoreListRow extends StatelessWidget {
  const StoreListRow({
    super.key,
    required this.name,
    required this.address,
    required this.open,
    this.distance,
    this.hours,
    this.selected = false,
    this.onTap,
  });

  final String name;
  final String address;
  final bool open;
  final String? distance;
  final String? hours;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final state = open ? 'Open' : 'Closed';
    return _CardShell(
      onTap: onTap,
      fill: selected ? c.primaryFaded : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      semanticLabel: [name, address, state, ?hours, ?distance].join(', '),
      child: ExcludeSemantics(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: SureText.body3(SureTypography.bold)
                        .copyWith(color: c.ink),
                  ),
                  if (address.isNotEmpty)
                    Text(
                      address,
                      style: SureText.caption1().copyWith(color: c.inkFaded),
                    ),
                  const SizedBox(height: SureSpace.x1),
                  Wrap(
                    spacing: SureSpace.x2,
                    runSpacing: SureSpace.x1,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      StatusBadge(
                        label: state,
                        color: open ? 'positive' : 'critical',
                      ),
                      for (final t in [?hours, ?distance])
                        Text(
                          t,
                          style: SureText.caption1().copyWith(
                            color: c.inkFaded,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: SureSpace.x3),
            Icon(LucideIcons.mapPin, size: 18, color: c.primaryInk),
          ],
        ),
      ),
    );
  }
}

/// Design system `MapBox` without map imagery: striped tile, centered pin,
/// label chip bottom-left. No live map in this release.
class MapBox extends StatelessWidget {
  const MapBox({super.key, this.height = 200, this.label});

  final double height;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: label == null ? 'Map' : 'Map: $label',
      excludeSemantics: true,
      child: ClipRRect(
        borderRadius: SureRadius.all(SureRadius.large),
        child: SizedBox(
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // The prototype's stripes are literal colours: light in dark too.
              CustomPaint(painter: _StripePainter(_mapStripeA, _mapStripeB)),
              Center(
                child: Transform.translate(
                  offset: const Offset(0, -10),
                  // Prototype: a solid dark-green pin.
                  child: Icon(
                    Icons.location_on_rounded,
                    size: 36,
                    color: SureBrand.darkGreen,
                  ),
                ),
              ),
              if (label != null)
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.95),
                        borderRadius: SureRadius.all(SureRadius.pill),
                      ),
                      child: Text(
                        label!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: SureTypography.style(
                          size: 11,
                          height: 14 / 11,
                          weight: SureTypography.bold,
                        ).copyWith(color: SureColors.light.ink),
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

/// MapBox stripes: `rgb(230,237,243)` / `rgb(216,225,238)`.
const _mapStripeA = Color(0xFFE6EDF3);
const _mapStripeB = Color(0xFFD8E1EE);

class _StripePainter extends CustomPainter {
  _StripePainter(this.a, this.b);

  final Color a;
  final Color b;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = a);
    final paint = Paint()
      ..color = b
      ..strokeWidth = 12;
    const step = 24.0;
    for (var x = -size.height; x < size.width; x += step) {
      canvas.drawLine(
        Offset(x, size.height),
        Offset(x + size.height, 0),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_StripePainter old) => old.a != a || old.b != b;
}

/// Design system `TextArea` (outline): radius 12, 1 pt neutral border
/// (critical on error), 14/20 text.
class SureTextArea extends StatelessWidget {
  const SureTextArea({
    super.key,
    required this.controller,
    this.placeholder,
    this.minLines = 4,
    this.maxLength,
    this.error = false,
    this.enabled = true,
    this.onChanged,
    this.semanticLabel,
  });

  final TextEditingController controller;
  final String? placeholder;
  final int minLines;
  final int? maxLength;
  final bool error;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final border = OutlineInputBorder(
      borderRadius: SureRadius.all(SureRadius.medium),
      borderSide: BorderSide(color: error ? c.critical : c.border),
    );
    return Semantics(
      label: semanticLabel,
      child: TextField(
        controller: controller,
        enabled: enabled,
        minLines: minLines,
        maxLines: null,
        maxLength: maxLength,
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        onChanged: onChanged,
        cursorColor: c.primaryInk,
        style: SureText.body3().copyWith(color: c.ink),
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: c.raised,
          hintText: placeholder,
          hintStyle: SureText.body3().copyWith(color: c.inkFaded),
          counterStyle: SureText.caption1().copyWith(color: c.inkFaded),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          disabledBorder: border,
          errorBorder: border,
          focusedErrorBorder: border,
        ),
      ),
    );
  }
}

/// Label / value line in detail sheets.
class DetailRow extends StatelessWidget {
  const DetailRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: SureText.caption1().copyWith(color: c.inkFaded),
            ),
          ),
          const SizedBox(width: SureSpace.x3),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: SureText.body3(SureTypography.medium)
                  .copyWith(color: c.ink),
            ),
          ),
        ],
      ),
    );
  }
}
