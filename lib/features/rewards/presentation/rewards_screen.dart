import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../data/rewards_dtos.dart';
import '../data/rewards_repository.dart';
import 'reward_widgets.dart';

part 'rewards_screen.g.dart';

@riverpod
Future<RewardsHomeDto> rewardsHome(Ref ref) =>
    ref.watch(rewardsRepositoryProvider).home();

/// Rewards tab (prototype "REWARDS HUB"). `GET rewards/home`.
class RewardsScreen extends ConsumerWidget {
  const RewardsScreen({super.key});

  static const _descriptions = {
    'coupon': 'Partner discounts for your points',
    'goods': 'Gear you can claim with points',
    'engraving': 'Personalise your gear at the counter',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(rewardsHomeProvider);
    final mq = MediaQuery.of(context);
    Future<void> refresh() async {
      ref.invalidate(rewardsHomeProvider);
      await ref.read(rewardsHomeProvider.future);
    }

    void open(RewardCardDto r) => context.push(AppRoutes.reward(r.id));

    final Widget body = switch (v) {
      AsyncData(:final value) => ListView(
        padding: EdgeInsets.only(bottom: mq.padding.bottom + 60),
        children: [
          _PointsHero(home: value),
          const SizedBox(height: 20),
          if (value.featured.isNotEmpty) ...[
            RewardSection(
              title: 'Featured Picks',
              description: 'Picked for you this month',
              children: [
                for (final r in value.featured)
                  RewardTile(reward: r, featured: true, onTap: () => open(r)),
              ],
            ),
            const SizedBox(height: 20),
          ],
          if (_birthdayReward(value) case final b?) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _BirthdayBanner(
                reward: b,
                unlocked: value.birthdayToday,
                onTap: () => open(b),
              ),
            ),
            const SizedBox(height: 20),
          ],
          for (final s in value.sections) ...[
            RewardSection(
              title: s.title,
              description: _descriptions[s.key] ?? '',
              children: [
                for (final r in s.items)
                  s.key == 'coupon'
                      ? CouponTicket(reward: r, onTap: () => open(r))
                      : RewardTile(reward: r, onTap: () => open(r)),
              ],
            ),
            const SizedBox(height: 20),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _MemberCouponsRow(),
          ),
        ],
      ),
      AsyncError(:final error) when !v.isLoading => ListView(
        children: [
          SizedBox(height: mq.padding.top + 80),
          EmptyState(
            icon: LucideIcons.wifiOff,
            title: "Couldn't load rewards",
            description: error is ApiException ? error.userMessage : null,
            action: SureLink(
              'Try again',
              onTap: () => ref.invalidate(rewardsHomeProvider),
            ),
          ),
        ],
      ),
      _ => Center(
        child: SizedBox.square(
          dimension: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: context.colors.primaryInk,
          ),
        ),
      ),
    };

    final dark = v.hasValue;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // White status bar text over the dark points hero.
      value: AppTheme.statusBar(
        dark ? Brightness.dark : Theme.of(context).brightness,
      ),
      child: Scaffold(
        backgroundColor: context.colors.page,
        body: RefreshIndicator(
          color: context.colors.primaryInk,
          edgeOffset: mq.padding.top,
          onRefresh: () => refreshQuietly(refresh),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: body,
            ),
          ),
        ),
      ),
    );
  }

  static RewardCardDto? _birthdayReward(RewardsHomeDto h) {
    for (final r in [...h.featured, for (final s in h.sections) ...s.items]) {
      if (r.birthday) return r;
    }
    return null;
  }
}

/// Dark hero: coin, balance, "Point Detail", expiry line and the redeem
/// banner (opens Tier Benefits).
class _PointsHero extends StatelessWidget {
  const _PointsHero({required this.home});

  final RewardsHomeDto home;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final top = MediaQuery.paddingOf(context).top;
    final expiry = home.expiringPoints != null && home.expiringOn != null
        ? '${fmtPoints(home.expiringPoints!)} points expiring on '
              '${MyanmarTime.format('${home.expiringOn!}T00:00:00Z', pattern: 'd MMM y')}'
        : null;
    return Container(
      color: c.hero,
      // Prototype 68 = 56 status area + 12.
      padding: EdgeInsets.fromLTRB(20, top + 12, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const PointsCoin(size: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: fmtPoints(home.points),
                        style: SureTypography.style(
                          size: 30,
                          weight: SureTypography.heavy,
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: '  Points',
                        style: SureTypography.style(
                          size: 15,
                          weight: SureTypography.medium,
                          color: c.onHeroFaded,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PressScale(
                scale: 0.96,
                semanticLabel: 'Point Detail',
                onTap: () => context.push(AppRoutes.points),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: SureRadius.all(SureRadius.pill),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    'Point Detail',
                    style: SureTypography.style(
                      size: 13,
                      weight: SureTypography.medium,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (expiry != null)
            Padding(
              padding: const EdgeInsets.only(left: 52, top: 8),
              child: Text(
                expiry,
                style: SureTypography.style(size: 12, color: c.onHeroFaded),
              ),
            ),
          const SizedBox(height: 12),
          PressScale(
            scale: 0.985,
            semanticLabel: 'Tier benefits',
            onTap: () => context.push(AppRoutes.tiers),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: SureRadius.all(SureRadius.large),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.gift, size: 20, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Redeem your points for coupons, gear and services at any SureStore location',
                      style: SureTypography.style(
                        size: 13,
                        height: 1.45,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    LucideIcons.chevronRight,
                    size: 16,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BirthdayBanner extends StatelessWidget {
  const _BirthdayBanner({
    required this.reward,
    required this.unlocked,
    required this.onTap,
  });

  final RewardCardDto reward;
  final bool unlocked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PressScale(
      scale: 0.985,
      semanticLabel: 'Birthday treat, ${reward.title}',
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: c.pointsFaded,
          borderRadius: SureRadius.all(SureRadius.large),
        ),
        child: Row(
          children: [
            Icon(LucideIcons.cake, size: 22, color: c.points),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Birthday treat',
                    style: SureTypography.style(
                      size: 13,
                      weight: SureTypography.bold,
                      color: c.pointsInk,
                    ),
                  ),
                  Text(
                    '${reward.title} — free claim in your birthday month',
                    style: SureTypography.style(
                      size: 12,
                      color: c.pointsInk.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: unlocked ? c.mintFaded : c.raised,
                borderRadius: SureRadius.all(SureRadius.pill),
              ),
              child: Text(
                (unlocked ? 'Unlocked' : 'Birthday month').toUpperCase(),
                style: SureTypography.style(
                  size: 10,
                  weight: SureTypography.bold,
                  letterSpacing: 0.4,
                  color: unlocked ? c.mintInk : c.pointsInk,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemberCouponsRow extends StatelessWidget {
  const _MemberCouponsRow();

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PressScale(
      scale: 0.985,
      semanticLabel: 'Member coupon codes',
      onTap: () => context.push(AppRoutes.memberCoupons),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: SureRadius.all(SureRadius.large),
          border: Border.all(color: c.boxBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: c.primaryFaded,
                borderRadius: SureRadius.all(SureRadius.medium),
              ),
              child: Icon(LucideIcons.ticket, size: 20, color: c.primaryInk),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Member coupon codes',
                    style: SureTypography.style(
                      size: 14,
                      weight: SureTypography.bold,
                      color: c.ink,
                    ),
                  ),
                  Text(
                    'Tier coupons like SURE10 for your orders',
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
                ],
              ),
            ),
            Icon(LucideIcons.chevronRight, size: 16, color: c.inkFaded),
          ],
        ),
      ),
    );
  }
}
