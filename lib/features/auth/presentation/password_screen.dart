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
import '../../../design_system/tokens/sure_typography.dart';
import '../data/auth_dtos.dart';
import '../data/auth_repository.dart';
import 'auth_providers.dart';
import 'widgets/auth_scaffold.dart';

/// Prototype "Enter Password" (returning member): "Welcome back", password
/// field, "Forgot password?", Log in (`POST auth/login`).
class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  final _controller = TextEditingController();
  bool _loading = false;
  bool _sendingReset = false;
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final flow = ref.read(signInFlowProvider);
    if (_controller.text.isEmpty || _loading || flow.phone == null) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final tokens = await ref
          .read(authRepositoryProvider)
          .login(phone: flow.phone!, password: _controller.text);
      // The router leaves the sign-in screens once the session changes.
      await ref.read(sessionProvider.notifier).signIn(tokens);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.userMessage);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _forgot() async {
    final phone = ref.read(signInFlowProvider).phone;
    if (phone == null || _sendingReset) return;
    setState(() {
      _sendingReset = true;
      _error = null;
    });
    try {
      final sent = await ref
          .read(authRepositoryProvider)
          .sendOtp(phone: phone, purpose: OtpPurpose.reset);
      if (!mounted) return;
      ref.read(signInFlowProvider.notifier).codeSent(sent);
      SureToast.show(
        context,
        'Verify your number to reset your password',
        icon: LucideIcons.messageCircle,
      );
      context.go(AppRoutes.loginOtp);
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.userMessage);
    } finally {
      if (mounted) setState(() => _sendingReset = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final flow = ref.watch(signInFlowProvider);
    return AuthScaffold(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageHeader(
            subtitleMaxLines: 2,
            title: 'Welcome back',
            subtitle: 'for ${flow.phoneDisplay ?? ''}',
            onBack: () => context.go(AppRoutes.login),
          ),
          const SizedBox(height: 28),
          AutofillGroup(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FieldLabel('Password'),
                const SizedBox(height: 10),
                SureTextField(
                  controller: _controller,
                  autofocus: true,
                  enabled: !_loading,
                  obscureText: true,
                  error: _error != null,
                  startIcon: LucideIcons.lock,
                  placeholder: 'Enter your password',
                  semanticLabel: 'Password',
                  autofillHints: const [AutofillHints.password],
                  textInputAction: TextInputAction.done,
                  onChanged: (_) => setState(() => _error = null),
                  onSubmitted: (_) => _submit(),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 10),
                  FieldError(_error),
                ],
                const SizedBox(height: 14),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Semantics(
                    button: true,
                    child: GestureDetector(
                      onTap: _sendingReset ? null : _forgot,
                      child: Text(
                        _sendingReset ? 'Sending code…' : 'Forgot password?',
                        style: TextStyle(
                          fontFamily: SureTypography.fontFamily,
                          fontSize: 13,
                          fontWeight: SureTypography.medium,
                          color: c.primaryInk,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
      bottom: SureButton(
        label: 'Log in',
        loading: _loading,
        onPressed: _controller.text.isEmpty ? null : _submit,
      ),
    );
  }
}
