import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/number_keypad.dart';
import '../../../design_system/components/page_header.dart';
import '../../../design_system/components/sure_text_field.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../data/auth_repository.dart';
import 'auth_providers.dart';
import 'widgets/auth_scaffold.dart';

/// Prototype "Verify OTP": header, six code boxes, "Didn't receive a code?
/// Resend", number pad. Verifies 450 ms after the sixth digit
/// (`POST auth/otp/verify`).
class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  static const _length = 6;

  String _code = '';
  Timer? _ticker;
  Timer? _verifyDelay;
  int _resendIn = 0;
  bool _verifying = false;
  bool _resending = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _verifyDelay?.cancel();
    super.dispose();
  }

  /// The API asks to wait `resendAfterSeconds` before offering Resend.
  void _startCountdown() {
    final flow = ref.read(signInFlowProvider);
    final wait = flow.resendAfterSeconds ?? 0;
    final sentAt = flow.codeSentAt ?? DateTime.now();
    int left() => wait - DateTime.now().difference(sentAt).inSeconds;

    _ticker?.cancel();
    _resendIn = left().clamp(0, wait);
    if (_resendIn == 0) return;
    _ticker = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return t.cancel();
      final l = left();
      setState(() => _resendIn = l.clamp(0, wait));
      if (l <= 0) t.cancel();
    });
  }

  void _type(String d) {
    if (_verifying || _code.length >= _length) return;
    setState(() {
      _code += d;
      _error = null;
    });
    if (_code.length == _length) {
      _verifyDelay = Timer(const Duration(milliseconds: 450), _verify);
    }
  }

  void _delete() {
    if (_verifying || _code.isEmpty) return;
    _verifyDelay?.cancel();
    setState(() {
      _code = _code.substring(0, _code.length - 1);
      _error = null;
    });
  }

  Future<void> _verify() async {
    final flow = ref.read(signInFlowProvider);
    if (_verifying || !flow.awaitingCode || _code.length != _length) return;
    setState(() => _verifying = true);
    try {
      final ticket = await ref
          .read(authRepositoryProvider)
          .verifyOtp(phone: flow.phone!, purpose: flow.purpose!, code: _code);
      if (!mounted) return;
      ref.read(signInFlowProvider.notifier).verified(ticket);
      context.go(AppRoutes.loginCreatePassword);
    } on ApiException catch (e) {
      if (mounted) {
        setState(() {
          _error = e.userMessage;
          _code = '';
        });
      }
    } finally {
      if (mounted) setState(() => _verifying = false);
    }
  }

  Future<void> _resend() async {
    final flow = ref.read(signInFlowProvider);
    if (_resending || _resendIn > 0 || !flow.awaitingCode) return;
    setState(() {
      _resending = true;
      _error = null;
    });
    try {
      final sent = await ref
          .read(authRepositoryProvider)
          .sendOtp(phone: flow.phone!, purpose: flow.purpose!);
      if (!mounted) return;
      ref.read(signInFlowProvider.notifier).codeSent(sent);
      setState(() => _code = '');
      _startCountdown();
      SureToast.show(
        context,
        'A new code is on its way',
        icon: LucideIcons.messageCircle,
      );
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.userMessage);
    } finally {
      if (mounted) setState(() => _resending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final flow = ref.watch(signInFlowProvider);
    final canResend = _resendIn == 0 && !_resending;

    return AuthScaffold(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageHeader(
            subtitleMaxLines: 2,
            title: 'Verify your number',
            subtitle: 'Code sent to ${flow.phoneDisplay ?? ''}',
            onBack: () => context.go(AppRoutes.login),
          ),
          const SizedBox(height: 28),
          Semantics(
            label: 'Verification code',
            value: '${_code.length} of $_length digits entered',
            excludeSemantics: true,
            child: _CodeBoxes(length: _length, code: _code),
          ),
          if (_error != null) ...[
            const SizedBox(height: SureSpace.x3),
            Center(child: FieldError(_error)),
          ],
          const SizedBox(height: 18),
          Center(
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: SureTypography.fontFamily,
                  fontSize: 13,
                  color: c.inkFaded,
                ),
                children: [
                  const TextSpan(text: "Didn't receive a code? "),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: Semantics(
                      button: true,
                      enabled: canResend,
                      child: GestureDetector(
                        onTap: canResend ? _resend : null,
                        child: Text(
                          _resending
                              ? 'Sending…'
                              : _resendIn > 0
                              ? 'Resend in ${_resendIn}s'
                              : 'Resend',
                          style: TextStyle(
                            fontFamily: SureTypography.fontFamily,
                            fontSize: 13,
                            fontWeight: SureTypography.medium,
                            color: canResend ? c.primaryInk : c.inkFaded,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_verifying) ...[
            const SizedBox(height: SureSpace.x4),
            Center(
              child: SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  color: c.primaryInk,
                ),
              ),
            ),
          ],
          const SizedBox(height: SureSpace.x6),
        ],
      ),
      bottom: Padding(
        padding: const EdgeInsets.only(bottom: SureSpace.x4),
        child: NumberKeypad(
          enabled: !_verifying,
          onDigit: _type,
          onDelete: _delete,
        ),
      ),
    );
  }
}

/// Six 48×58 boxes, 10 apart, radius 14, 24/750 digits. Filled boxes are
/// `neon-faded`; the next box has a 2 pt dark-green ring, the rest the
/// prototype's literal 12 % black ring (`boxBorder`, faint in dark mode).
class _CodeBoxes extends StatelessWidget {
  const _CodeBoxes({required this.length, required this.code});

  final int length;
  final String code;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 48),
              child: AspectRatio(
                aspectRatio: 48 / 58,
                child: AnimatedContainer(
                  duration: SureMotion.fast,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: i < code.length ? c.primaryFaded : c.raised,
                    borderRadius: SureRadius.all(14),
                    border: i == code.length
                        ? Border.all(color: c.primaryInk, width: 2)
                        : Border.all(color: c.boxBorder),
                  ),
                  child: FittedBox(
                    child: Text(
                      i < code.length ? code[i] : '',
                      style: SureText.featured2().copyWith(color: c.ink),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
