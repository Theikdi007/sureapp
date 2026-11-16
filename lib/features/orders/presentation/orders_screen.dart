import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/order_components.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/service_components.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/components/sure_image.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../data/order_dtos.dart';
import '../data/orders_repository.dart';

part 'orders_screen.g.dart';

@riverpod
Future<List<OrderSummaryDto>> orderList(Ref ref, OrderTab tab) async =>
    (await ref.watch(ordersRepositoryProvider).orders(tab)).items;

@riverpod
Future<List<HomeSetupBookingDto>> homeSetupBookings(Ref ref) =>
    ref.watch(ordersRepositoryProvider).bookings();

/// Asks the Orders tab to show a tab ('all', 'unfulfilled', 'fulfilled',
/// 'setup') next time it builds, e.g. Profile › Scheduled Home Services.
@Riverpod(keepAlive: true)
class RequestedOrdersTab extends _$RequestedOrdersTab {
  @override
  String? build() => null;

  void request(String tab) => state = tab;

  void clear() => state = null;
}

/// Orders tab (prototype `OrdersScreen`): All · Unfulfilled · Fulfilled ·
/// Home Setup. `GET orders?tab=`, `GET home-setup/bookings`.
class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  String _tab = 'all';

  @override
  void initState() {
    super.initState();
    _tab = ref.read(requestedOrdersTabProvider) ?? _tab;
    Future.microtask(() {
      if (mounted) ref.read(requestedOrdersTabProvider.notifier).clear();
    });
  }

  static const _tabs = [
    ('all', 'All'),
    ('unfulfilled', 'Unfulfilled'),
    ('fulfilled', 'Fulfilled'),
    ('setup', 'Home Setup'),
  ];

  @override
  Widget build(BuildContext context) {
    ref.listen(requestedOrdersTabProvider, (_, next) {
      if (next == null) return;
      setState(() => _tab = next);
      ref.read(requestedOrdersTabProvider.notifier).clear();
    });
    final setup = _tab == 'setup';
    final orderTab = OrderTab.values.firstWhere(
      (t) => t.name == _tab,
      orElse: () => OrderTab.all,
    );
    return PageScaffold(
      title: 'Orders',
      headerGap: 16,
      showBack: false,
      onRefresh: () async {
        if (setup) {
          ref.invalidate(homeSetupBookingsProvider);
          await ref.read(homeSetupBookingsProvider.future);
        } else {
          ref.invalidate(orderListProvider(orderTab));
          await ref.read(orderListProvider(orderTab).future);
        }
      },
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          sliver: SliverToBoxAdapter(
            child: _OrderTabs(
              tabs: _tabs,
              value: _tab,
              onChanged: (t) => setState(() => _tab = t),
            ),
          ),
        ),
        if (setup)
          ..._bookingSlivers(ref.watch(homeSetupBookingsProvider))
        else
          ..._orderSlivers(ref.watch(orderListProvider(orderTab)), orderTab),
      ],
    );
  }

  List<Widget> _orderSlivers(
    AsyncValue<List<OrderSummaryDto>> v,
    OrderTab tab,
  ) => _async(
    v,
    () => ref.invalidate(orderListProvider(tab)),
    (list) => list.isEmpty
        ? const EmptyState(
            icon: LucideIcons.package,
            title: 'No orders here',
            description: 'Orders you place will show up in this list',
          )
        : null,
    (list) => SliverList.separated(
      itemCount: list.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, i) => OrderListCard(order: list[i]),
    ),
  );

  List<Widget> _bookingSlivers(AsyncValue<List<HomeSetupBookingDto>> v) =>
      _async(
        v,
        () => ref.invalidate(homeSetupBookingsProvider),
        (list) => list.isEmpty
            ? const EmptyState(
                icon: LucideIcons.house,
                title: 'No home setup visits',
                description: 'Book a free setup visit from a product page and it will show up here',
              )
            : null,
        (list) {
          // Upcoming first.
          final sorted = [...list]
            ..sort(
              (a, b) =>
                  (a.status == 'Scheduled' ? 0 : 1) -
                  (b.status == 'Scheduled' ? 0 : 1),
            );
          return SliverList.separated(
            itemCount: sorted.length,
            separatorBuilder: (_, _) => const SizedBox(height: 16),
            itemBuilder: (context, i) => BookingRow(booking: sorted[i]),
          );
        },
      );

  List<Widget> _async<T>(
    AsyncValue<T> v,
    VoidCallback retry,
    Widget? Function(T) empty,
    Widget Function(T) list,
  ) {
    Widget pad(Widget s) => SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: s,
    );
    return switch (v) {
      AsyncData(:final value) => [
        if (empty(value) case final e?)
          SliverToBoxAdapter(child: e)
        else
          pad(list(value)),
      ],
      AsyncError(:final error) when !v.isLoading => [
        SliverToBoxAdapter(
          child: EmptyState(
            icon: LucideIcons.wifiOff,
            title: "Couldn't load your orders",
            description: error is ApiException ? error.userMessage : null,
            action: SureLink('Try again', onTap: retry),
          ),
        ),
      ],
      _ => [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Center(
              child: SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: context.colors.primaryInk,
                ),
              ),
            ),
          ),
        ),
      ],
    };
  }
}

