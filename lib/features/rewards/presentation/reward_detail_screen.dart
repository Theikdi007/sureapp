import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_text_field.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../cart/data/cart_repository.dart';
import '../../catalog/presentation/widgets/catalog_widgets.dart'
    show showApiError;
import '../../loyalty/data/loyalty_repository.dart';
import '../data/rewards_dtos.dart';
import '../data/rewards_repository.dart';
import 'reward_widgets.dart';
import 'rewards_screen.dart';

part 'reward_detail_screen.g.dart';

@riverpod
Future<RewardDetailDto> rewardDetail(Ref ref, String id) =>
    ref.watch(rewardsRepositoryProvider).reward(id);

/// Prototype "REWARD DETAIL". `GET rewards/{id}`, then
/// `POST rewards/{id}/claim` with one of the reward's methods.
class RewardDetailScreen extends ConsumerStatefulWidget {
  const RewardDetailScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<RewardDetailScreen> createState() => _RewardDetailState();
}

class _RewardDetailState extends ConsumerState<RewardDetailScreen> {
  bool _claiming = false;

  /// One key per claim action, reused if that claim is retried.
  IdempotencyKey? _key;
  String? _keyFor;

  @override
  Widget build(BuildContext context) {
    final v = ref.watch(rewardDetailProvider(widget.id));
    final d = v.value;
    return PageScaffold(
      title: 'Reward Detail',
      onRefresh: () async {
        ref.invalidate(rewardDetailProvider(widget.id));
        await ref.read(rewardDetailProvider(widget.id).future);
      },
      bottomBar: d == null
          ? null
          : _ClaimBar(
              label: d.ctaLabel,
              hint: d.hint,
              loading: _claiming,
              onPressed: d.ctaEnabled ? () => _claim(d) : null,
            ),
      slivers: [
        switch (v) {
          AsyncData(:final value) => SliverToBoxAdapter(
            child: _Body(detail: value),
          ),
          AsyncError(:final error) when !v.isLoading => SliverToBoxAdapter(
            child: EmptyState(
              icon: LucideIcons.wifiOff,
              title: "Couldn't load this reward",
              description: error is ApiException ? error.userMessage : null,
              action: SureLink(
                'Try again',
                onTap: () => ref.invalidate(rewardDetailProvider(widget.id)),
              ),
            ),
          ),
          _ => SliverToBoxAdapter(
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
        },
      ],
    );
  }

  Future<void> _claim(RewardDetailDto d) async {
    final methods = d.card.methods;
    var method = methods.isEmpty ? 'direct' : methods.first;
    String? shopCode;
    String? addressId;

    if (methods.contains('delivery') && methods.length > 1) {
      final picked = await showSureSheet<String>(
        context,
        title: 'How would you like it?',
        builder: (_) => _MethodPicker(methods: methods),
      );
      if (picked == null || !mounted) return;
      method = picked;
    }
    if (method == 'delivery') {
      addressId = await showSureSheet<String>(
        context,
        title: 'Deliver to',
        builder: (_) => const _AddressPicker(),
      );
      if (addressId == null || !mounted) return;
    }
    if (method == 'shop') {
      shopCode = await showSureSheet<String>(
        context,
        title: 'Scan to claim',
        maxHeightFactor: 0.9,
        builder: (_) => _ShopScanner(rewardId: d.card.id),
      );
      if (shopCode == null || !mounted) return;
    }

    final action = '$method|$shopCode|$addressId';
    if (_keyFor != action) {
      _key = IdempotencyKey.generate();
      _keyFor = action;
    }
    setState(() => _claiming = true);
    try {
      final r = await ref
          .read(rewardsRepositoryProvider)
          .claim(
            d.card.id,
            method: method,
            shopCode: shopCode,
            addressId: addressId,
            key: _key!,
          );
      _key = null;
      _keyFor = null;
      ref
        ..invalidate(rewardDetailProvider(d.card.id))
        ..invalidate(rewardsHomeProvider)
        ..invalidate(loyaltySummaryProvider);
      if (!mounted) return;
      await showSureSheet<void>(
        context,
        showClose: false,
        builder: (_) => ClaimResultBody(claim: r),
      );
    } on Object catch (e) {
      // A server answer ends the action; a timeout keeps the key for retry.
      if (e is ApiException && e.status != null) {
        _key = null;
        _keyFor = null;
        ref.invalidate(rewardDetailProvider(d.card.id));
      }
      if (mounted) showApiError(context, e);
    } finally {
      if (mounted) setState(() => _claiming = false);
    }
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.detail});

