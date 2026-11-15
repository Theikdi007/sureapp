import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/order_components.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_image.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../catalog/presentation/product_detail_screen.dart' show RateBox;
import '../data/order_dtos.dart';
import '../data/orders_repository.dart';
import 'orders_screen.dart';

part 'order_detail_screen.g.dart';

@riverpod
Future<OrderDetailDto> orderDetail(Ref ref, String number) =>
    ref.watch(ordersRepositoryProvider).order(number);

@riverpod
Future<TrackingDto> orderTracking(Ref ref, String number) =>
    ref.watch(ordersRepositoryProvider).tracking(number);

List<StepItem> _steps(List<OrderStepDto> steps) => [
  for (final s in steps)
    StepItem(
      label: s.label,
      description: s.description,
      done: s.done,
      current: s.current,
    ),
];

/// Paid / Fulfilled read as done (green); anything else is still pending.
String _stateColor(String text) {
  final t = text.toLowerCase();
  if (t == 'paid' || t == 'fulfilled' || t == 'refunded') return 'positive';
  if (t.contains('cancel') || t.contains('fail')) return 'critical';
  return 'warning';
}

/// Loading / error slivers shared by the order screens.
List<Widget> _asyncSlivers<T>(
  BuildContext context,
  AsyncValue<T> v,
  VoidCallback retry,
  List<Widget> Function(T) data,
) => switch (v) {
  AsyncData(:final value) => data(value),
  AsyncError(:final error) when !v.isLoading => [
    SliverToBoxAdapter(
      child: EmptyState(
        icon: LucideIcons.wifiOff,
        title: "Couldn't load this order",
        description: error is ApiException ? error.userMessage : null,
        action: SureLink('Try again', onTap: retry),
      ),
    ),
  ],
  _ => [
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 64),
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

Widget _column(List<Widget> children) => SliverPadding(
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
  sliver: SliverList.list(
    children: [
      for (var i = 0; i < children.length; i++) ...[
        if (i > 0) const SizedBox(height: 18),
        children[i],
      ],
    ],
  ),
);

/// Prototype `OrderDetailScreen`. `GET orders/{number}`,
/// `POST orders/{number}/feedback`.
class OrderDetailScreen extends ConsumerStatefulWidget {
  const OrderDetailScreen({super.key, required this.number});

  final String number;

  @override
  ConsumerState<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderDetailScreen> {
  bool _rating = false;
  bool _thanked = false;

  @override
  Widget build(BuildContext context) {
    final v = ref.watch(orderDetailProvider(widget.number));
    final o = v.value;
    return PageScaffold(
      title: 'Order Detail',
      headerGap: 18,
      subtitle: '#${widget.number}',
      actions: [
        if (o != null)
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: StatusDot(
              label: shortStatus(o.statusLabel),
              color: o.statusColor,
            ),
          ),
      ],
      onRefresh: () async {
        ref.invalidate(orderDetailProvider(widget.number));
        await ref.read(orderDetailProvider(widget.number).future);
      },
      slivers: _asyncSlivers(
        context,
        v,
        () => ref.invalidate(orderDetailProvider(widget.number)),
        (o) => [_column(_body(context, o))],
      ),
    );
  }

  List<Widget> _body(BuildContext context, OrderDetailDto o) {
    final c = context.colors;
    final small = SureText.body3().copyWith(fontSize: 13, color: c.inkFaded);
    final smallInk = SureText.body3(SureTypography.medium)
        .copyWith(fontSize: 13, color: c.ink);
    Widget sysRow(String label, Widget value) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(label, style: small),
          const SizedBox(width: 12),
          Expanded(
            child: Align(alignment: Alignment.centerRight, child: value),
          ),
        ],
      ),
    );
    Widget text(String s) =>
        Text(s, textAlign: TextAlign.right, style: smallInk);
    final pickup = o.method == 'pickup';
    final title = o.lines.isEmpty ? 'order' : o.lines.first.title;

    return [
      OutlinedCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            for (var i = 0; i < o.lines.length; i++) ...[
              if (i > 0) Divider(height: 1, color: c.boxBorderFaded),
              _LineRow(line: o.lines[i]),
            ],
          ],
        ),
      ),
      if (o.express && o.etaText != null)
        InlineAlert(
          icon: LucideIcons.zap,
          text: '3-Hr Express order — ${o.etaText}',
        ),
      OutlinedCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            sysRow('Confirmation number', text(o.number)),
            if (o.trackingText != null)
              sysRow('Tracking', text(o.trackingText!)),
            sysRow('Payment method', text(o.paymentText)),
            sysRow(
              'Payment status',
              StatusDot(
                label: o.paymentStatus,
                color: _stateColor(o.paymentStatus),
              ),
            ),
            sysRow(
              'Fulfillment',
              StatusDot(
                label: o.fulfillmentStatus,
                color: _stateColor(o.fulfillmentStatus),
              ),
            ),
          ],
        ),
      ),
      if (o.steps.isNotEmpty)
        OutlinedCard(
          padding: const EdgeInsets.all(20),
          child: VerticalStepper(steps: _steps(o.steps)),
        ),
      if ((pickup ? o.pickupStore : o.shipToText) case final place?)
        // Prototype `ListLayout` (padding 14/16): primary-ink 20 pt icon,
        // body-3 medium title, caption-1 address.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(
                pickup ? LucideIcons.store : LucideIcons.mapPinHouse,
                size: 20,
                color: c.primaryInk,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pickup ? 'Pick up at' : 'Deliver to',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: SureText.body3(SureTypography.medium)
                          .copyWith(color: c.ink),
                    ),
                    Text(
                      place,
                      style: SureText.caption1().copyWith(color: c.inkFaded),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      if (o.homeSetup case final hs?) HomeSetupVisitCard(booking: hs),
      PayBreakdown(
        rows: [for (final r in o.summary) (r.label, r.value, r.positive)],
        total: o.total.displayCode,
      ),
      if (o.open && !pickup)
        SureButton(
          label: 'Track Order',
          startIcon: LucideIcons.mapPin,
          onPressed: () => context.push(AppRoutes.track(o.number)),
        ),
      if (_thanked || o.rated)
        const _FeedbackDone()
      else if (o.canRate) ...[
        if (_rating)
          RateBox(
            title: 'How was your $title?',
            submitLabel: 'Submit feedback',
            thanks: null,
            onSubmit: (rating, text, key) async {
              await ref
                  .read(ordersRepositoryProvider)
                  .feedback(o.number, rating: rating, text: text, key: key);
              if (!mounted) return;
              setState(() => _thanked = true);
              ref.invalidate(orderDetailProvider(o.number));
              ref.invalidate(orderListProvider);
            },
          )
        else
          SureButton(
            label: 'Give Feedback',
            variant: SureButtonVariant.outline,
            onPressed: () => setState(() => _rating = true),
          ),
      ],
    ];
  }
}

