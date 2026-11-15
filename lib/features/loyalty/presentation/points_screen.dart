import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/components/order_components.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_text_field.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../catalog/presentation/widgets/catalog_widgets.dart'
    show showApiError;
import '../../rewards/presentation/reward_widgets.dart';
import '../data/loyalty_dtos.dart';
import '../data/loyalty_repository.dart';
import 'loyalty_widgets.dart';

part 'points_screen.g.dart';

@riverpod
Future<List<PointEntryDto>> pointsHistory(Ref ref, bool club) async {
  final repo = ref.watch(loyaltyRepositoryProvider);
  return (club ? await repo.clubScores() : await repo.points()).items;
}

String _signed(int v) => '${v >= 0 ? '+' : '−'}${fmtPoints(v.abs())}';

String _earnRate(num r) =>
    '${r == r.roundToDouble() ? r.toInt() : r} pts / 100 Ks';

/// Prototype "SHOPPING POINTS". `GET loyalty/summary`, `GET loyalty/points`,
/// `GET loyalty/club-scores`, `GET loyalty/points/{id}`.
class PointsScreen extends ConsumerStatefulWidget {
  const PointsScreen({super.key});

  @override
  ConsumerState<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends ConsumerState<PointsScreen> {
  bool _club = false;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final summary = ref.watch(loyaltySummaryProvider);
    final history = ref.watch(pointsHistoryProvider(_club));
    final s = summary.value;
    final note = SureTypography.style(size: 11, height: 1.5, color: c.inkFaded);

    return PageScaffold(
      title: 'Shopping Points',
      onRefresh: () async {
        ref
          ..invalidate(loyaltySummaryProvider)
          ..invalidate(pointsHistoryProvider(_club));
        await ref.read(loyaltySummaryProvider.future);
      },
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList.list(
            children: [
              // Prototype gap 18 under the header (the header row leaves 4).
              const SizedBox(height: 14),
              if (s != null)
                ShoppingPointsCard(summary: s)
              else if (summary.hasError && !summary.isLoading)
                EmptyState(
                  icon: LucideIcons.wifiOff,
                  title: "Couldn't load your points",
                  description: summary.error is ApiException
                      ? (summary.error! as ApiException).userMessage
                      : null,
                  action: SureLink(
                    'Try again',
                    onTap: () => ref.invalidate(loyaltySummaryProvider),
                  ),
                )
              else
                const SizedBox(
                  height: 150,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2.5),
                  ),
                ),
              if (s != null) ...[
                const SizedBox(height: 12),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: StatTile(
                        label: 'Club Score',
                        value: fmtPoints(s.clubScore),
                        onTap: () => context.push(AppRoutes.tiers),
                      ),
                    ),
                    Expanded(
                      child: StatTile(
                        label: 'Earn Rate',
                        value: _earnRate(s.earnRatePer100Ks),
                        onTap: () => context.push(AppRoutes.tiers),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 18),
              Text(
                "Points stay valid for 2 years from purchase. Transferred points expire after 1 month and don't add Club Score.",
                style: note,
              ),
              const SizedBox(height: 18),
              LoyalActions(
                items: [
                  LoyalAction(
                    LucideIcons.arrowUpRight,
                    'Transfer',
                    () => context.push(AppRoutes.transfer),
                  ),
                  LoyalAction(
                    LucideIcons.plus,
                    'Top up',
                    () => context.push(AppRoutes.topUp),
                  ),
                  LoyalAction(
                    LucideIcons.gift,
                    'Rewards',
                    () => context.go(AppRoutes.rewards),
                  ),
                  LoyalAction(
                    LucideIcons.scanQrCode,
                    'Pay in store',
                    () => showPayInStore(context),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const SectionHeader(
                title: 'History',
                size: SectionHeaderSize.small,
              ),
              const SizedBox(height: 12),
              PillTabs(
                items: const [('points', 'Points'), ('club', 'Club Score')],
                value: _club ? 'club' : 'points',
                onChanged: (v) => setState(() => _club = v == 'club'),
              ),
              if (_club) ...[
                const SizedBox(height: 10),
                Text(
                  "Club Scores come only from your own purchases — transferred and topped-up points don't count.",
                  style: note,
                ),
              ],
              const SizedBox(height: 12),
              _History(
                value: history,
                club: _club,
                onRetry: () => ref.invalidate(pointsHistoryProvider(_club)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Design system `ShoppingPoints` card.
class ShoppingPointsCard extends StatelessWidget {
  const ShoppingPointsCard({super.key, required this.summary, this.onHistory});

  final LoyaltySummaryDto summary;

  /// Shows the card's full-width "View Point History" button (the Profile
  /// tab's version); the Shopping Points screen hides it.
  final VoidCallback? onHistory;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = summary;
    final cap = SureText.caption1().copyWith(color: c.inkFaded);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: c.raised,
        borderRadius: SureRadius.all(SureRadius.xl),
        border: Border.all(color: c.border),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // Wraps instead of overflowing with large text or narrow panes.
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        'Shopping Points',
                        style: SureTypography.style(
                          size: 16,
                          height: 1.5,
                          weight: SureTypography.bold,
                          color: c.ink,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: c.primaryFaded,
                          borderRadius: SureRadius.all(SureRadius.pill),
                        ),
                        child: Text(
                          s.tierLabel.toUpperCase(),
                          style: SureTypography.style(
                            size: 10,
                            height: 1.4,
                            weight: SureTypography.bold,
                            letterSpacing: 0.6,
                            color: c.primaryInk,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (s.earnedThisMonth > 0) ...[
                  const SizedBox(width: 8),
                  // Its own width (not half the row, which wrapped the tier
                  // chip); capped so large text still fits.
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.4,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: StatusBadge(
                        label:
                            '+${fmtPoints(s.earnedThisMonth)} pts this month',
                        color: 'positive',
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          Divider(height: 1, color: c.borderFaded),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                TierCoin(tier: s.tier),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Available Balance', style: cap),
                      // Number and "pts" 3 apart, centred on each other.
                      Wrap(
                        spacing: 3,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            fmtPoints(s.points),
                            style: SureText.featured2().copyWith(color: c.ink),
                          ),
                          Text('pts', style: cap),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Equivalent value', style: cap),
                    Text(
                      '${fmtPoints(s.equivalentMmk)} MMK',
                      style: SureText.caption1(SureTypography.medium)
                          .copyWith(color: c.ink),
                    ),
                    Text('1 pt = 1 MMK', style: cap),
                  ],
                ),
              ],
            ),
          ),
          if (onHistory != null) ...[
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SureButton(
                label: 'View Point History',
                size: SureButtonSize.medium,
                onPressed: onHistory,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _History extends StatelessWidget {
  const _History({
    required this.value,
    required this.club,
    required this.onRetry,
  });

  final AsyncValue<List<PointEntryDto>> value;
  final bool club;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return switch (value) {
      AsyncData(value: final list) when list.isEmpty => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          'No history yet',
          textAlign: TextAlign.center,
          style: SureText.body3().copyWith(color: c.inkFaded),
        ),
      ),
      AsyncData(value: final list) => Container(
        decoration: BoxDecoration(
          borderRadius: SureRadius.all(SureRadius.large),
          border: Border.all(color: c.boxBorder),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            for (var i = 0; i < list.length; i++) ...[
              if (i > 0) Divider(height: 1, color: c.boxBorderFaded),
              _HistoryRow(entry: list[i], club: club),
            ],
          ],
        ),
      ),
      AsyncError() when !value.isLoading => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(child: SureLink('Try again', onTap: onRetry)),
      ),
      _ => const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2.5)),
      ),
    };
  }
}

/// Design system `ListLayout` row: arrow, label, date, signed amount.
class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.entry, required this.club});