  final RewardDetailDto detail;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final d = detail;
    final r = d.card;
    final method = r.methods.isEmpty ? 'direct' : r.methods.first;
    final typeNote = switch (method) {
      'code' => 'Coupon code reward',
      'shop' => 'Scan to claim at counter',
      _ =>
        'Direct claim${r.methods.contains('delivery') ? ' · Delivery available' : ''}',
    };
    final faded = SureText.caption1().copyWith(color: c.inkFaded);
    final terms = (d.terms ?? '').split('\n');
    final phone = d.supportPhone?.trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Prototype gap 14 under the header (the pinned header row
              // already leaves 4).
              const SizedBox(height: 10),
              RewardHero(
                reward: r,
                height: 190,
                topSize: 11,
                mainSize: 32,
                iconSize: 36,
                largeBadges: true,
                gap: 4,
                detail: true,
                radius: SureRadius.all(SureRadius.larger),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      r.validUntil == null
                          ? ''
                          : 'Expires ${MyanmarTime.format('${r.validUntil!}T00:00:00Z', pattern: 'd MMM y')}',
                      style: faded,
                    ),
                  ),
                  Text(
                    '${fmtPoints(d.claimedCount)} claimed',
                    style: SureText.caption1(SureTypography.medium)
                        .copyWith(color: c.primaryInk),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                r.title,
                style: SureTypography.style(
                  size: 20,
                  weight: SureTypography.bold,
                  height: 1.25,
                  color: c.ink,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                runSpacing: 4,
                children: [
                  PointsCost(cost: r.cost, size: 16),
                  Text(typeNote, style: faded),
                ],
              ),
              if (d.availableCount != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Only ${d.availableCount} left — limited stock',
                  style: SureText.caption1(SureTypography.medium)
                      .copyWith(color: c.critical),
                ),
              ],
              if (phone != null && phone.isNotEmpty) ...[
                const SizedBox(height: 14),
                PressScale(
                  scale: 0.985,
                  semanticLabel: 'Call SureStore care at $phone',
                  onTap: () => launchUrl(
                    Uri(scheme: 'tel', path: phone.replaceAll(' ', '')),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: c.primaryFaded,
                      borderRadius: SureRadius.all(SureRadius.medium),
                    ),
                    child: Row(
                      children: [
                        Icon(LucideIcons.phone, size: 20, color: c.primaryInk),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Need help? Call us at $phone',
                            style: SureTypography.style(
                              size: 13,
                              weight: SureTypography.medium,
                              color: c.primaryInk,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 18),
        // Grey band to the screen edges.
        Container(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
          color: c.pageFaded,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (d.description case final desc? when desc.isNotEmpty) ...[
                _heading(context, 'Description'),
                const SizedBox(height: 12),
                Text(
                  desc,
                  style: SureTypography.style(
                    size: 13,
                    height: 1.6,
                    color: c.inkFaded,
                  ),
                ),
                const SizedBox(height: 18),
              ],
              if (terms.any((t) => t.trim().isNotEmpty)) ...[
                _heading(context, 'Terms and Conditions'),
                const SizedBox(height: 12),
                // A blank line separates the English terms from the
                // Myanmar ones (taller 1.9 line height, as in the
                // prototype). The rule sits 4 into the 8 pt gaps.
                for (final (i, t) in terms.indexed)
                  if (t.trim().isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 12),
                      child: Divider(height: 1, color: c.boxBorderFaded),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _Bullet(
                        t.trim(),
                        height: terms.take(i).any((x) => x.trim().isEmpty)
                            ? 1.9
                            : 1.55,
                      ),
                    ),
              ],
              if (d.shops.isNotEmpty) ...[
                const SizedBox(height: 10),
                _heading(context, 'Available at'),
                const SizedBox(height: 12),
                for (final s in d.shops)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _Bullet(s),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _heading(BuildContext context, String t) => Text(
    t,
    style: SureTypography.style(
      size: 15,
      weight: SureTypography.bold,
      color: context.colors.ink,
    ),
  );
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text, {this.height = 1.55});

  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    final style = SureTypography.style(
      size: 13,
      height: height,
      color: context.colors.inkFaded,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('–', style: style),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: style)),
      ],
    );
  }
}

/// Glass footer: the API's `ctaLabel` button and `hint` under it.
class _ClaimBar extends StatelessWidget {
  const _ClaimBar({
    required this.label,
    required this.hint,
    required this.loading,
    required this.onPressed,
  });

