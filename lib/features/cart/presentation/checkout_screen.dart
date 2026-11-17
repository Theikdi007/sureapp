import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/bottom_bar_surface.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/components/word_fit_text.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../catalog/presentation/shop_state.dart';
import '../../catalog/presentation/widgets/catalog_widgets.dart';
import '../../loyalty/data/loyalty_repository.dart';
import '../data/cart_repository.dart';
import '../data/checkout_dtos.dart';
import 'location_sheet.dart';

/// Prototype "Checkout": Delivery / Pick up, address, shipping, Free Home
/// Setup, pickup store, payment, breakdown, glass Total + Place Order bar.
///
/// Every change re-quotes (`POST checkout/quote`); all figures come from the
/// quote. Place order (`POST orders`) sends the total the member saw and
/// one Idempotency-Key, reused when retrying after a timeout.
/// Paying with points is not in this release, so it isn't offered.
class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  String _mode = 'delivery';
  String? _shipping;
  String? _addressId;
  String? _storeCode;
  String? _payment;
  bool _homeSetup = false;
  String? _setupDate;
  String? _setupSlot;

  CheckoutDto? _quote;
  Object? _error;
  bool _quoting = false;
  int _seq = 0;

  bool _placing = false;
  IdempotencyKey? _placeKey;

  @override
  void initState() {
    super.initState();
    // The address picked on Home, if any; else the quote's default.
    _addressId = ref.read(deliveryAddressProvider)?.id;
    _requote();
  }

  CheckoutRequest _request({num? expectedTotal}) {
    final delivery = _mode == 'delivery';
    return CheckoutRequest(
      mode: _mode,
      shipping: delivery ? _shipping : null,
      addressId: delivery ? _addressId : null,
      storeCode: delivery ? null : _storeCode,
      payment: _payment,
      homeSetup:
          delivery && _homeSetup && _setupDate != null && _setupSlot != null
          ? HomeSetupChoice(date: _setupDate!, slot: _setupSlot!)
          : null,
      expectedTotal: expectedTotal,
    );
  }

  Future<void> _requote() async {
    final seq = ++_seq;
    setState(() {
      _quoting = true;
      _error = null;
    });
    try {
      final q = await ref.read(cartRepositoryProvider).quote(_request());
      if (!mounted || seq != _seq) return;
      _apply(q);
    } on Object catch (e) {
      if (mounted && seq == _seq) setState(() => _error = e);
    } finally {
      if (mounted && seq == _seq) setState(() => _quoting = false);
    }
  }

  /// Adopt the quote and its defaults (selected shipping/store, address,
  /// default payment) where the member hasn't chosen yet.
  void _apply(CheckoutDto q) {
    setState(() {
      _quote = q;
      _shipping ??= q.shippingOptions
          .where((s) => s.selected)
          .firstOrNull
          ?.code;
      _addressId ??= q.address?.id;
      _storeCode ??= q.stores.where((s) => s.selected).firstOrNull?.code;
      final enabled = q.payments.where((p) => p.enabled);
      if (_payment == null || !enabled.any((p) => p.code == _payment)) {
        _payment =
            (enabled.where((p) => p.isDefault).firstOrNull ??
                    enabled.firstOrNull)
                ?.code;
      }
      if (_homeSetup && _setupDate == null && q.homeSetupDays.isNotEmpty) {
        final d = q.homeSetupDays.first;
        _setupDate = d.date;
        _setupSlot = d.slots.where((s) => s.available).firstOrNull?.slot;
      }
    });
  }

  /// Payment options that aren't in this release (QR, bank, points).
  void _notYet(String? reason) => SureToast.show(
    context,
    (reason == null || reason.isEmpty)
        ? 'Coming soon — pay on delivery or at pickup for now.'
        : reason,
    icon: LucideIcons.info,
    color: SureToastColor.neutral,
  );

  void _change(VoidCallback update) {
    setState(update);
    _requote();
  }

  Future<void> _place() async {
    final q = _quote;
    if (q == null || !q.canPlace || _placing || _quoting) return;
    _placeKey ??= IdempotencyKey.generate();
    setState(() => _placing = true);
    try {
      final placed = await ref
          .read(cartRepositoryProvider)
          .placeOrder(_request(expectedTotal: q.total.value), key: _placeKey!);
      _placeKey = null;
      ref.read(bagProvider.notifier).cleared();
      if (!mounted) return;
      await _showPlaced(placed);
    } on ApiException catch (e) {
      // Retry after a timeout must reuse the key; any answer from the
      // server means the next attempt is a new action.
      if (e.status != null) _placeKey = null;
      if (!mounted) return;
      final fresh = e.body?['quote'];
      if (fresh is Map<String, dynamic>) {
        _apply(CheckoutDto.fromJson(fresh));
        SureToast.show(
          context,
          'Prices or stock changed. Check the new total and place your order again.',
          icon: LucideIcons.refreshCw,
          color: SureToastColor.neutral,
        );
      } else {
        showApiError(context, e);
        if (e.code == 'mobile.slot_full') _requote();
      }
    } finally {
      if (mounted) setState(() => _placing = false);
    }
  }

  Future<void> _showPlaced(OrderPlacedDto o) async {
    final router = GoRouter.of(context);
    final track = await showSureSheet<bool>(
      context,
      builder: (context) => _OrderPlacedBody(order: o),
    );
    if (!mounted) return;
    if (track == true) {
      router
        ..go(AppRoutes.orders)
        ..push(AppRoutes.order(o.number));
    } else {
      router.go(AppRoutes.home);
    }
  }

  Future<void> _chooseAddress() async {
    final picked = await showLocationSheet(context, selectedId: _addressId);
    if (picked == null) return;
    ref.read(deliveryAddressProvider.notifier).choose(picked);
    if (picked.id != _addressId) _change(() => _addressId = picked.id);
  }

  @override
  Widget build(BuildContext context) {
    final q = _quote;
    final count = q?.itemCount ?? ref.watch(shopCountsProvider).cartItems;
    final delivery = _mode == 'delivery';

    final body = <Widget>[
      PillTabs(
        items: const [('delivery', 'Delivery'), ('pickup', 'Pick up')],
        value: _mode,
        onChanged: (m) {
          if (m == _mode) return;
          _change(() {
            _mode = m;
            _payment = null;
          });
        },
      ),
      if (q == null && _error == null)
        const Padding(
          padding: EdgeInsets.only(top: 32),
          child: Center(child: _Spinner()),
        ),
      if (q == null && _error != null)
        EmptyState(
          icon: LucideIcons.wifiOff,
          title: "Couldn't price your bag",
          description: _error is ApiException
              ? (_error as ApiException).userMessage
              : null,
          action: SureLink('Try again', onTap: _requote),
        ),
      if (q != null) ...[
        if (delivery) ..._deliverySection(q) else ..._pickupSection(q),
        const SectionHeader(title: 'Payment', size: SectionHeaderSize.small),
        // Prototype payment list. Only the API's enabled methods (cash on
        // delivery / pay at pickup) can be picked; the others look as in
        // the design and explain why they can't be used yet.
        for (final p in q.payments)
          SelectRow(
            icon: _paymentIcon(p.code),
            title: p.title,
            description: p.description,
            selected: p.code == _payment,
            onSelect: p.enabled
                ? () => _change(() => _payment = p.code)
                : () => _notYet(p.disabledReason),
          ),
        if (!q.payments.any((p) => p.code == 'points'))
          SelectRow(
            icon: LucideIcons.walletCards,
            title: 'Points Only',
            description:
                '${NumberFormat('#,##0').format(q.points.balance)} pts available',
            selected: false,
            onSelect: () => _notYet(q.points.hint),
          ),
        _PayWithPointsCard(
          points: q.points,
          dailyLimit: ref.watch(loyaltySummaryProvider).value?.dailyRedeemLimit,
          onTap: () => _notYet(q.points.hint),
        ),
        for (final problem in q.problems)
          InlineAlert(
            icon: LucideIcons.circleAlert,
            text: problem,
            critical: true,
          ),
        if (q.freshness != null && !q.freshness!.isLive)
          const InlineAlert(
            icon: LucideIcons.clock,
            text: "Showing last-known prices; they're checked again when you place the order.",
          ),
        PayBreakdown(
          rows: [for (final r in q.summary) (r.label, r.value, r.positive)],
          total: q.total.displayCode,
        ),
      ],
    ];

    return PageScaffold(
      title: 'Checkout',
      headerGap: 18,
      subtitle: '$count item${count == 1 ? '' : 's'} · Secure checkout',
      actions: const [_SecureBadge()],
      maxContentWidth: 720,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.separated(
            itemCount: body.length,
            // Prototype: 18 between blocks, 12 under the Payment header,
            // 10 inside a list of shipping / store / payment options.
            separatorBuilder: (_, i) => SizedBox(
              height: body[i] is SectionHeader
                  ? 12
                  : body[i] is SelectRow && body[i + 1] is SelectRow
                  ? 10
                  : 18,
            ),
            itemBuilder: (_, i) => body[i],
          ),
        ),
      ],
      bottomBar: _PlaceBar(
        total: q?.total.displayCode,
        loading: _placing,
        quoting: _quoting,
        enabled: q != null && q.canPlace && !_quoting,
        onPlace: _place,
      ),
    );
  }

  List<Widget> _deliverySection(CheckoutDto q) {
    final c = context.colors;
    final a = q.address;
    return [
      Container(
        decoration: BoxDecoration(
          borderRadius: SureRadius.all(SureRadius.large),
          border: Border.all(color: c.boxBorder),
        ),
        child: InkWell(
          borderRadius: SureRadius.all(SureRadius.large),
          onTap: _chooseAddress,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                // Prototype `ListLayout` leading: primary-ink, 20 pt.
                Icon(addressIcon(a?.icon), size: 20, color: c.primaryInk),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        a?.label ?? 'Add a delivery address',
                        maxLines: 1,
                        style: SureText.body3(SureTypography.medium)
                            .copyWith(color: c.ink),
                      ),
                      if (a != null)
                        Text(
                          a.fullText,
                          style: SureText.caption1().copyWith(
                            color: c.inkFaded,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Change',
                  style: SureText.body2(SureTypography.medium)
                      .copyWith(color: c.primaryInk),
                ),
              ],
            ),
          ),
        ),
      ),
      for (final s in q.shippingOptions.where((s) => s.code != 'pickup'))
        SelectRow(
          icon: s.code == 'express' ? LucideIcons.zap : LucideIcons.truck,
          title: s.title,
          description: s.description,
          trailing: s.fee.value == 0 ? 'Free' : s.fee.displayCode,
          selected: s.code == _shipping,
          enabled: s.enabled,
          onSelect: () => _change(() => _shipping = s.code),
        ),
      if (q.homeSetupEligible) _homeSetupCard(q),
    ];
  }

  Widget _homeSetupCard(CheckoutDto q) {
    final c = context.colors;
    final day = q.homeSetupDays.where((d) => d.date == _setupDate).firstOrNull;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: SureRadius.all(SureRadius.large),
        border: Border.all(color: c.boxBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(LucideIcons.house, size: 22, color: c.primaryInk),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Free Home Setup',
                      style: SureText.body3(SureTypography.medium)
                          .copyWith(fontSize: 15, color: c.ink),
                    ),
                    Text(
                      'Our technician sets up your device at home',
                      style: SureText.caption1().copyWith(color: c.inkFaded),
                    ),
                  ],
                ),
              ),
              SureSwitch(
                value: _homeSetup,
                label: 'Free Home Setup',
                onChanged: (on) => _change(() {
                  _homeSetup = on;
                  if (on && q.homeSetupDays.isNotEmpty) {
                    final d = q.homeSetupDays.first;
                    _setupDate = d.date;
                    _setupSlot = d.slots
                        .where((s) => s.available)
                        .firstOrNull
                        ?.slot;
                  }
                }),
              ),
            ],
          ),
          if (_homeSetup) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                // Prototype shows four days.
                for (var i = 0; i < q.homeSetupDays.length && i < 4; i++) ...[
                  if (i > 0) const SizedBox(width: 8),
                  Expanded(
                    child: _DayCell(
                      day: q.homeSetupDays[i],
                      selected: q.homeSetupDays[i].date == _setupDate,
                      onTap: () => _change(() {
                        _setupDate = q.homeSetupDays[i].date;
                        final slots = q.homeSetupDays[i].slots;
                        if (!slots.any(
                          (s) => s.slot == _setupSlot && s.available,
                        )) {
                          _setupSlot = slots
                              .where((s) => s.available)
                              .firstOrNull
                              ?.slot;
                        }
                      }),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 10),
            if (day != null)
              Row(
                children: [
                  for (var i = 0; i < day.slots.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    Expanded(
                      child: Opacity(
                        opacity: day.slots[i].available ? 1 : 0.4,
                        child: _SlotPill(
                          label: day.slots[i].label,
                          selected: day.slots[i].slot == _setupSlot,
                          onTap: day.slots[i].available
                              ? () => _change(
                                  () => _setupSlot = day.slots[i].slot,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
          ],
        ],
      ),
    );
  }

  List<Widget> _pickupSection(CheckoutDto q) => [
    for (final s in q.stores)
      SelectRow(
        icon: LucideIcons.store,
        title: s.name,
        description: [
          if (s.address != null) s.address!,
          if (!s.openNow) 'Closed now',
        ].join(' · '),
        trailing: s.distance,
        selected: s.code == _storeCode,
        onSelect: () => _change(() => _storeCode = s.code),
      ),
    const InlineAlert(
      icon: LucideIcons.clock,
      text: 'Ready for pickup in 2 hours — bring your order QR',
    ),
  ];

  static IconData _paymentIcon(String code) => switch (code) {
    'cod' => LucideIcons.banknote,
    'pay_at_pickup' => LucideIcons.store,
    'qr' => LucideIcons.qrCode,
    'bank' => LucideIcons.landmark,
    _ => LucideIcons.walletCards,
  };
}

/// Prototype "Pay with Points" card (outlined, Sure mark, switch). Paying
/// with points isn't in this release (`points.canRedeem` is false): the
/// switch stays off and a tap explains why.
class _PayWithPointsCard extends StatelessWidget {
  const _PayWithPointsCard({
    required this.points,
    required this.dailyLimit,
    required this.onTap,
  });

  final CheckoutPointsDto points;
  final int? dailyLimit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final f = NumberFormat('#,##0');
    final hint = [
      '${f.format(points.balance)} pts available',
      dailyLimit == null
          ? 'unlimited daily redeem'
          : '${f.format(dailyLimit)} daily limit',
    ].join(' · ');
    return Semantics(
      button: true,
      label: 'Pay with Points, $hint, not available yet',
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: SureRadius.all(SureRadius.large),
            border: Border.all(color: c.boxBorder),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/sure_mark.svg',
                width: 28,
                height: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pay with Points',
                      style: SureText.body3(SureTypography.medium)
                          .copyWith(fontSize: 15, color: c.ink),
                    ),
                    Text(
                      hint,
                      style: SureText.caption1().copyWith(color: c.inkFaded),
                    ),
                  ],
                ),
              ),
              const SureSwitch(value: false, onChanged: null),
            ],
          ),
        ),
      ),
    );
  }
}

