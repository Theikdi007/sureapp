import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sure_image.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../data/rewards_dtos.dart';

final _grouped = NumberFormat('#,##0', 'en_US');

/// `12,450`.
String fmtPoints(num v) => _grouped.format(v);

/// `1 Point` / `3,000 Points`.
String pointsLabel(int v) => '${fmtPoints(v)} ${v == 1 ? 'Point' : 'Points'}';

/// The SureStore points coin.
class PointsCoin extends StatelessWidget {
  const PointsCoin({super.key, this.size = 14});

  final double size;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/points_coin.svg',
    width: size,
    height: size,
    excludeFromSemantics: true,
  );
}

/// Coin + "3,000 Points" in amber 750.
class PointsCost extends StatelessWidget {
  const PointsCost({super.key, required this.cost, this.size = 13});

  final int cost;
  final double size;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      PointsCoin(size: size + 1),
      const SizedBox(width: 5),
      Text(
        pointsLabel(cost),
        style: SureTypography.style(
          size: size,
          weight: SureTypography.bold,
          color: context.colors.points,
        ),
      ),
    ],
  );
}

/// How a reward card is drawn: tint, accent, the hero lines and icon.
/// The API has no artwork beyond `imageUrl`, so the prototype's tints come
/// from the kind (and, for coupons, the partner).
class RewardLook {
  const RewardLook({
    required this.tint,
    required this.accent,
    required this.top,
    required this.main,
    this.icon,
  });

  factory RewardLook.of(BuildContext context, RewardCardDto r) {
    final c = context.colors;
    switch (r.kind) {
      case 'coupon':
        final palette = [
          (c.primaryFaded, c.primaryInk),
          (c.pointsFaded, c.pointsInk),
          (c.mintFaded, c.mintInk),
        ];
        final p =
            palette[(r.partner ?? r.title).codeUnits.fold<int>(
                  0,
                  (h, u) => (h * 35 + u) & 0x7fffffff,
                ) %
                palette.length];
        return RewardLook(
          tint: p.$1,
          accent: p.$2,
          top: (r.partner ?? 'SureStore').toUpperCase(),
          main: r.benefit ?? '',
        );
      case 'engraving':
        return RewardLook(
          tint: c.primaryFaded,
          accent: c.primaryInk,
          top: 'ENGRAVING',
          main: '',
          icon: LucideIcons.penTool,
        );
      default:
        return RewardLook(
          tint: c.keypad,
          accent: c.ink,
          top: 'SURESTORE',
          main: '',
          icon: LucideIcons.package,
        );
    }
  }

  final Color tint;
  final Color accent;
  final String top;
  final String main;
  final IconData? icon;
}

/// Claimed · Featured · Birthday · "N left" pills.
class RewardBadges extends StatelessWidget {
  const RewardBadges({super.key, required this.reward, this.large = false});

  final RewardCardDto reward;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final r = reward;
    final pills = [
      if (r.claimed) ('Claimed', c.mintInk, Colors.white),
      if (r.featured) ('Featured', c.primary, c.onPrimary),
      if (r.birthday) ('Birthday', c.points, Colors.white),
      if (r.stockLeft != null)
        ('${r.stockLeft} left', c.critical, Colors.white),
    ];
    return Wrap(
      spacing: large ? 6 : 4,
      runSpacing: 4,
      children: [
        for (final (label, bg, fg) in pills)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: large ? 9 : 7,
              vertical: large ? 4 : 3,
            ),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: SureRadius.all(SureRadius.pill),
            ),
            child: Text(
              label.toUpperCase(),
              style: SureTypography.style(
                size: large ? 10 : 9,
                weight: SureTypography.bold,
                letterSpacing: (large ? 10 : 9) * 0.04,
                color: fg,
                height: 1.2,
              ),
            ),
          ),
      ],
    );
  }
}

/// The tinted hero of a card: image, or icon / partner / benefit lines.
class RewardHero extends StatelessWidget {
  const RewardHero({
    super.key,
    required this.reward,
    required this.height,
    this.topSize = 10,
    this.mainSize = 20,
    this.iconSize = 26,
    this.alignStart = false,
    this.badgesRight = false,
    this.largeBadges = false,
    this.radius,
    this.gap = 2,
    this.topTracking = 0.08,
    this.alwaysShowTop = false,
    this.detail = false,
  });

  final RewardCardDto reward;
  final double height;
  final double topSize;
  final double mainSize;
  final double iconSize;
  final bool alignStart;
  final bool badgesRight;
  final bool largeBadges;
  final BorderRadius? radius;

  /// Space between the hero lines (prototype: 2 on cards, 4 on detail).
  final double gap;

  /// Letter spacing of the top line, in em.
  final double topTracking;

  /// Featured cards show the top line under the icon too.
  final bool alwaysShowTop;

  /// Reward Detail hero: kind-specific top line plus a grey sub line.
  final bool detail;