class _LineRow extends StatelessWidget {
  const _LineRow({required this.line});

  final OrderLineDto line;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l = line;
    final qty = l.qty == l.qty.roundToDouble() ? l.qty.toInt() : l.qty;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: SureRadius.all(SureRadius.medium),
            child: SizedBox.square(
              dimension: 56,
              child: ColoredBox(color: c.keypad, child: SureImage(l.imageUrl)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: SureText.body3(SureTypography.medium)
                      .copyWith(fontSize: 15, color: c.ink),
                ),
                if (l.spec != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    l.spec!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: SureTypography.fontFamily,
                      fontSize: 11,
                      color: c.inkFaded,
                    ),
                  ),
                ],
                const SizedBox(height: 2),
                Text(
                  'Qty $qty · ${l.unitPrice.display} each',
                  style: SureText.caption1().copyWith(color: c.inkFaded),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            l.lineTotal.displayCode,
            style: TextStyle(
              fontFamily: SureTypography.familyFor(15, SureTypography.bold),
              fontSize: 15,
              fontWeight: SureTypography.bold,
              color: c.ink,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeedbackDone extends StatelessWidget {
  const _FeedbackDone();

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: c.primaryFaded,
        borderRadius: SureRadius.all(SureRadius.large),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.star, size: 18, color: c.primaryInk),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Feedback submitted — thanks! It's now on the product page.",
              style: SureText.body3(SureTypography.medium)
                  .copyWith(fontSize: 13, color: c.primaryInk),
            ),
          ),
        ],
      ),
    );
  }
}

