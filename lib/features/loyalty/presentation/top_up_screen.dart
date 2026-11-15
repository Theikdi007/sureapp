import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/components/order_components.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_text_field.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../catalog/presentation/widgets/catalog_widgets.dart'
    show showApiError;
import '../../rewards/presentation/reward_widgets.dart';
import '../data/loyalty_dtos.dart';
import '../data/loyalty_repository.dart';
import 'points_screen.dart';

/// Top up with an iSure top-up / gift card code. Buying points with money
/// (the prototype's packages and QR/bank payment) isn't in this release.
/// `POST loyalty/topup-codes/check`, then `.../redeem` (Idempotency-Key).
class TopUpScreen extends ConsumerStatefulWidget {
  const TopUpScreen({super.key});

  @override
  ConsumerState<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends ConsumerState<TopUpScreen> {
  final _code = TextEditingController();
  TopupCodeDto? _checked;
  bool _busy = false;
  IdempotencyKey? _key;

  @override
  void initState() {
    super.initState();
    _code.addListener(() {
      // Editing the code drops the earlier check.
      if (_checked != null &&
          _checked!.code != _code.text.trim().toUpperCase()) {
        setState(() {
          _checked = null;
          _key = null;
        });
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  Future<void> _check() async {
    FocusScope.of(context).unfocus();
    setState(() => _busy = true);
    try {
      final r = await ref
          .read(loyaltyRepositoryProvider)
          .topupCheck(_code.text.trim());
      if (mounted) setState(() => _checked = r);
    } on Object catch (e) {
      if (mounted) showApiError(context, e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _redeem() async {
    final code = _checked?.code;
    if (code == null) return;
    _key ??= IdempotencyKey.generate();
    setState(() => _busy = true);
    try {
      final r = await ref
          .read(loyaltyRepositoryProvider)
          .topupRedeem(code, key: _key!);
      ref
        ..invalidate(loyaltySummaryProvider)
        ..invalidate(pointsHistoryProvider(false));
      if (!mounted) return;
      SureToast.show(
        context,
        'Added ${fmtPoints(r.points)} points to your balance',
        icon: LucideIcons.circleCheck,
        color: SureToastColor.positive,
      );
      Navigator.of(context).maybePop();
    } on Object catch (e) {
      if (e is ApiException && e.status != null) _key = null;
      if (mounted) showApiError(context, e);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final t = _checked;
    return PageScaffold(
      title: 'Top up or gift card',
      subtitle: 'Enter a top-up code',
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.list(
            children: [
              // Prototype gap 18 under the header (the header row leaves 4).
              const SizedBox(height: 14),
              InlineAlert(
                icon: LucideIcons.gift,
                text: 'Redeem an iSure top-up or gift card code. Buying points with money is coming later.',
              ),
              const SizedBox(height: 18),
              SureTextField(
                controller: _code,
                placeholder: 'e.g. SURE-7K2P-QX',
                code: true,
                startIcon: LucideIcons.ticket,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _code.text.trim().isEmpty ? null : _check(),
                semanticLabel: 'Top-up code',
              ),
              const SizedBox(height: 18),
              if (t != null) ...[
                OutlinedCard(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const PointsCoin(size: 40),
                      const SizedBox(height: 8),
                      Text(
                        '+${fmtPoints(t.points)}',
                        style: SureTypography.style(
                          size: 28,
                          height: 1,
                          weight: SureTypography.bold,
                          color: c.positive,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Shopping Points',
                        style: SureTypography.style(
                          size: 13,
                          color: c.inkFaded,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Divider(height: 1, color: c.borderFaded),
                      const SizedBox(height: 12),
                      _row(context, 'Code', t.code),
                      if (t.owner != null) _row(context, 'From', t.owner!),
                      if (t.pointsExpireOn != null)
                        _row(
                          context,
                          'Points expire',
                          MyanmarTime.format(
                            '${t.pointsExpireOn!}T00:00:00Z',
                            pattern: 'd MMM y',
                          ),
                        ),
                      if (t.terms case final terms? when terms.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            terms,
                            style: SureTypography.style(
                              size: 11,
                              height: 1.5,
                              color: c.inkFaded,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
              ],
              if (t?.redeemed ?? false)
                const InlineAlert(
                  icon: LucideIcons.circleAlert,
                  critical: true,
                  text: 'This code has already been used.',
                )
              else
                SureButton(
                  label: t == null
                      ? 'Check code'
                      : 'Redeem ${fmtPoints(t.points)} points',
                  loading: _busy,
                  onPressed: _code.text.trim().isEmpty
                      ? null
                      : (t == null ? _check : _redeem),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _row(BuildContext context, String label, String value) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(label, style: SureTypography.style(size: 13, color: c.inkFaded)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: SureTypography.style(
                size: 13,
                weight: SureTypography.medium,
                color: c.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