  @override
  Widget build(BuildContext context) {
    final look = RewardLook.of(context, reward);
    final top = !detail
        ? look.top
        : switch (reward.kind) {
            'coupon' => look.top,
            'engraving' => 'LASER ENGRAVING',
            _ => 'SPECIAL SALE',
          };
    final sub = !detail
        ? null
        : switch (reward.kind) {
            'coupon' => 'DISCOUNT COUPON',
            'engraving' => 'IN-STORE SERVICE',
            _ =>
              reward.methods.contains('delivery')
                  ? 'COLLECT OR DELIVERY'
                  : 'COLLECT IN STORE',
          };
    final lines = <Widget>[
      if (reward.imageUrl == null && look.icon != null)
        Icon(look.icon, size: iconSize, color: look.accent),
      if (top.isNotEmpty &&
          (detail ||
              alwaysShowTop ||
              look.main.isNotEmpty ||
              look.icon == null))
        Text(
          top,
          style: SureTypography.style(
            size: topSize,
            weight: SureTypography.bold,
            letterSpacing: topSize * topTracking,
            color: look.accent,
          ),
        ),
      if (look.main.isNotEmpty)
        Text(
          look.main,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: SureTypography.style(
            size: mainSize,
            weight: SureTypography.bold,
            height: 1.1,
            color: look.accent,
          ),
        ),
      if (sub != null)
        Text(
          sub,
          style: SureTypography.style(
            size: 10,
            weight: SureTypography.medium,
            letterSpacing: 0.8,
            color: context.colors.inkFaded,
          ),
        ),
    ];
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Container(
        height: height,
        color: look.tint,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (reward.imageUrl != null)
              SureImage(reward.imageUrl, fit: BoxFit.cover)
            else
              Padding(
                padding: EdgeInsets.symmetric(horizontal: alignStart ? 16 : 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: alignStart
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  spacing: gap,
                  children: lines,
                ),
              ),
            Positioned(
              top: largeBadges ? 12 : (badgesRight ? 10 : 8),
              left: badgesRight ? null : (largeBadges ? 12 : 8),
              right: badgesRight ? 10 : null,
              child: RewardBadges(reward: reward, large: largeBadges),
            ),
          ],
        ),
      ),
    );
  }
}

/// Card shell: white, radius 16, faded border, scales on press.
class _CardShell extends StatelessWidget {
  const _CardShell({
    required this.width,
    required this.onTap,
    required this.label,
    required this.child,
  });

  final double width;
  final VoidCallback onTap;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) => PressScale(
    scale: 0.97,
    semanticLabel: label,
    onTap: onTap,
    child: Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(color: context.colors.boxBorderFaded),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    ),
  );
}

String _semantics(RewardCardDto r) =>
    '${r.title}, ${pointsLabel(r.cost)}'
    '${r.claimed ? ', claimed' : ''}';

/// Featured Picks (168 wide, 96 hero) and Special Sales / Engraving
/// (170 wide, 120 hero) cards.
class RewardTile extends StatelessWidget {
  const RewardTile({
    super.key,
    required this.reward,
    required this.onTap,
    this.featured = false,
  });

  final RewardCardDto reward;
  final VoidCallback onTap;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return _CardShell(
      width: featured ? 168 : 170,
      onTap: onTap,
      label: _semantics(reward),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RewardHero(
            reward: reward,
            height: featured ? 96 : 120,
            // Featured Picks: 0.06 em top line, shown under the icon too.
            topTracking: featured ? 0.06 : 0.08,
            alwaysShowTop: featured,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                SizedBox(
                  height: 34,
                  child: Text(
                    reward.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: SureTypography.style(
                      size: 13,
                      height: 17 / 13,
                      weight: SureTypography.medium,
                      color: c.ink,
                    ),
                  ),
                ),
                PointsCost(cost: reward.cost),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Discount Coupons ticket card (230 wide, 110 hero, dashed tear line
/// with notches).
class CouponTicket extends StatelessWidget {
  const CouponTicket({super.key, required this.reward, required this.onTap});

  final RewardCardDto reward;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return _CardShell(
      width: 230,
      onTap: onTap,
      label: _semantics(reward),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RewardHero(
            reward: reward,
            height: 110,
            mainSize: 26,
            alignStart: true,
            badgesRight: true,
          ),
          SizedBox(
            height: 1.5,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: CustomPaint(painter: _DashPainter(c.boxBorder)),
                ),
                for (final left in [true, false])
                  Positioned(
                    left: left ? -8 : null,
                    right: left ? null : -8,
                    top: -8,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: c.page,
                        shape: BoxShape.circle,
                        border: Border.all(color: c.boxBorderFaded),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  reward.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: SureTypography.style(
                    size: 14,
                    height: 18 / 14,
                    weight: SureTypography.medium,
                    color: c.ink,
                  ),
                ),
                PointsCost(cost: reward.cost),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashPainter extends CustomPainter {
  _DashPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..strokeWidth = size.height;
    for (double x = 0; x < size.width; x += 7) {
      canvas.drawLine(
        Offset(x, size.height / 2),
        Offset(x + 4, size.height / 2),
        p,
      );
    }
  }

  @override
  bool shouldRepaint(_DashPainter old) => old.color != color;
}

/// Horizontal rail that bleeds to the screen edges (prototype `margin:0
/// -20px; padding:12px 20px 6px`).
class RewardRail extends StatelessWidget {
  const RewardRail({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.fromLTRB(20, 12, 20, 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: children,
    ),
  );
}

/// Rail header + cards, or an empty line when the row has none.
class RewardSection extends StatelessWidget {
  const RewardSection({
    super.key,
    required this.title,
    required this.description,
    required this.children,
  });

  final String title;
  final String description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SectionHeader(title: title, description: description),
      ),
      if (children.isEmpty)
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Text(
            'Nothing here right now',
            style: SureText.caption1().copyWith(color: context.colors.inkFaded),
          ),
        )
      else
        RewardRail(children: children),
    ],
  );
}
