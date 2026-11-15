import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sure_image.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../rewards/presentation/reward_widgets.dart';
import '../data/loyalty_dtos.dart';
import '../data/loyalty_repository.dart';
import 'loyalty_widgets.dart';

part 'tier_benefits_screen.g.dart';

@riverpod
Future<TierBenefitsDto> tierBenefits(Ref ref) =>
    ref.watch(loyaltyRepositoryProvider).tiers();

/// Prototype "TIER BENEFITS". `GET loyalty/tiers`, `GET loyalty/summary`.
class TierBenefitsScreen extends ConsumerWidget {
  const TierBenefitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final summary = ref.watch(loyaltySummaryProvider);
    final tiers = ref.watch(tierBenefitsProvider);
    final s = summary.value;
    final t = tiers.value;
    final error = summary.error ?? tiers.error;
    final loading = s == null || t == null;

    return PageScaffold(
      title: 'Tier Benefits',
      onRefresh: () async {
        ref
          ..invalidate(loyaltySummaryProvider)
          ..invalidate(tierBenefitsProvider);
        await ref.read(tierBenefitsProvider.future);
      },
      slivers: [
        if (loading && error != null && !summary.isLoading && !tiers.isLoading)
          SliverToBoxAdapter(
            child: EmptyState(
              icon: LucideIcons.wifiOff,
              title: "Couldn't load your tier",
              description: error is ApiException ? error.userMessage : null,
              action: SureLink(
                'Try again',
                onTap: () => ref
                  ..invalidate(loyaltySummaryProvider)
                  ..invalidate(tierBenefitsProvider),
              ),
            ),
          )
        else if (loading)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 64),
              child: Center(child: CircularProgressIndicator(strokeWidth: 2.5)),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.list(
              children: [
                // Prototype: 20 gap under the header + the block's 8 top
                // padding (the pinned header row already leaves 4).
                const SizedBox(height: 24),
                Center(child: TierCoin(tier: s.tier, size: 72)),
                const SizedBox(height: 8),
                Text(
                  '${s.tierLabel} Member',
                  textAlign: TextAlign.center,
                  style: SureTypography.style(
                    size: 22,
                    weight: SureTypography.bold,
                    color: c.ink,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${fmtPoints(s.points)} Shopping Points',
                  textAlign: TextAlign.center,
                  style: SureTypography.style(size: 13, color: c.inkFaded),
                ),
                const SizedBox(height: 28),
                _ProgressCard(summary: s, tiers: t.tiers),
                const SizedBox(height: 20),
                if (t.currentBenefits.isNotEmpty) ...[
                  _ListCard(
                    children: [
                      for (final b in t.currentBenefits)
                        _BenefitRow(benefit: b),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
                if (t.earnRules.isNotEmpty) ...[
                  const SectionHeader(
                    title: 'How you earn',
                    size: SectionHeaderSize.small,
                  ),
                  const SizedBox(height: 12),
                  _ListCard(
                    children: [
                      for (final r in t.earnRules)
                        _Row(
                          leading: Icon(
                            LucideIcons.coins,
                            size: 20,
                            color: c.ink,
                          ),
                          title: r.condition,
                          subtitle:
                              '${pointsLabel(r.rewardPoints)} · ${fmtPoints(r.clubScore)} Club Score',
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.summary, required this.tiers});

  final LoyaltySummaryDto summary;
  final List<TierDto> tiers;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = summary;
    final next = s.nextTierLabel;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(color: c.boxBorder),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Text(
                  next != null ? 'Progress to $next' : 'Top club level reached',
                  style: SureText.body3(SureTypography.medium)
                      .copyWith(color: c.ink),
                ),
              ),
              Text(
                next != null && s.nextTierThreshold != null
                    ? '${fmtPoints(s.clubScore)} / ${fmtPoints(s.nextTierThreshold!)} Club Scores'
                    : '${fmtPoints(s.clubScore)} Club Scores',
                style: SureText.caption1().copyWith(color: c.inkFaded),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ProgressBar(percent: s.progressPercent),
          if (tiers.isNotEmpty) ...[
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (final t in tiers)
                  Opacity(
                    opacity: t.current || t.key == s.tier ? 1 : 0.38,
                    child: Column(
                      spacing: 4,
                      children: [
                        TierCoin(tier: t.key, size: 30),
                        Text(
                          t.label.toUpperCase(),
                          style: SureTypography.style(
                            size: 10,
                            weight: t.current || t.key == s.tier
                                ? SureTypography.bold
                                : SureTypography.medium,
                            letterSpacing: 0.5,
                            color: t.current || t.key == s.tier
                                ? c.primaryInk
                                : c.inkFaded,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _ListCard extends StatelessWidget {
  const _ListCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: SureRadius.all(SureRadius.large),
      border: Border.all(color: context.colors.boxBorder),
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) Divider(height: 1, color: context.colors.boxBorderFaded),
          children[i],
        ],
      ],
    ),
  );
}

class _Row extends StatelessWidget {
  const _Row({required this.leading, required this.title, this.subtitle});

  final Widget leading;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 12),
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
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitRow extends StatelessWidget {
  const _BenefitRow({required this.benefit});

  final BenefitDto benefit;

  static IconData iconFor(String title) {
    final t = title.toLowerCase();
    if (t.contains('earn')) return LucideIcons.coins;
    if (t.contains('limit') || t.contains('daily') || t.contains('usage')) {
      return LucideIcons.walletCards;
    }
    if (t.contains('scan')) return LucideIcons.scanQrCode;
    if (t.contains('partner') || t.contains('coupon')) {
      return LucideIcons.ticket;
    }
    if (t.contains('transfer')) return LucideIcons.arrowUpRight;
    if (t.contains('expir')) return LucideIcons.clock;
    return LucideIcons.gift;
  }

  @override
  Widget build(BuildContext context) {
    final b = benefit;
    return _Row(
      leading: b.photoUrl != null
          ? ClipRRect(
              borderRadius: SureRadius.all(6),
              child: SizedBox.square(
                dimension: 24,
                child: SureImage(b.photoUrl),
              ),
            )
          : Icon(iconFor(b.title), size: 20, color: context.colors.ink),
      title: b.title,
      subtitle: b.description,
    );
  }
}
