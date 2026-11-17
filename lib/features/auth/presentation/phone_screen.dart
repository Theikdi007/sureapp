import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/number_keypad.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_logo.dart';
import '../../../design_system/components/sure_text_field.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../data/auth_dtos.dart';
import '../data/auth_repository.dart';
import 'auth_providers.dart';
import 'widgets/auth_scaffold.dart';

/// Prototype "Login": logo, "Log in with your phone", the +95 number box,
/// Continue, terms, and the number pad (`POST auth/phone/check`).
class PhoneScreen extends ConsumerStatefulWidget {
  const PhoneScreen({super.key});

  @override
  ConsumerState<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends ConsumerState<PhoneScreen> {
  /// Digits after the leading 0 (the 9…), at most 10, like the prototype.
  String _digits = '';
  bool _loading = false;
  String? _error;

  static const _maxDigits = 10;
  static const _minDigits = 7;

  @override
  void initState() {
    super.initState();
    // Coming back from a later step: keep the number.
    final phone = ref.read(signInFlowProvider).phone;
    if (phone != null) _digits = phoneDigits(phone);
  }

  void _type(String d) {
    if (_loading || _digits.length >= _maxDigits) return;
    // The box already shows +95, so the trunk 0 of `09…` is not a digit:
    // counting it would cut off the number's last digit.
    if (_digits.isEmpty && d == '0') return;
    setState(() {
      _digits += d;
      _error = null;
    });
  }

  void _delete() {
    if (_loading || _digits.isEmpty) return;
    setState(() {
      _digits = _digits.substring(0, _digits.length - 1);
      _error = null;
    });
  }

  Future<void> _submit() async {
    if (_digits.length < _minDigits || _loading) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final result = await ref
          .read(authRepositoryProvider)
          .checkPhone('0$_digits');
      if (!mounted) return;
      ref.read(signInFlowProvider.notifier).phoneChecked(result);
      switch (result.status) {
        case PhoneCheckStatus.password:
          context.go(AppRoutes.loginPassword);
        case PhoneCheckStatus.otpSent:
          context.go(AppRoutes.loginOtp);
        case PhoneCheckStatus.unknown:
          setState(() => _error = 'Something went wrong. Try again.');
      }
    } on ApiException catch (e) {
      if (mounted) {
        setState(() => _error = e.fieldMessage('phone') ?? e.userMessage);
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return AuthScaffold(
      topPadding: 28,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: SureLogo(height: 44),
          ),
          const SizedBox(height: 28),
          Semantics(
            header: true,
            child: Text(
              'Log in with your phone',
              style: SureText.featured2().copyWith(color: c.ink),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "We'll send a one-time code to verify it's you",
            style: SureText.body3().copyWith(color: c.inkFaded),
          ),
          const SizedBox(height: SureSpace.x6),
          PhoneNumberBox(digits: _digits, error: _error != null),
          if (_error != null) ...[
            const SizedBox(height: SureSpace.x2),
            FieldError(_error),
          ],
          const SizedBox(height: 14),
          SureButton(
            label: 'Continue',
            loading: _loading,
            onPressed: _digits.length >= _minDigits ? _submit : null,
          ),
          const SizedBox(height: SureSpace.x3),
          Text(
            'By continuing you agree to the Sure Terms & Privacy Policy',
            textAlign: TextAlign.center,
            style: SureText.caption1().copyWith(color: c.inkFaded),
          ),
          const SizedBox(height: SureSpace.x6),
        ],
      ),
      bottom: NumberKeypad(
        enabled: !_loading,
        onDigit: _type,
        onDelete: _delete,
      ),
    );
  }
}

/// `09…`/`+959…` → the digits after the leading 0.
String phoneDigits(String phone) {
  var d = phone.replaceAll(RegExp(r'\D'), '');
  if (d.startsWith('95') && d.length > 10) d = d.substring(2);
  if (d.startsWith('0')) d = d.substring(1);
  return d.length > 10 ? d.substring(0, 10) : d;
}

/// `9 776 234 118` (prototype grouping: 1-3-3-3).
String groupPhoneDigits(String digits) {
  if (digits.isEmpty) return '';
  final m = RegExp(r'^(\d)(\d{0,3})(\d{0,3})(\d{0,3})').firstMatch(digits)!;
  return [for (var i = 1; i <= 4; i++) m.group(i)!]
      .where((g) => g.isNotEmpty)
      .join(' ');
}

/// The prototype's number box: `+95` | digits, with a primary-ink caret.
/// Radius 16, the prototype's literal 12 % black ring (`boxBorder`: near
/// invisible in dark mode, as in the prototype), 14/16 padding, 18 pt text.
class PhoneNumberBox extends StatelessWidget {
  const PhoneNumberBox({super.key, required this.digits, this.error = false});

  final String digits;
  final bool error;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final shown = digits.isEmpty ? '9 776 000 000' : groupPhoneDigits(digits);
    return Semantics(
      label: 'Mobile number',
      value: digits.isEmpty ? 'empty' : '+95 ${groupPhoneDigits(digits)}',
      textField: true,
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: c.raised,
          borderRadius: SureRadius.all(SureRadius.large),
          border: Border.all(color: error ? c.critical : c.boxBorder),
        ),
        child: Row(
          children: [
            Text(
              '+95',
              style: SureText.body1(SureTypography.bold)
                  .copyWith(color: c.ink, height: 22 / 18),
            ),
            const SizedBox(width: 10),
            Container(width: 1, height: 22, color: c.boxBorder),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                shown,
                maxLines: 1,
                style: SureText.body1(SureTypography.medium).copyWith(
                  height: 22 / 18,
                  letterSpacing: 0.5,
                  color: digits.isEmpty ? c.inkPlaceholder : c.ink,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(width: 2, height: 22, color: c.primaryInk),
          ],
        ),
      ),
    );
  }
}
