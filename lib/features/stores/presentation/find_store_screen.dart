import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/network/api_exception.dart';
import '../../../design_system/components/order_components.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/service_components.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../repairs/presentation/repairs_screen.dart' show LoadingBlock;
import '../../support/presentation/split_page.dart';
import '../../support/presentation/support_screen.dart' show callPhone;
import '../data/stores_repository.dart';

part 'find_store_screen.g.dart';

@riverpod
Future<List<StoreDto>> storeList(Ref ref) =>
    ref.watch(storesRepositoryProvider).stores();

/// Find a Store (prototype `STORES`): map panel and the branch list from
/// `GET stores`. Compact: tapping a store opens its sheet. Medium/expanded
/// and book-posture folds: list and store detail side by side.
class FindStoreScreen extends ConsumerStatefulWidget {
  const FindStoreScreen({super.key});

  @override
  ConsumerState<FindStoreScreen> createState() => _FindStoreScreenState();
}

class _FindStoreScreenState extends ConsumerState<FindStoreScreen> {
  /// Kept here so the selection survives fold/unfold and rotation.
  String? _selected;

  static String _subtitle(List<StoreDto> stores) {
    final n = '${stores.length} ${stores.length == 1 ? 'store' : 'stores'}';
    final cities = {for (final s in stores) ?s.city};
    return cities.length == 1 ? '$n in ${cities.first}' : n;
  }

  static String? _mapLabel(List<StoreDto> stores) =>
      stores.isEmpty ? null : stores.take(3).map((s) => s.name).join(' · ');

  @override
  Widget build(BuildContext context) {
    final stores = ref.watch(storeListProvider);
    final list = stores.value ?? const <StoreDto>[];
    final subtitle = stores.hasValue ? _subtitle(list) : null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final split = useSplitLayout(context, constraints.maxWidth);

        Widget row(StoreDto s) => StoreListRow(
          name: s.name,
          address: s.addressLine,
          open: s.openNow,
          hours: s.hoursToday,
          distance: s.distance,
          selected: split && s.code == _selected,
          onTap: () {
            setState(() => _selected = s.code);
            if (!split) {
              showSureSheet<void>(
                context,
                title: s.name,
                builder: (_) =>
                    SingleChildScrollView(child: StoreDetail(store: s)),
              );
            }
          },
        );

        final body = switch (stores) {
          AsyncData() when list.isEmpty => <Widget>[
            const EmptyState(
              icon: LucideIcons.store,
              title: 'No stores to show',
              description: 'Check back soon',
            ),
          ],
          AsyncData() => [
            MapBox(label: _mapLabel(list)),
            for (final s in list) row(s),
          ],
          AsyncError(:final error) when !stores.isLoading => [
            EmptyState(
              icon: LucideIcons.wifiOff,
              title: "Couldn't load stores",
              description: error is ApiException ? error.userMessage : null,
              action: SureLink(
                'Try again',
                onTap: () => ref.invalidate(storeListProvider),
              ),
            ),
          ],
          _ => [const LoadingBlock()],
        };

        if (split) {
          final selected = list.where((s) => s.code == _selected).firstOrNull;
          return SplitPage(
            title: 'Find a Store',
            subtitle: subtitle,
            list: spaced(body, gap: SureSpace.x4),
            detail: selected == null
                ? null
                : [
                    Text(
                      selected.name,
                      style: SureText.featured3().copyWith(
                        color: context.colors.ink,
                      ),
                    ),
                    const SizedBox(height: 14),
                    StoreDetail(store: selected),
                  ],
            emptyDetail: const EmptyState(
              icon: LucideIcons.mapPin,
              title: 'Pick a store',
              description: 'Opening hours, directions and phone show here',
            ),
          );
        }
        return PageScaffold(
          title: 'Find a Store',
          headerGap: 16,
          subtitle: subtitle,
          onRefresh: () async {
            ref.invalidate(storeListProvider);
            await ref.read(storeListProvider.future);
          },
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: PageScaffold.sidePadding,
              ),
              sliver: SliverList.list(
                children: spaced(body, gap: SureSpace.x4),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// One store: open state, hours, pickup, address, call and directions.
class StoreDetail extends StatelessWidget {
  const StoreDetail({super.key, required this.store});

  final StoreDto store;

  Uri get _directions => Uri.https('www.google.com', '/maps/dir/', {
    'api': '1',
    'destination': '${store.latitude},${store.longitude}',
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = store;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: SureSpace.x2,
          runSpacing: SureSpace.x1,
          children: [
            StatusBadge(
              label: s.openNow ? 'Open now' : 'Closed',
              color: s.openNow ? 'positive' : 'critical',
            ),
            if (s.pickup)
              const StatusBadge(label: 'App pickup', color: 'primary'),
          ],
        ),
        const SizedBox(height: SureSpace.x3),
        OutlinedCard(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              if (s.address != null)
                DetailRow(label: 'Address', value: s.address!),
              if (s.city != null) DetailRow(label: 'City', value: s.city!),
              if (s.hoursToday != null)
                DetailRow(label: 'Hours today', value: s.hoursToday!),
              if (s.distance != null)
                DetailRow(label: 'Distance', value: s.distance!),
              if (s.phone != null) DetailRow(label: 'Phone', value: s.phone!),
            ],
          ),
        ),
        if (!s.pickup) ...[
          const SizedBox(height: SureSpace.x3),
          Text(
            "This store doesn't take app pickups.",
            style: SureText.caption1().copyWith(color: c.inkFaded),
          ),
        ],
        const SizedBox(height: SureSpace.x4),
        if (s.hasPosition)
          SureButton(
            label: 'Directions',
            startIcon: LucideIcons.navigation,
            onPressed: () =>
                launchUrl(_directions, mode: LaunchMode.externalApplication),
          ),
        if (s.hasPosition && s.phone != null)
          const SizedBox(height: SureSpace.x2),
        if (s.phone != null)
          SureButton(
            label: 'Call store',
            startIcon: LucideIcons.phone,
            variant: SureButtonVariant.outline,
            onPressed: () => callPhone(context, s.phone!),
          ),
      ],
    );
  }
}
