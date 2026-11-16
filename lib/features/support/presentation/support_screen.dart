import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/adaptive/window_class.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/service_components.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../orders/presentation/orders_screen.dart';
import '../../stores/presentation/find_store_screen.dart';
import '../../app_config/data/app_config_repository.dart';
import '../../content/data/content_repository.dart';
import '../../repairs/data/repairs_repository.dart';
import '../../repairs/presentation/repairs_screen.dart';
import 'split_page.dart';

/// Opens the dialer for [phone] (spaces are dropped).
Future<void> callPhone(BuildContext context, String phone) async {
  final uri = Uri(scheme: 'tel', path: phone.replaceAll(RegExp(r'[^\d+]'), ''));
  final ok = await launchUrl(uri);
  if (!ok && context.mounted) {
    SureToast.show(
      context,
      "Couldn't open the phone app. Call $phone",
      icon: LucideIcons.phone,
      color: SureToastColor.neutral,
    );
  }
}

/// Support tab (prototype `SUPPORT`): contact card, services, Repair
/// Tracker and policy links. Calls `GET repairs`, `GET content/{slug}`
/// (via the menu) and `app-config` (support phone).
///
/// No live chat in this release: the prototype's LiveChat card becomes a
/// call card with `supportPhone`, plus `supportChatUrl` when it is set.
class SupportScreen extends ConsumerWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(remoteAppConfigProvider).value;
    final repairs = ref.watch(repairListProvider);

    final services = [
      ServiceCard(
        icon: LucideIcons.wrench,
        title: 'Repair Service',
        description: 'Book a repair at your nearest store',
        onTap: () => context.push(AppRoutes.findStore),
      ),
      ServiceCard(
        icon: LucideIcons.shieldCheck,
        title: 'TechVault Warranty',
        description: 'Coverage, protection plans & claims',
        onTap: () => context.push(AppRoutes.warranty),
      ),
      ServiceCard(
        icon: LucideIcons.mapPin,
        title: 'Find a Store',
        // Prototype: the branch names ("Hleden · Kamayut · Junction City").
        description: switch (ref.watch(storeListProvider).value) {
          final s? when s.isNotEmpty =>
            s.take(3).map((x) => x.name).join(' · '),
          _ => 'Branches, opening hours and directions',
        },
        onTap: () => context.push(AppRoutes.findStore),
      ),
    ];

    return PageScaffold(
      title: 'Support',
      headerGap: 20,
      subtitle: "We're here for your devices",
      showBack: false,
      onRefresh: () async {
        ref.invalidate(repairListProvider);
        await ref.read(repairListProvider.future);
      },
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: PageScaffold.sidePadding,
          ),
          sliver: SliverList.list(
            children: [
              if (config != null) ...[
                _ContactCard(
                  phone: config.supportPhone,
                  chatUrl: config.supportChatUrl,
                ),
                const SizedBox(height: SureSpace.x5),
              ],
              _ServiceGrid(children: services),
              const SizedBox(height: SureSpace.x5),
              SectionHeader(
                title: 'Repair Tracker',
                description: 'Your active repairs',
                action: switch (repairs) {
                  AsyncData(:final value) when value.isNotEmpty => SureLink(
                    'All repairs',
                    onTap: () => context.push(AppRoutes.repairs),
                  ),
                  _ => null,
                },
              ),
              const SizedBox(height: 14),
              _RepairTracker(repairs: repairs),
              const SizedBox(height: SureSpace.x5),
              // Prototype: shown only while a visit is scheduled.
              if (ref
                      .watch(homeSetupBookingsProvider)
                      .value
                      ?.where((b) => b.status == 'Scheduled')
                  case final upcoming? when upcoming.isNotEmpty) ...[
                const SectionHeader(
                  title: 'Home Setup Visits',
                  description: 'Scheduled technician visits',
                ),
                const SizedBox(height: 14),
                for (final b in upcoming) ...[
                  BookingRow(booking: b),
                  const SizedBox(height: 12),
                ],
                const SizedBox(height: SureSpace.x5 - 12),
              ],
              ServiceMenuList(
                items: [
                  ServiceMenuItem(
                    icon: LucideIcons.rotateCcw,
                    label: 'Return policy',
                    onTap: () => context.push(
                      AppRoutes.content(ContentSlugs.returnPolicy),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// One column on phones, up to three side by side on wider windows.
class _ServiceGrid extends StatelessWidget {
  const _ServiceGrid({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final cols = switch (WindowClass.fromWidth(constraints.maxWidth)) {
        WindowClass.compact => 1,
        WindowClass.medium => 2,
        WindowClass.expanded => 3,
      };
      const gap = SureSpace.x3;
      final w = (constraints.maxWidth - gap * (cols - 1)) / cols;
      return Wrap(
        spacing: gap,
        runSpacing: gap,
        children: [for (final c in children) SizedBox(width: w, child: c)],
      );
    },
  );
}

class _RepairTracker extends ConsumerWidget {
  const _RepairTracker({required this.repairs});

  final AsyncValue<List<RepairDto>> repairs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    return switch (repairs) {
      AsyncData(:final value) => switch (value.where((r) => r.active)) {
        final active when active.isEmpty => Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: c.pageFaded,
            borderRadius: SureRadius.all(SureRadius.large),
          ),
          child: Row(
            children: [
              Icon(LucideIcons.wrench, size: 20, color: c.inkFaded),
              const SizedBox(width: SureSpace.x3),
              Expanded(
                child: Text(
                  'No active repairs. Tickets from SureStore service desks '
                  'show up here.',
                  style: SureText.body3().copyWith(color: c.inkFaded),
                ),
              ),
            ],
          ),
        ),
        final active => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: spaced([
            for (final r in active) RepairCard(repair: r),
          ], gap: 12),
        ),
      },
      AsyncError(:final error) when !repairs.isLoading => EmptyState(
        icon: LucideIcons.wifiOff,
        title: "Couldn't load your repairs",
        description: error is ApiException ? error.userMessage : null,
        action: SureLink(
          'Try again',
          onTap: () => ref.invalidate(repairListProvider),
        ),
      ),
      _ => const LoadingBlock(),
    };
  }
}

/// Stands in for the prototype's LiveChat card: support phone, and the
/// chat link when app-config has one.
class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.phone, this.chatUrl});

  final String phone;
  final String? chatUrl;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    Widget action(IconData icon, String label, VoidCallback onTap) => Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: PressScale(
        onTap: onTap,
        child: Container(
          width: SureSize.minTap,
          height: SureSize.minTap,
          decoration: BoxDecoration(color: c.primary, shape: BoxShape.circle),
          child: Icon(icon, size: 20, color: c.onPrimary),
        ),
      ),
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.primaryFaded,
        borderRadius: SureRadius.all(SureRadius.large),
      ),
      child: Row(
        children: [
          // LiveChat's `Avatar` (md, primary): a 40 pt circle.
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: c.primaryFaded,
              shape: BoxShape.circle,
            ),
            child: Icon(LucideIcons.headset, size: 20, color: c.primaryInk),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sure Support',
                  style: SureText.body3(SureTypography.bold)
                      .copyWith(color: c.ink),
                ),
                Text(
                  'Call $phone',
                  style: SureText.caption1().copyWith(color: c.inkFaded),
                ),
              ],
            ),
          ),
          if (chatUrl case final url? when url.isNotEmpty) ...[
            action(
              LucideIcons.messageCircle,
              'Message Sure Support',
              () => launchUrl(
                Uri.parse(url),
                mode: LaunchMode.externalApplication,
              ),
            ),
            const SizedBox(width: SureSpace.x2),
          ],
          action(
            LucideIcons.phone,
            'Call Sure Support',
            () => callPhone(context, phone),
          ),
        ],
      ),
    );
  }
}