/// Prototype order tabs: pills sized to their labels (`Tabs` medium),
/// selected neon-faded with primary-ink 750.
class _OrderTabs extends StatelessWidget {
  const _OrderTabs({
    required this.tabs,
    required this.value,
    required this.onChanged,
  });

  final List<(String, String)> tabs;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Row(
      children: [
        for (var i = 0; i < tabs.length; i++) ...[
          if (i > 0) const SizedBox(width: 6),
          _maybeFlex(
            last: i == tabs.length - 1,
            child: Semantics(
              selected: tabs[i].$1 == value,
              button: true,
              child: GestureDetector(
                onTap: () => onChanged(tabs[i].$1),
                child: AnimatedContainer(
                  duration: SureMotion.fast,
                  constraints: const BoxConstraints(minHeight: 36),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: tabs[i].$1 == value
                        ? c.primaryFaded
                        : Colors.transparent,
                    borderRadius: SureRadius.all(SureRadius.pill),
                  ),
                  child: Text(
                    tabs[i].$2,
                    textAlign: TextAlign.center,
                    style:
                        SureText.body3(
                          tabs[i].$1 == value
                              ? SureTypography.bold
                              : SureTypography.medium,
                        ).copyWith(
                          color: tabs[i].$1 == value
                              ? c.primaryInk
                              : c.inkFaded,
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

/// Labels keep their width (prototype); only the last one may wrap.
Widget _maybeFlex({required bool last, required Widget child}) =>
    last ? Flexible(child: child) : child;

/// Short badge text: the API's label up to its " — " explanation.
String shortStatus(String label) => label.split(' — ').first;

/// Design system `OrderListCard`.
class OrderListCard extends StatelessWidget {
  const OrderListCard({super.key, required this.order});

  final OrderSummaryDto order;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final o = order;
    final caption = SureText.caption1().copyWith(color: c.inkFaded);
    return PressScale(
      scale: 0.98,
      semanticLabel: '${o.title}, ${o.statusLabel}, order ${o.number}',
      onTap: () => context.push(AppRoutes.order(o.number)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: c.raised,
          borderRadius: SureRadius.all(SureRadius.large),
          border: Border.all(color: c.borderFaded),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: SureRadius.all(SureRadius.medium),
              child: SizedBox.square(
                dimension: 56,
                child: ColoredBox(
                  color: c.keypad,
                  child: SureImage(o.imageUrl),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          o.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: SureText.body2(SureTypography.medium)
                              .copyWith(color: c.ink),
                        ),
                      ),
                      const SizedBox(width: 8),
                      StatusBadge(
                        label: shortStatus(o.statusLabel),
                        color: o.statusColor,
                      ),
                    ],
                  ),
                  if (o.express)
                    Text.rich(
                      TextSpan(
                        style: caption,
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              LucideIcons.zap,
                              size: 12,
                              color: c.primaryInk,
                            ),
                          ),
                          TextSpan(
                            text: ' 3-Hr Express',
                            style: caption.copyWith(
                              fontWeight: SureTypography.bold,
                              color: c.primaryInk,
                            ),
                          ),
                          if (o.meta.isNotEmpty) TextSpan(text: ' · ${o.meta}'),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  else if (o.meta.isNotEmpty)
                    Text(o.meta, style: caption),
                  Text('#${o.number}', style: caption),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(LucideIcons.chevronRight, size: 18, color: c.inkFaded),
          ],
        ),
      ),
    );
  }
}

/// Home Setup tab row (prototype `svcRows`).
class BookingRow extends StatelessWidget {
  const BookingRow({super.key, required this.booking});

  final HomeSetupBookingDto booking;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final b = booking;
    final done = b.status != 'Scheduled';
    // Prototype: completed visits use the literal mint pair (same in dark).
    final bg = done ? c.mintFaded : c.primaryFaded;
    final fg = done ? c.mintInk : c.primaryInk;
    final row = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: SureRadius.all(SureRadius.larger),
        border: Border.all(color: c.boxBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: SureRadius.all(SureRadius.medium),
            ),
            child: Icon(LucideIcons.house, size: 20, color: fg),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  b.device,
                  style: SureText.body3(FontWeight.w600).copyWith(color: c.ink),
                ),
                Text(
                  [
                    b.slotLabel,
                    if (b.orderNumber != null) 'Order #${b.orderNumber}',
                  ].join(' · '),
                  style: SureText.caption1().copyWith(color: c.inkFaded),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: SureRadius.all(SureRadius.pill),
            ),
            child: Text(
              b.statusLabel,
              style: TextStyle(
                fontFamily: SureTypography.fontFamily,
                fontSize: 11,
                fontWeight: SureTypography.bold,
                color: fg,
              ),
            ),
          ),
        ],
      ),
    );
    return PressScale(
      scale: 0.98,
      semanticLabel: '${b.device}, ${b.statusLabel}',
      onTap: () => showBookingSheet(context, b),
      child: row,
    );
  }
}