  final String label;
  final String? hint;
  final bool loading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return // Prototype footer: page fill (no glass), top hairline.
    ColoredBox(
      color: c.page,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: c.boxBorderFaded)),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            14,
            20,
            14 + MediaQuery.paddingOf(context).bottom,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SureButton(
                    label: label,
                    loading: loading,
                    onPressed: onPressed,
                  ),
                  if (hint case final h? when h.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      h,
                      textAlign: TextAlign.center,
                      style: SureTypography.style(size: 11, color: c.inkFaded),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MethodPicker extends StatefulWidget {
  const _MethodPicker({required this.methods});

  final List<String> methods;

  @override
  State<_MethodPicker> createState() => _MethodPickerState();
}

class _MethodPickerState extends State<_MethodPicker> {
  late String _m = widget.methods.first;

  static const _labels = {
    'direct': (LucideIcons.store, 'Collect in store', 'Reserved for 14 days'),
    'delivery': (
      LucideIcons.truck,
      'Deliver to me',
      'To one of your addresses',
    ),
    'code': (LucideIcons.ticket, 'Coupon code', 'Shown right away'),
    'shop': (
      LucideIcons.scanQrCode,
      'Claim at a counter',
      "Scan the store's QR",
    ),
  };

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      for (final m in widget.methods)
        if (_labels[m] case (final icon, final title, final desc)) ...[
          SelectRow(
            icon: icon,
            title: title,
            description: desc,
            selected: _m == m,
            onSelect: () => setState(() => _m = m),
          ),
          const SizedBox(height: 10),
        ],
      const SizedBox(height: 6),
      SureButton(
        label: 'Continue',
        onPressed: () => Navigator.of(context).pop(_m),
      ),
    ],
  );
}

class _AddressPicker extends ConsumerStatefulWidget {
  const _AddressPicker();

  @override
  ConsumerState<_AddressPicker> createState() => _AddressPickerState();
}

class _AddressPickerState extends ConsumerState<_AddressPicker> {
  late final _future = ref.read(cartRepositoryProvider).addresses();
  String? _id;

  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: _future,
    builder: (context, snap) {
      final list = snap.data;
      if (snap.hasError) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            "Couldn't load your addresses.",
            textAlign: TextAlign.center,
            style: SureText.body3().copyWith(color: context.colors.inkFaded),
          ),
        );
      }
      if (list == null) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Center(child: CircularProgressIndicator(strokeWidth: 2.5)),
        );
      }
      _id ??=
          (list.where((a) => a.isDefault).firstOrNull ?? list.firstOrNull)?.id;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final a in list) ...[
            SelectRow(
              icon: LucideIcons.mapPinHouse,
              title: a.label,
              description: a.shortLabel,
              selected: _id == a.id,
              onSelect: () => setState(() => _id = a.id),
            ),
            const SizedBox(height: 10),
          ],
          const SizedBox(height: 6),
          SureButton(
            label: 'Deliver here',
            onPressed: _id == null
                ? null
                : () => Navigator.of(context).pop(_id),
          ),
        ],
      );
    },
  );
}

/// Scans the store counter's QR (`shopCode`), or takes it typed. Checks it
/// with `GET rewards/{id}/shops/{shopCode}` before returning it.
class _ShopScanner extends ConsumerStatefulWidget {
  const _ShopScanner({required this.rewardId});

  final String rewardId;

  @override
  ConsumerState<_ShopScanner> createState() => _ShopScannerState();
}

