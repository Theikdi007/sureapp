import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../loyalty/data/loyalty_repository.dart';
import '../data/rewards_dtos.dart';
import '../data/rewards_repository.dart';

part 'member_coupons_screen.g.dart';

@riverpod
Future<List<MemberBenefitDto>> memberBenefits(Ref ref) async =>
    (await ref.watch(rewardsRepositoryProvider).memberBenefits()).items;

/// Prototype "MEMBER COUPONS": tier coupon codes
/// (`GET rewards/member-benefits`). There's no claim call for these, so
/// the pill copies the code.
class MemberCouponsScreen extends ConsumerStatefulWidget {
  const MemberCouponsScreen({super.key});

  @override
  ConsumerState<MemberCouponsScreen> createState() =>
      _MemberCouponsScreenState();
}

class _MemberCouponsScreenState extends ConsumerState<MemberCouponsScreen> {
  final _copied = <String>{};

  @override
  Widget build(BuildContext context) {
    final v = ref.watch(memberBenefitsProvider);
    final tier = ref.watch(loyaltySummaryProvider).value?.tierLabel;
    return PageScaffold(
      title: 'Member Coupons',
      subtitle: tier == null ? null : '$tier member rewards',
      onRefresh: () async {
        ref.invalidate(memberBenefitsProvider);
        await ref.read(memberBenefitsProvider.future);
      },
      slivers: [
        switch (v) {
          AsyncData(:final value) when value.isEmpty =>
            const SliverToBoxAdapter(
              child: EmptyState(
                icon: LucideIcons.ticket,
                title: 'No member coupons yet',
                description: 'Coupons for your tier will show up here',
              ),
            ),
          AsyncData(:final value) => SliverPadding(
            // Prototype gap 14 under the header (the header row leaves 4).
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            sliver: SliverList.separated(
              itemCount: value.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, i) => CouponRow(
                benefit: value[i],
                applied: _copied.contains(value[i].id),
                onApply: value[i].code == null
                    ? null
                    : () {
                        Clipboard.setData(ClipboardData(text: value[i].code!));
                        setState(() => _copied.add(value[i].id));
                        SureToast.show(
                          context,
                          'Coupon ${value[i].code} copied — use it at checkout',
                          icon: LucideIcons.ticket,
                          color: SureToastColor.positive,
                        );
                      },
              ),
            ),
          ),
          AsyncError(:final error) when !v.isLoading => SliverToBoxAdapter(
            child: EmptyState(
              icon: LucideIcons.wifiOff,
              title: "Couldn't load your coupons",
              description: error is ApiException ? error.userMessage : null,
              action: SureLink(
                'Try again',
                onTap: () => ref.invalidate(memberBenefitsProvider),
              ),
            ),
          ),
          _ => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Center(
                child: SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: context.colors.primaryInk,
                  ),
                ),
              ),
            ),
          ),
        },
      ],
    );
  }
}

/// Design system `Coupons`: neon "%" tile, title, condition, monospace
/// code, pill on the right (primary when applied).
class CouponRow extends StatelessWidget {
  const CouponRow({
    super.key,
    required this.benefit,
    required this.applied,
    required this.onApply,
  });

  final MemberBenefitDto benefit;
  final bool applied;
  final VoidCallback? onApply;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final b = benefit;
    final condition = [?b.partner, ?b.instruction].join(' · ');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: applied ? c.primaryFaded : c.raised,
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(
          width: 1.5,
          color: applied ? c.borderPrimary : c.borderFaded,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: c.primary,
              borderRadius: SureRadius.all(10),
            ),
            child: Text(
              '%',
              style: SureTypography.style(
                size: 13,
                weight: SureTypography.black,
                color: c.onPrimary,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  b.title,
                  style: SureText.body3(SureTypography.bold)
                      .copyWith(color: c.ink),
                ),
                if (condition.isNotEmpty)
                  Text(
                    condition,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
                if (b.code != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      b.code!,
                      style: SureText.caption1().copyWith(
                        color: c.primaryInk,
                        fontFamily: 'Courier',
                        fontFamilyFallback: const ['monospace', 'Menlo'],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (onApply != null) ...[
            const SizedBox(width: 8),
            PressScale(
              scale: 0.95,
              semanticLabel: applied
                  ? 'Copied ${b.code}'
                  : 'Copy code ${b.code}',
              onTap: onApply,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: applied ? c.primary : c.primaryFaded,
                  borderRadius: SureRadius.all(SureRadius.pill),
                ),
                child: Text(
                  applied ? 'Copied' : 'Copy',
                  style: SureTypography.style(
                    size: 13,
                    weight: SureTypography.bold,
                    color: applied ? c.onPrimary : c.primaryInk,
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