@riverpod
Future<HomeSetupBookingDto> homeSetupBooking(Ref ref, String number) =>
    ref.watch(ordersRepositoryProvider).booking(number);

/// One visit (`GET home-setup/bookings/{number}`) in the shared sheet, laid
/// out like the repair ticket sheet: status badge, detail card, then
/// "View order" and, while allowed, "Cancel visit"
/// (`POST home-setup/bookings/{number}/cancel`).
Future<void> showBookingSheet(BuildContext context, HomeSetupBookingDto b) =>
    showSureSheet<void>(
      context,
      title: b.device,
      builder: (_) => _BookingSheet(initial: b),
    );

class _BookingSheet extends ConsumerStatefulWidget {
  const _BookingSheet({required this.initial});

  final HomeSetupBookingDto initial;

  @override
  ConsumerState<_BookingSheet> createState() => _BookingSheetState();
}

class _BookingSheetState extends ConsumerState<_BookingSheet> {
  bool _cancelling = false;

  Future<void> _cancel(HomeSetupBookingDto b) async {
    setState(() => _cancelling = true);
    try {
      await ref.read(ordersRepositoryProvider).cancelBooking(b.number);
      ref
        ..invalidate(homeSetupBookingProvider(b.number))
        ..invalidate(homeSetupBookingsProvider);
      if (!mounted) return;
      Navigator.of(context).pop();
      SureToast.show(
        context,
        'Home visit cancelled',
        icon: LucideIcons.house,
        color: SureToastColor.neutral,
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _cancelling = false);
      SureToast.show(
        context,
        e.userMessage,
        icon: LucideIcons.circleAlert,
        color: SureToastColor.critical,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    // Show the row's copy at once; the fresh answer replaces it.
    final b =
        ref.watch(homeSetupBookingProvider(widget.initial.number)).value ??
        widget.initial;
    final done = b.status != 'Scheduled';
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: StatusBadge(
              label: b.statusLabel,
              color: done ? 'neutral' : 'primary',
            ),
          ),
          const SizedBox(height: SureSpace.x3),
          OutlinedCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                DetailRow(label: 'Visit', value: b.number),
                DetailRow(label: 'When', value: b.slotLabel),
                if (b.addressText != null)
                  DetailRow(label: 'Address', value: b.addressText!),
                if (b.orderNumber != null)
                  DetailRow(label: 'Order', value: '#${b.orderNumber}'),
              ],
            ),
          ),
          if (b.orderNumber != null) ...[
            const SizedBox(height: SureSpace.x3),
            SureButton(
              label: 'View order',
              variant: SureButtonVariant.outline,
              onPressed: () {
                Navigator.of(context).pop();
                context.push(AppRoutes.order(b.orderNumber!));
              },
            ),
          ],
          if (b.canCancel) ...[
            const SizedBox(height: SureSpace.x2),
            SureButton(
              label: 'Cancel visit',
              variant: SureButtonVariant.ghost,
              critical: true,
              loading: _cancelling,
              onPressed: () => _cancel(b),
            ),
          ] else if (!done) ...[
            const SizedBox(height: SureSpace.x3),
            Text(
              'Visits can be cancelled up to 12 hours before the window.',
              textAlign: TextAlign.center,
              style: SureText.caption1().copyWith(color: c.inkFaded),
            ),
          ],
        ],
      ),
    );
  }
}