/// Time window pill (prototype: 9/4 padding, 12/500, one line; picked is
/// neon-faded with a 1.5 pt dark-green ring).
class _SlotPill extends StatelessWidget {
  const _SlotPill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      button: true,
      selected: selected,
      enabled: onTap != null,
      child: PressScale(
        onTap: onTap,
        scale: 0.96,
        child: AnimatedContainer(
          duration: SureMotion.fast,
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? c.primaryFaded : c.keypad,
            borderRadius: SureRadius.all(SureRadius.pill),
            border: Border.all(
              color: selected ? c.primaryInk : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              maxLines: 1,
              style: SureText.caption1(SureTypography.medium)
                  .copyWith(color: selected ? c.primaryInk : c.ink),
            ),
          ),
        ),
      ),
    );
  }
}

/// Weekday + day cell (prototype: radius 12, neon when picked).
class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.day,
    required this.selected,
    required this.onTap,
  });

  final HomeSetupSlotDayDto day;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final fg = selected ? c.onPrimary : c.ink;
    return Semantics(
      button: true,
      selected: selected,
      label: DateFormat('EEEE d MMMM').format(DateTime.parse(day.date)),
      excludeSemantics: true,
      child: PressScale(
        onTap: onTap,
        scale: 0.96,
        child: AnimatedContainer(
          duration: SureMotion.fast,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          decoration: BoxDecoration(
            color: selected ? c.primary : c.keypad,
            borderRadius: SureRadius.all(SureRadius.medium),
          ),
          child: Column(
            children: [
              Text(
                day.weekday,
                style: TextStyle(
                  fontFamily: SureTypography.fontFamily,
                  fontSize: 11,
                  color: fg.withValues(alpha: 0.75),
                ),
              ),
              Text(
                day.day,
                style: TextStyle(
                  fontFamily: SureTypography.fontFamily,
                  fontSize: 15,
                  fontWeight: SureTypography.bold,
                  color: fg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Design system `Badge` positive / faded / small with a lock.
class _SecureBadge extends StatelessWidget {
  const _SecureBadge();

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Container(
      height: 18,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: c.positiveFaded,
        borderRadius: SureRadius.all(SureRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.lock, size: 10, color: c.positiveInk),
          const SizedBox(width: 3),
          Text(
            'Secure',
            style: TextStyle(
              fontFamily: SureTypography.fontFamily,
              fontSize: 10,
              height: 1,
              fontWeight: SureTypography.medium,
              color: c.positiveInk,
            ),
          ),
        ],
      ),
    );
  }
}

/// Liquid Glass footer: Total and Place Order →.
class _PlaceBar extends StatelessWidget {
  const _PlaceBar({
    required this.total,
    required this.loading,
    required this.quoting,
    required this.enabled,
    required this.onPlace,
  });

  final String? total;
  final bool loading;
  final bool quoting;
  final bool enabled;
  final VoidCallback onPlace;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return BottomBarSurface(
      hairline: c.boxBorderFaded,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total',
                      style: SureText.caption1().copyWith(color: c.inkFaded),
                    ),
                    AnimatedOpacity(
                      duration: SureMotion.fast,
                      opacity: quoting ? 0.4 : 1,
                      // The amount never splits mid-number.
                      child: WordFitText(
                        total ?? '—',
                        style: SureText.featured3().copyWith(color: c.ink),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 150),
                child: SureButton(
                  label: 'Place Order',
                  endIcon: LucideIcons.arrowRight,
                  fullWidth: false,
                  loading: loading,
                  onPressed: enabled ? onPlace : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Design system `OrderConfirmBottomsheet`: green check, "Order Placed!",
/// order number, breakdown, Track order.
class _OrderPlacedBody extends StatelessWidget {
  const _OrderPlacedBody({required this.order});

  final OrderPlacedDto order;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final pts = NumberFormat('#,##0').format(order.estimatedPoints);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: c.positiveFaded,
                shape: BoxShape.circle,
              ),
              child: Icon(LucideIcons.check, size: 28, color: c.positiveInk),
            ),
          ),
          const SizedBox(height: 6),
          Semantics(
            liveRegion: true,
            header: true,
            child: Text(
              'Order Placed!',
              textAlign: TextAlign.center,
              style: SureText.featured3().copyWith(color: c.ink),
            ),
          ),
          Text(
            '#${order.number}',
            textAlign: TextAlign.center,
            style: SureText.caption1().copyWith(color: c.inkFaded),
          ),
          const SizedBox(height: 16),
          PayBreakdown(
            rows: [
              ('Delivery', order.deliveryText, false),
              ('Payment', order.paymentText, false),
              if (order.estimatedPoints > 0)
                ('Points earned', '+$pts pts', true),
            ],
            total: order.total.displayCode,
          ),
          const SizedBox(height: 16),
          SureButton(
            label: 'Track order',
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: 20,
    child: CircularProgressIndicator(
      strokeWidth: 2.5,
      color: context.colors.primaryInk,
    ),
  );
}
