import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/components/order_components.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/service_components.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../data/repairs_repository.dart';

/// A repair ticket as the design system's `RepairListCard`; opens the
/// ticket sheet.
class RepairCard extends StatelessWidget {
  const RepairCard({super.key, required this.repair});

  final RepairDto repair;

  @override
  Widget build(BuildContext context) => RepairListCard(
    device: repair.device,
    issue: repair.issue,
    meta: repair.meta,
    badgeLabel: repair.statusLabel,
    badgeColor: repair.repairState.color,
    onTap: () => showRepairSheet(context, repair),
  );
}

Future<void> showRepairSheet(BuildContext context, RepairDto r) =>
    showSureSheet<void>(
      context,
      title: r.device,
      builder: (context) {
        final c = context.colors;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: StatusBadge(
                  label: r.statusLabel,
                  color: r.repairState.color,
                ),
              ),
              const SizedBox(height: SureSpace.x3),
              Text(r.issue, style: SureText.body3().copyWith(color: c.ink)),
              const SizedBox(height: SureSpace.x3),
              OutlinedCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    DetailRow(label: 'Ticket', value: r.number),
                    if (r.serial != null)
                      DetailRow(label: 'Serial', value: r.serial!),
                    if (r.storeName != null)
                      DetailRow(label: 'Service desk', value: r.storeName!),
                    DetailRow(
                      label: 'Received',
                      value: MyanmarTime.format(r.receivedAt),
                    ),
                    if (r.promisedAt != null)
                      DetailRow(
                        label: r.repairState == RepairState.done
                            ? 'Promised'
                            : 'Ready by',
                        value: MyanmarTime.format(r.promisedAt!),
                      ),
                  ],
                ),
              ),
              if (r.repairState == RepairState.ready) ...[
                const SizedBox(height: SureSpace.x3),
                InlineAlert(
                  icon: LucideIcons.packageCheck,
                  text:
                      'Your device is ready. Bring your ticket number '
                      '${r.number} to ${r.storeName ?? 'the service desk'}.',
                ),
              ],
            ],
          ),
        );
      },
    );

/// All repairs (`GET repairs`), active first, then past tickets.
class RepairsScreen extends ConsumerWidget {
  const RepairsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repairs = ref.watch(repairListProvider);
    return PageScaffold(
      title: 'Repairs',
      headerGap: 16,
      subtitle: 'Tickets at SureStore service desks',
      onRefresh: () async {
        ref.invalidate(repairListProvider);
        await ref.read(repairListProvider.future);
      },
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: PageScaffold.sidePadding,
          ),
          sliver: SliverToBoxAdapter(
            child: switch (repairs) {
              AsyncData(:final value) when value.isEmpty => const EmptyState(
                icon: LucideIcons.wrench,
                title: 'No repairs',
                description:
                    'Repairs booked at a SureStore service desk under your '
                    'phone number show up here',
              ),
              AsyncData(:final value) => _RepairGroups(repairs: value),
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
            },
          ),
        ),
      ],
    );
  }
}

class _RepairGroups extends StatelessWidget {
  const _RepairGroups({required this.repairs});

  final List<RepairDto> repairs;

  @override
  Widget build(BuildContext context) {
    final active = repairs.where((r) => r.active).toList();
    final past = repairs.where((r) => !r.active).toList();
    Widget group(String title, List<RepairDto> list) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(title: title, size: SectionHeaderSize.medium),
        const SizedBox(height: SureSpace.x3),
        for (final r in list) ...[
          RepairCard(repair: r),
          const SizedBox(height: SureSpace.x3),
        ],
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (active.isNotEmpty) group('Active', active),
        if (active.isNotEmpty && past.isNotEmpty)
          const SizedBox(height: SureSpace.x3),
        if (past.isNotEmpty) group('Past repairs', past),
      ],
    );
  }
}

/// Small centered spinner for a section that is loading.
class LoadingBlock extends StatelessWidget {
  const LoadingBlock({super.key, this.height = 96});

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    child: Center(
      child: SizedBox.square(
        dimension: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: context.colors.primaryInk,
        ),
      ),
    ),
  );
}
