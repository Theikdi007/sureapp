import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_exception.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_logo.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../app_config/data/app_config_repository.dart';

/// Shown while app-config and the stored session load; offers Retry when
/// app-config fails (it's needed for the version gate and onboarding).
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(remoteAppConfigProvider);
    final error = config.hasError && !config.isLoading ? config.error : null;
    return _CenteredPage(
      children: [
        const SureLogo(height: 56),
        const SizedBox(height: SureSpace.x8),
        if (error == null)
          const SizedBox.square(
            dimension: 28,
            child: CircularProgressIndicator(strokeWidth: 2.5),
          )
        else ...[
          Text(
            error is ApiException
                ? error.userMessage
                : 'Something went wrong. Try again.',
            textAlign: TextAlign.center,
            style: context.text.bodyLarge,
          ),
          const SizedBox(height: SureSpace.x6),
          SureButton(
            label: 'Try again',
            onPressed: () => ref.invalidate(remoteAppConfigProvider),
          ),
        ],
      ],
    );
  }
}

/// Blocks the app when it is below the API's minimum version
/// (`app-config.updateRequired` or any `410 mobile.update_required`).
class UpdateRequiredScreen extends ConsumerWidget {
  const UpdateRequiredScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final phone = ref.watch(remoteAppConfigProvider).value?.supportPhone;
    return _CenteredPage(
      children: [
        const SureLogo(height: 56),
        const SizedBox(height: SureSpace.x8),
        Semantics(
          header: true,
          child: Text(
            'Update required',
            textAlign: TextAlign.center,
            style: context.text.headlineMedium,
          ),
        ),
        const SizedBox(height: SureSpace.x3),
        Text(
          'A newer version of the app is needed. Update it from the store '
          'to continue.',
          textAlign: TextAlign.center,
          style: context.text.bodyLarge?.copyWith(color: c.inkFaded),
        ),
        if (phone != null) ...[
          const SizedBox(height: SureSpace.x6),
          Text(
            'Need help? Call $phone',
            textAlign: TextAlign.center,
            style: context.text.bodyMedium?.copyWith(color: c.inkFaded),
          ),
        ],
      ],
    );
  }
}

class _CenteredPage extends StatelessWidget {
  const _CenteredPage({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(SureSpace.x6),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final child in children)
                  child is SureLogo ? Center(child: child) : child,
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
