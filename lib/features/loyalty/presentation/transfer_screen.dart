import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
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
import 'loyalty_widgets.dart';
import 'points_screen.dart';

/// Prototype "TRANSFER". `POST loyalty/transfers/preview` checks the
/// recipient, a confirm sheet shows who gets the points, then
/// `POST loyalty/transfers` (Idempotency-Key).
class TransferScreen extends ConsumerStatefulWidget {
  const TransferScreen({super.key});

  @override
  ConsumerState<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends ConsumerState<TransferScreen> {
  final _phone = TextEditingController();
  final _amount = TextEditingController();
  bool _checking = false;

  static const _chips = [500, 1000, 2500, 5000];

  @override
  void initState() {
    super.initState();
    _phone.addListener(() => setState(() {}));
    _amount.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _phone.dispose();
    _amount.dispose();
    super.dispose();
  }

  int get _amt => int.tryParse(_amount.text.replaceAll(',', '')) ?? 0;

  Future<void> _continue() async {
    if (_phone.text.replaceAll(RegExp(r'\D'), '').length < 7) {
      SureToast.show(
        context,
        'Enter a valid phone number',
        icon: LucideIcons.phone,
        color: SureToastColor.critical,
      );
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() => _checking = true);
    TransferPreviewDto preview;
    try {
      preview = await ref
          .read(loyaltyRepositoryProvider)
          .transferPreview(phone: _phone.text.trim(), amount: _amt);
    } on Object catch (e) {
      if (mounted) showApiError(context, e);
      return;
    } finally {
      if (mounted) setState(() => _checking = false);
    }
    if (!mounted) return;
    final sent = await showSureSheet<TransferResultDto>(
      context,
      title: 'Send points?',
      builder: (_) =>
          _ConfirmTransfer(phone: _phone.text.trim(), preview: preview),
    );
    if (sent == null || !mounted) return;
    ref
      ..invalidate(loyaltySummaryProvider)
      ..invalidate(pointsHistoryProvider(false));
    SureToast.show(
      context,
      'Transferred ${fmtPoints(sent.amount)} points to ${sent.recipientName}',
      icon: LucideIcons.circleCheck,
      color: SureToastColor.positive,
    );
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final balance = ref.watch(loyaltySummaryProvider).value?.points;
    final over = balance != null && _amt > balance;
    final invalid = _amt <= 0 || over;
    return PageScaffold(
      title: 'Transfer Points',
      subtitle: 'Send points to another member',
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.list(
            children: [
              // Prototype gap 18 under the header (the header row leaves 4).
              const SizedBox(height: 14),
              DataDisplay(
                label: 'Available Balance',
                value: balance == null ? '—' : '${fmtPoints(balance)} pts',
              ),
              const SizedBox(height: 18),
              SureTextField(
                controller: _phone,
                placeholder: 'Enter phone number',
                startIcon: LucideIcons.phone,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.telephoneNumber],
                semanticLabel: "Recipient's phone number",
              ),
              const SizedBox(height: 12),
              SureTextField(
                controller: _amount,
                placeholder: '1000',
                keyboardType: TextInputType.number,
                error: over,
                semanticLabel: 'Points to send',
              ),
              const SizedBox(height: 8),
              Text(
                over ? 'Exceeds balance' : '= MMK ${fmtPoints(_amt)}',
                textAlign: TextAlign.right,
                style: SureText.caption1().copyWith(
                  color: over ? c.critical : c.inkFaded,
                ),
              ),
              const SizedBox(height: 12),
              // Content-width chips, 8 apart (prototype); wraps with large
              // text.
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final n in _chips)
                    VariantButton(
                      label: fmtPoints(n),
                      selected: _amt == n,
                      onTap: () {
                        HapticFeedback.selectionClick();
                        _amount.text = '$n';
                      },
                    ),
                ],
              ),
              const SizedBox(height: 18),
              SureButton(
                label: 'Transfer',
                loading: _checking,
                onPressed: invalid ? null : _continue,
              ),
              const SizedBox(height: 18),
              Text(
                "Transferred points expire after 1 month for the recipient and don't count toward their Club Score.",
                style: SureTypography.style(
                  size: 11,
                  height: 1.5,
                  color: c.inkFaded,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ConfirmTransfer extends ConsumerStatefulWidget {
  const _ConfirmTransfer({required this.phone, required this.preview});

  final String phone;
  final TransferPreviewDto preview;

  @override
  ConsumerState<_ConfirmTransfer> createState() => _ConfirmTransferState();
}

class _ConfirmTransferState extends ConsumerState<_ConfirmTransfer> {
  final _note = TextEditingController();
  bool _sending = false;

  /// One key for this send, reused if it's retried after a timeout.
  final _key = IdempotencyKey.generate();

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    setState(() => _sending = true);
    try {
      final note = _note.text.trim();
      final r = await ref
          .read(loyaltyRepositoryProvider)
          .transfer(
            phone: widget.phone,
            amount: widget.preview.amount,
            note: note.isEmpty ? null : note,
            key: _key,
          );
      if (mounted) Navigator.of(context).pop(r);
    } on Object catch (e) {
      if (!mounted) return;
      showApiError(context, e);
      // The server answered: this send is over.
      if (e is ApiException && e.status != null) Navigator.of(context).pop();
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final p = widget.preview;
    Widget row(String label, String value) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(label, style: SureText.body3().copyWith(color: c.inkFaded)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: SureText.body3(SureTypography.medium)
                  .copyWith(color: c.ink),
            ),
          ),
        ],
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        row('To', p.recipientName),
        row('Phone', p.recipientPhoneDisplay),
        if (p.recipientTier != null) row('Tier', p.recipientTier!),
        row('Points', fmtPoints(p.amount)),
        row('Balance after', '${fmtPoints(p.balanceAfter)} pts'),
        const SizedBox(height: 4),
        SureTextField(
          controller: _note,
          placeholder: 'Add a message (optional)',
          startIcon: LucideIcons.messageSquare,
        ),
        if (p.note.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            p.note,
            style: SureTypography.style(
              size: 11,
              height: 1.5,
              color: c.inkFaded,
            ),
          ),
        ],
        const SizedBox(height: 16),
        SureButton(
          label: 'Send ${fmtPoints(p.amount)} points',
          loading: _sending,
          onPressed: _send,
        ),
      ],
    );
  }
}