  final PointEntryDto entry;
  final bool club;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final e = entry;
    final plus = e.amount >= 0;
    final canOpen = e.opens && e.transactionId != null;
    return InkWell(
      onTap: canOpen
          ? () => showSureSheet<void>(
              context,
              title: 'Transaction Detail',
              builder: (_) => _TxnBody(id: e.transactionId!, entry: e),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(
              plus ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight,
              size: 18,
              color: c.ink,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: SureText.body3(SureTypography.medium)
                        .copyWith(color: c.ink),
                  ),
                  Text(
                    MyanmarTime.format(e.at, pattern: 'd MMM y'),
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // ListLayout trailing: inherits the 16 px body size, 750.
            Text(
              _signed(e.amount),
              style: SureTypography.style(
                size: 16,
                weight: SureTypography.bold,
                color: plus ? c.positive : c.critical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Prototype "POINT TXN DETAIL SHEET" (`GET loyalty/points/{id}`).
class _TxnBody extends ConsumerStatefulWidget {
  const _TxnBody({required this.id, required this.entry});

  final String id;
  final PointEntryDto entry;

  @override
  ConsumerState<_TxnBody> createState() => _TxnBodyState();
}

class _TxnBodyState extends ConsumerState<_TxnBody> {
  late final _future = ref
      .read(loyaltyRepositoryProvider)
      .pointDetail(widget.id);

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return FutureBuilder(
      future: _future,
      builder: (context, snap) {
        final d = snap.data;
        final amount = d?.amount ?? widget.entry.amount;
        final plus = amount >= 0;
        final color = plus ? c.positive : c.critical;
        final rows = [
          PointDetailRowDto(
            label: 'Date',
            value: MyanmarTime.format(d?.at ?? widget.entry.at),
          ),
          ...?d?.rows,
        ];
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 6),
            Center(
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: plus ? c.positiveFaded : c.criticalFaded,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  plus ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight,
                  size: 22,
                  color: color,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _signed(amount),
              textAlign: TextAlign.center,
              style: SureTypography.style(
                size: 28,
                height: 1,
                weight: SureTypography.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              d?.unit ?? 'Shopping Points',
              textAlign: TextAlign.center,
              style: SureTypography.style(size: 13, color: c.inkFaded),
            ),
            const SizedBox(height: 16),
            Divider(height: 1, color: c.boxBorderFaded),
            const SizedBox(height: 14),
            if (snap.hasError)
              Text(
                snap.error is ApiException
                    ? (snap.error! as ApiException).userMessage
                    : "Couldn't load the details.",
                style: SureText.body3().copyWith(color: c.inkFaded),
              ),
            for (final r in rows)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r.label,
                      style: SureTypography.style(size: 13, color: c.inkFaded),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        r.value,
                        textAlign: TextAlign.right,
                        style: SureTypography.style(
                          size: 13,
                          weight: SureTypography.medium,
                          color: c.ink,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (d == null && !snap.hasError)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                ),
              ),
            if (d?.note case final n? when n.isNotEmpty)
              Text(
                n,
                style: SureTypography.style(
                  size: 11,
                  height: 1.5,
                  color: c.inkFaded,
                ),
              ),
          ],
        );
      },
    );
  }
}

/// Prototype "MEMBER QR SHEET (Pay in store)". `GET loyalty/member-qr`
/// (refetched when it expires) and, while open, `GET
/// loyalty/counter-requests`; a cashier's request is approved with the
/// member's password (`POST loyalty/counter-requests/confirm`).
Future<void> showPayInStore(BuildContext context) => showSureSheet<void>(
  context,
  showClose: false,
  maxHeightFactor: 0.9,
  builder: (_) => const _PayInStore(),
);

class _PayInStore extends ConsumerStatefulWidget {
  const _PayInStore();

  @override
  ConsumerState<_PayInStore> createState() => _PayInStoreState();
}

class _PayInStoreState extends ConsumerState<_PayInStore> {
  MemberQrDto? _qr;
  Object? _error;
  CounterRequestDto? _request;
  Timer? _refresh;
  Timer? _poll;
  final _password = TextEditingController();
  bool _approving = false;
  IdempotencyKey? _key;

  @override
  void initState() {
    super.initState();
    _load();
    _poll = Timer.periodic(const Duration(seconds: 5), (_) => _checkCounter());
  }

  @override
  void dispose() {
    _refresh?.cancel();
    _poll?.cancel();
    _password.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final qr = await ref.read(loyaltyRepositoryProvider).memberQr();
      if (!mounted) return;
      setState(() {
        _qr = qr;
        _error = null;
      });
      final left = DateTime.parse(qr.expiresAt).difference(DateTime.now());
      _refresh?.cancel();
      _refresh = Timer(
        left > const Duration(seconds: 5) ? left : const Duration(seconds: 5),
        _load,
      );
    } on Object catch (e) {
      if (mounted) setState(() => _error = e);
    }
  }

  Future<void> _checkCounter() async {
    if (_request != null) return;
    try {
      final list = await ref.read(loyaltyRepositoryProvider).counterRequests();
      if (mounted && list.isNotEmpty) setState(() => _request = list.first);
    } on Object {
      // Polling: try again on the next tick.
    }
  }

  Future<void> _approve() async {
    final r = _request;
    if (r == null || _password.text.isEmpty || _approving) return;
    _key ??= IdempotencyKey.generate();
    setState(() => _approving = true);
    try {
      final res = await ref
          .read(loyaltyRepositoryProvider)
          .counterConfirm(code: r.code, password: _password.text, key: _key!);
      ref.invalidate(loyaltySummaryProvider);
      if (!mounted) return;
      Navigator.of(context).pop();
      SureToast.show(
        context,
        '${fmtPoints(res.pointsUsed)} points used · ${fmtPoints(res.balance)} left',
        icon: LucideIcons.circleCheck,
        color: SureToastColor.positive,
      );
    } on Object catch (e) {
      if (e is ApiException && e.status != null) _key = null;
      if (!mounted) return;
      showApiError(context, e);
      if (e is ApiException && e.code == 'isure.rejected') {
        setState(() => _request = null);
      }
    } finally {
      if (mounted) setState(() => _approving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final qr = _qr;
    final r = _request;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pay in store',
            style: SureTypography.style(
              size: 20,
              weight: SureTypography.bold,
              color: c.ink,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Show this QR at any SureStore counter',
            style: SureTypography.style(size: 13, color: c.inkFaded),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              // QR stays dark-on-white in dark mode so scanners read it.
              color: Colors.white,
              borderRadius: SureRadius.all(SureRadius.larger),
              border: Border.all(color: c.boxBorder),
            ),
            child: SizedBox.square(
              dimension: 168,
              child: qr != null
                  ? QrImageView(
                      data: qr.payload,
                      padding: EdgeInsets.zero,
                      semanticsLabel: 'Member QR code',
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Color(0xFF14161B),
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Color(0xFF14161B),
                      ),
                    )
                  : _error != null
                  ? Center(child: SureLink('Try again', onTap: _load))
                  : const Center(
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    ),
            ),
          ),
          if (_error case final e?) ...[
            const SizedBox(height: 8),
            Text(
              e is ApiException ? e.userMessage : "Couldn't load your QR.",
              textAlign: TextAlign.center,
              style: SureText.caption1().copyWith(color: c.critical),
            ),
          ],
          if (qr != null) ...[
            const SizedBox(height: 16),
            Text(
              qr.memberName,
              style: SureTypography.style(
                size: 15,
                weight: SureTypography.bold,
                color: c.ink,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${qr.tierLabel} Member · ${qr.phoneDisplay}',
              style: SureTypography.style(size: 13, color: c.inkFaded),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: c.pointsFaded,
                borderRadius: SureRadius.all(SureRadius.medium),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(LucideIcons.coins, size: 18, color: c.points),
                  const SizedBox(width: 8),
                  Text(
                    '${fmtPoints(qr.points)} pts available to redeem',
                    style: SureTypography.style(
                      size: 13,
                      weight: SureTypography.medium,
                      color: c.pointsInk,
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          if (r != null)
            OutlinedCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${r.shopName ?? 'The counter'} asks to use ${fmtPoints(r.points)} points',
                    style: SureText.body3(SureTypography.bold)
                        .copyWith(color: c.ink),
                  ),
                  Text(
                    'For a ${fmtPoints(r.discountMmk)} MMK discount. Enter your password to approve.',
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
                  const SizedBox(height: 12),
                  SureTextField(
                    controller: _password,
                    placeholder: 'Password',
                    startIcon: LucideIcons.lock,
                    obscureText: true,
                    onSubmitted: (_) => _approve(),
                  ),
                  const SizedBox(height: 12),
                  SureButton(
                    label: 'Approve',
                    loading: _approving,
                    onPressed: _approve,
                  ),
                ],
              ),
            )
          else
            Text(
              'Code refreshes automatically',
              style: SureTypography.style(size: 11, color: c.inkFaded),
            ),
        ],
      ),
    );
  }
}
