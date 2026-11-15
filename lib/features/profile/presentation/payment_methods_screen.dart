import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../repairs/presentation/repairs_screen.dart' show LoadingBlock;
import 'profile_providers.dart';

IconData paymentIcon(String code) => switch (code) {
  'cod' => LucideIcons.banknote,
  'pay_at_pickup' => LucideIcons.store,
  'qr' => LucideIcons.qrCode,
  'bank' => LucideIcons.landmark,
  _ => LucideIcons.creditCard,
};

/// Payment Methods (prototype `Payment Methods`): pick the default that
/// checkout preselects. `GET payment-methods`, `PUT payment-methods/default`.
///
/// No saved cards in this release, so there is no "Add payment method";
/// methods that aren't live yet show their `disabledReason`.
class PaymentMethodsScreen extends ConsumerStatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  ConsumerState<PaymentMethodsScreen> createState() =>
      _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends ConsumerState<PaymentMethodsScreen> {
  String? _saving;

  Future<void> _pick(String code) async {
    if (_saving != null) return;
    setState(() => _saving = code);
    try {
      await ref.read(paymentMethodsProvider.notifier).setDefault(code);
    } on Object catch (e) {
      if (mounted) {
        SureToast.show(
          context,
          e is ApiException
              ? e.userMessage
              : "Couldn't change that. Try again.",
          icon: LucideIcons.circleAlert,
          color: SureToastColor.critical,
        );
      }
    } finally {
      if (mounted) setState(() => _saving = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final methods = ref.watch(paymentMethodsProvider);
    return PageScaffold(
      title: 'Payment Methods',
      headerGap: 18,
      subtitle: 'Your default is preselected at checkout',
      maxContentWidth: 720,
      onRefresh: () async {
        ref.invalidate(paymentMethodsProvider);
        await ref.read(paymentMethodsProvider.future);
      },
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: PageScaffold.sidePadding,
          ),
          sliver: SliverToBoxAdapter(
            child: switch (methods) {
              AsyncData(:final value) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final m in value) ...[
                    SelectRow(
                      icon: paymentIcon(m.code),
                      title: m.title,
                      description: m.enabled
                          ? m.description
                          : (m.disabledReason ?? m.description),
                      trailing: m.isDefault ? 'Default' : null,
                      selected: m.isDefault,
                      enabled: m.enabled && _saving == null,
                      onSelect: () => _pick(m.code),
                    ),
                    const SizedBox(height: 10),
                  ],
                  const SizedBox(height: SureSpace.x2),
                  Text(
                    'Tap a method to make it your default.',
                    style: SureTypography.style(
                      size: 11,
                      height: 1.5,
                      color: c.inkFaded,
                    ),
                  ),
                ],
              ),
              AsyncError(:final error) when !methods.isLoading => EmptyState(
                icon: LucideIcons.wifiOff,
                title: "Couldn't load payment methods",
                description: error is ApiException ? error.userMessage : null,
                action: SureLink(
                  'Try again',
                  onTap: () => ref.invalidate(paymentMethodsProvider),
                ),
              ),
              _ => const LoadingBlock(),
            },
          ),
        ),
      ],
    );
  }
}