class _ShopScannerState extends ConsumerState<_ShopScanner> {
  final _code = TextEditingController();
  bool _checking = false;
  bool _typing = false;

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  Future<void> _check(String raw) async {
    final code = raw.trim();
    if (code.isEmpty || _checking) return;
    setState(() => _checking = true);
    try {
      final s = await ref
          .read(rewardsRepositoryProvider)
          .checkShop(widget.rewardId, code);
      if (!mounted) return;
      if (!s.allowed) {
        SureToast.show(
          context,
          "This reward can't be claimed at ${s.shopName}.",
          icon: LucideIcons.store,
          color: SureToastColor.critical,
        );
        return;
      }
      HapticFeedback.mediumImpact();
      Navigator.of(context).pop(s.shopCode);
    } on Object catch (e) {
      if (mounted) showApiError(context, e);
    } finally {
      if (mounted) setState(() => _checking = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Point your camera at the QR code on the SureStore counter.",
          style: SureText.body3().copyWith(color: c.inkFaded),
        ),
        const SizedBox(height: 16),
        if (!_typing)
          ClipRRect(
            borderRadius: SureRadius.all(SureRadius.larger),
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  MobileScanner(
                    onDetect: (capture) {
                      final v = capture.barcodes
                          .map((b) => b.rawValue)
                          .whereType<String>()
                          .firstOrNull;
                      if (v != null) _check(v);
                    },
                    errorBuilder: (context, error) => ColoredBox(
                      color: c.keypad,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            error.errorCode ==
                                    MobileScannerErrorCode.permissionDenied
                                ? 'Camera access is off. Allow it in Settings, or type the store code instead.'
                                : "The camera isn't available. Type the store code instead.",
                            textAlign: TextAlign.center,
                            style: SureText.body3().copyWith(color: c.inkFaded),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_checking)
                    const ColoredBox(
                      color: Color(0x66000000),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        else ...[
          SureTextField(
            controller: _code,
            placeholder: 'Store code, e.g. YGN-1',
            code: true,
            startIcon: LucideIcons.store,
            autofocus: true,
            textInputAction: TextInputAction.done,
            onSubmitted: _check,
          ),
          const SizedBox(height: 12),
          SureButton(
            label: 'Check store',
            loading: _checking,
            onPressed: () => _check(_code.text),
          ),
        ],
        const SizedBox(height: 12),
        Center(
          child: SureLink(
            _typing ? 'Scan the QR instead' : 'Type the store code',
            onTap: () => setState(() => _typing = !_typing),
          ),
        ),
      ],
    );
  }
}

/// Prototype "REWARD CLAIM SHEET": the code with copy, or a check, the
/// points used and the API's note.
class ClaimResultBody extends StatelessWidget {
  const ClaimResultBody({super.key, required this.claim});

  final RewardClaimDto claim;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final r = claim;
    final title = switch (r.method) {
      'code' => 'Your coupon code',
      'shop' => 'Claimed at the counter',
      'delivery' => 'On its way to you',
      _ => 'Reward claimed',
    };
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: SureTypography.style(
            size: 20,
            weight: SureTypography.bold,
            color: c.ink,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          [r.title, ?r.shopName].join(' · '),
          textAlign: TextAlign.center,
          style: SureTypography.style(size: 13, color: c.inkFaded),
        ),
        const SizedBox(height: 16),
        if (r.code case final code?)
          _CodeBox(code: code)
        else
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: c.mintFaded,
              shape: BoxShape.circle,
            ),
            child: Icon(LucideIcons.check, size: 30, color: c.mintInk),
          ),
        if (r.claimingId != null) ...[
          const SizedBox(height: 8),
          Text(
            'Claim ${r.claimingId}',
            style: SureText.caption1(SureTypography.medium)
                .copyWith(color: c.inkFaded),
          ),
        ],
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
              const PointsCoin(size: 16),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  '${fmtPoints(r.pointsUsed)} points used · ${fmtPoints(r.balance)} left',
                  style: SureTypography.style(
                    size: 13,
                    weight: SureTypography.medium,
                    color: c.pointsInk,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (r.note.isNotEmpty) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              r.note,
              textAlign: TextAlign.center,
              style: SureTypography.style(
                size: 11,
                height: 1.5,
                color: c.inkFaded,
              ),
            ),
          ),
        ],
        const SizedBox(height: 16),
        SureButton(label: 'Done', onPressed: () => Navigator.of(context).pop()),
      ],
    );
  }
}

class _CodeBox extends StatelessWidget {
  const _CodeBox({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return CustomPaint(
      painter: _DashedRRect(c.inkFaded.withValues(alpha: 0.5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SelectableText(
                code,
                style: SureTypography.style(
                  size: 23,
                  weight: SureTypography.bold,
                  letterSpacing: 23 * 0.06,
                  color: c.ink,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Semantics(
              button: true,
              label: 'Copy code',
              excludeSemantics: true,
              child: PressScale(
                scale: 0.92,
                onTap: () {
                  Clipboard.setData(ClipboardData(text: code));
                  SureToast.show(
                    context,
                    'Code copied — paste it in the partner app',
                    icon: LucideIcons.copy,
                    color: SureToastColor.positive,
                  );
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: c.primaryFaded,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(LucideIcons.copy, size: 18, color: c.primaryInk),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashedRRect extends CustomPainter {
  _DashedRRect(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          const Radius.circular(SureRadius.large),
        ),
      );
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    for (final m in path.computeMetrics()) {
      for (double d = 0; d < m.length; d += 9) {
        canvas.drawPath(m.extractPath(d, d + 5), p);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedRRect old) => old.color != color;
}