/// Home Setup visit card on order detail and product detail.
class HomeSetupVisitCard extends StatelessWidget {
  const HomeSetupVisitCard({super.key, required this.booking});

  final HomeSetupBookingDto booking;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final b = booking;
    final done = b.status != 'Scheduled';
    final bg = done ? c.positiveFaded : c.primaryFaded;
    final fg = done ? c.positiveInk : c.primaryInk;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                  'Home Setup Visit',
                  style: SureText.body3(FontWeight.w600).copyWith(color: c.ink),
                ),
                Text(
                  '${b.slotLabel} · Technician visit',
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
  }
}

/// Prototype `TrackOrderScreen` without the live map (not in this
/// release). `GET orders/{number}/tracking`.
class TrackOrderScreen extends ConsumerWidget {
  const TrackOrderScreen({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(orderTrackingProvider(number));
    return PageScaffold(
      title: 'Track Order',
      headerGap: 18,
      subtitle: '#$number',
      onRefresh: () async {
        ref.invalidate(orderTrackingProvider(number));
        await ref.read(orderTrackingProvider(number).future);
      },
      slivers: _asyncSlivers(
        context,
        v,
        () => ref.invalidate(orderTrackingProvider(number)),
        (t) => [
          _column([
            InlineAlert(
              icon: LucideIcons.truck,
              text: [
                if (t.mapLabel.isNotEmpty) t.mapLabel,
                if (t.etaText != null) t.etaText!,
              ].join(' · ').ifEmpty(shortStatus(t.statusLabel)),
            ),
            if (t.courierName != null)
              _CourierCard(name: t.courierName!, phone: t.courierPhone),
            if (t.steps.isNotEmpty)
              OutlinedCard(
                padding: const EdgeInsets.all(20),
                child: VerticalStepper(steps: _steps(t.steps)),
              ),
          ]),
        ],
      ),
    );
  }
}

extension on String {
  String ifEmpty(String other) => isEmpty ? other : this;
}

/// Design system `ContactCard`: avatar, name and role, call and SMS.
class _CourierCard extends StatelessWidget {
  const _CourierCard({required this.name, this.phone});

  final String name;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    Widget action(IconData icon, String label, String scheme) => Semantics(
      button: true,
      label: '$label $name',
      excludeSemantics: true,
      child: PressScale(
        onTap: () => launchUrl(Uri(scheme: scheme, path: phone)),
        // Design system `IconButton` medium / faded / neutral.
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: c.neutralFaded,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 18, color: c.ink),
        ),
      ),
    );
    // Avatar initials (prototype "KZ" for "Ko Zaw").
    final words = name.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty);
    final initials = words.isEmpty
        ? '?'
        : words.take(2).map((w) => w.characters.first.toUpperCase()).join();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: c.raised,
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(color: c.borderFaded),
      ),
      child: Row(
        children: [
          // Design system `Avatar` md / primary: 40 pt, 16 pt initials.
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: c.primaryFaded,
              shape: BoxShape.circle,
            ),
            child: Text(
              initials,
              maxLines: 1,
              style: SureText.body2(SureTypography.medium)
                  .copyWith(height: 1, color: c.primaryInk),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: SureText.body3(SureTypography.bold)
                      .copyWith(color: c.ink),
                ),
                Text(
                  'Delivery courier · SureStore fleet',
                  style: SureText.caption1().copyWith(color: c.inkFaded),
                ),
              ],
            ),
          ),
          if (phone != null) ...[
            action(LucideIcons.phone, 'Call', 'tel'),
            const SizedBox(width: 8),
            action(LucideIcons.messageCircle, 'Text', 'sms'),
          ],
        ],
      ),
    );
  }
}
