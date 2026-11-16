import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/page_header.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_text_field.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../data/auth_dtos.dart';
import '../data/auth_repository.dart';
import 'auth_providers.dart';
import 'widgets/auth_scaffold.dart';

/// Prototype "Create Password" (signup, and reset after Forgot password):
/// two fields, live rule checklist, Create password (`POST auth/password`).
/// Signs the member in.
class CreatePasswordScreen extends ConsumerStatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  ConsumerState<CreatePasswordScreen> createState() =>
      _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends ConsumerState<CreatePasswordScreen> {
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _loading = false;
  String? _error;

  /// The API's rules for new passwords (prototype `pwdRules`); enforced by
  /// the server too (`mobile.password_weak`).
  static final _rules = <(String, bool Function(String))>[
    ('At least 8 characters', (p) => p.length >= 8),
    ('One number', (p) => RegExp(r'\d').hasMatch(p)),
    ('One letter', (p) => RegExp('[A-Za-z]').hasMatch(p)),
  ];

  bool get _valid =>
      _rules.every((r) => r.$2(_password.text)) && _confirm.text.isNotEmpty;

  @override
  void dispose() {
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final ticket = ref.read(signInFlowProvider).ticket;
    if (!_valid || _loading || ticket == null) return;
    // Prototype checks the match on submit.
    if (_password.text != _confirm.text) {
      setState(() => _error = "Passwords don't match");
      return;
    }
    final reset = ref.read(signInFlowProvider).purpose == OtpPurpose.reset;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final tokens = await ref
          .read(authRepositoryProvider)
          .setPassword(
            ticket: ticket,
            password: _password.text,
            confirm: _confirm.text,
          );
      if (!mounted) return;
      SureToast.show(
        context,
        reset
            ? 'Password updated — log in with your phone and new password'
            : 'Password created — next login is just phone + password, no OTP',
        icon: LucideIcons.shieldCheck,
        color: SureToastColor.positive,
      );
      await ref.read(sessionProvider.notifier).signIn(tokens);
    } on ApiException catch (e) {
      if (!mounted) return;
      switch (e.code) {
        case 'mobile.password_weak':
          setState(
            () => _error = e.errors.isEmpty
                ? e.userMessage
                : e.errors.map((x) => x.message).join('\n'),
          );
        case 'mobile.otp_ticket_invalid':
          // The ticket lasts 10 minutes: verify the number again.
          SureToast.show(
            context,
            e.userMessage,
            icon: LucideIcons.messageCircle,
          );
          context.go(AppRoutes.loginOtp);
        case 'isure.already_registered':
          SureToast.show(context, e.userMessage, icon: LucideIcons.info);
          context.go(AppRoutes.loginPassword);
        default:
          setState(() => _error = e.userMessage);
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final reset = ref.watch(signInFlowProvider).purpose == OtpPurpose.reset;

    return AuthScaffold(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageHeader(
            subtitleMaxLines: 2,
            title: reset ? 'Set a new password' : 'Create a password',
            subtitle: reset
                ? 'Number verified — choose a new password'
                : 'Number verified — set a password to log in next time',
            onBack: () => context.go(AppRoutes.login),
          ),
          const SizedBox(height: 28),
          AutofillGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FieldLabel('New password'),
                const SizedBox(height: 10),
                SureTextField(
                  controller: _password,
                  autofocus: true,
                  enabled: !_loading,
                  obscureText: true,
                  startIcon: LucideIcons.lock,
                  placeholder: 'Enter a password',
                  semanticLabel: 'New password',
                  autofillHints: const [AutofillHints.newPassword],
                  textInputAction: TextInputAction.next,
                  onChanged: (_) => setState(() => _error = null),
                ),
                const SizedBox(height: 16),
                const FieldLabel('Confirm password'),
                const SizedBox(height: 10),
                SureTextField(
                  controller: _confirm,
                  enabled: !_loading,
                  obscureText: true,
                  error: _error != null,
                  startIcon: LucideIcons.lock,
                  placeholder: 'Re-enter the password',
                  semanticLabel: 'Confirm password',
                  autofillHints: const [AutofillHints.newPassword],
                  textInputAction: TextInputAction.done,
                  onChanged: (_) => setState(() => _error = null),
                  onSubmitted: (_) => _submit(),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 10),
                  FieldError(_error),
                ],
                const SizedBox(height: 18),
                for (var i = 0; i < _rules.length; i++) ...[
                  if (i > 0) const SizedBox(height: 7),
                  _Rule(label: _rules[i].$1, ok: _rules[i].$2(_password.text)),
                ],
              ],
            ),
          ),
          const SizedBox(height: SureSpace.x6),
        ],
      ),
      bottom: SureButton(
        label: reset ? 'Save password' : 'Create password',
        loading: _loading,
        onPressed: _valid ? _submit : null,
      ),
    );
  }
}

/// 15 pt circle / circle-check and a 12 pt label: positive when met,
/// ink-faded otherwise.
class _Rule extends StatelessWidget {
  const _Rule({required this.label, required this.ok});

  final String label;
  final bool ok;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final color = ok ? c.positiveInk : c.inkFaded;
    return Semantics(
      label: '$label, ${ok ? 'met' : 'not met'}',
      excludeSemantics: true,
      child: Row(
        children: [
          Icon(
            ok ? LucideIcons.circleCheck : LucideIcons.circle,
            size: 15,
            color: color,
          ),
          const SizedBox(width: SureSpace.x2),
          Expanded(
            child: Text(
              label,
              style: SureText.caption1().copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
