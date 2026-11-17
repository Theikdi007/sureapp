import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/router/routes.dart';
import '../../../design_system/components/bottom_bar_surface.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_image.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/components/word_fit_text.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../catalog/presentation/shop_state.dart';
import '../data/checkout_dtos.dart';

/// Prototype "My Cart" sheet (opens after Add to bag). `GET cart`,
/// `PATCH/DELETE cart/items/{lineId}`.
Future<void> showCartSheet(BuildContext context) => showSureSheet<void>(
  context,
  title: 'My Cart',
  builder: (context) => const _CartSheetBody(),
);

class _CartSheetBody extends ConsumerWidget {
  const _CartSheetBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bag = ref.watch(bagProvider);
    final cart = bag.value;
    if (cart == null) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Center(child: _Spinner()),
      );
    }
    if (cart.lines.isEmpty) return const _EmptyBag();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            // No automatic safe-area padding inside the sheet.
            padding: EdgeInsets.zero,
            itemCount: cart.lines.length,
            separatorBuilder: (_, _) => const SizedBox(height: 14),
            itemBuilder: (_, i) =>
                CartLineRow(line: cart.lines[i], imageSize: 52, stepperGap: 6),
          ),
        ),
        const SizedBox(height: 14),
        Divider(height: 1, color: context.colors.boxBorderFaded),
        const SizedBox(height: 14),
        _TotalRow(
          total: cart.subtotal.displayCode,
          onCheckout: () {
            Navigator.of(context).pop();
            context.push(AppRoutes.checkout);
          },
        ),
      ],
    );
  }
}

class _EmptyBag extends StatelessWidget {
  const _EmptyBag();

  @override
  Widget build(BuildContext context) => EmptyState(
    icon: LucideIcons.shoppingBag,
    title: 'Your bag is empty',
    description: 'Add products to get started',
    action: SureButton(
      label: 'Browse products',
      fullWidth: false,
      onPressed: () {
        Navigator.of(context).maybePop();
        context.push(AppRoutes.products);
      },
    ),
  );
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.total, required this.onCheckout});

  final String total;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: SureText.caption1().copyWith(color: c.inkFaded),
              ),
              WordFitText(
                total,
                style: SureText.featured3().copyWith(color: c.ink),
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 140),
          child: SureButton(
            label: 'Checkout',
            fullWidth: false,
            onPressed: onCheckout,
          ),
        ),
      ],
    );
  }
}

/// One bag line: photo, title, unit price · variant, qty stepper, remove.
class CartLineRow extends ConsumerStatefulWidget {
  const CartLineRow({
    super.key,
    required this.line,
    this.imageSize = 64,
    this.stepperGap = 8,
  });

  final CartLineDto line;
  final double imageSize;

  /// Space above the qty stepper (prototype: 6 in the sheet, 8 on the page).
  final double stepperGap;

  @override
  ConsumerState<CartLineRow> createState() => _CartLineRowState();
}

class _CartLineRowState extends ConsumerState<CartLineRow> {
  bool _busy = false;

  Future<void> _run(Future<void> Function() action) async {
    setState(() => _busy = true);
    try {
      await action();
    } on Object catch (e) {
      if (mounted) {
        SureToast.show(
          context,
          e is ApiException ? e.userMessage : 'Something went wrong.',
          icon: LucideIcons.circleAlert,
          color: SureToastColor.critical,
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final l = widget.line;
    final meta = [
      l.unitPrice.display,
      if (l.variantLabel != null && l.variantLabel!.isNotEmpty) l.variantLabel!,
    ].join(' · ');
    return AnimatedOpacity(
      duration: SureMotion.fast,
      opacity: _busy ? 0.6 : 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: SureRadius.all(SureRadius.medium),
            child: SizedBox.square(
              dimension: widget.imageSize,
              child: ColoredBox(color: c.keypad, child: SureImage(l.imageUrl)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: SureText.body3(SureTypography.medium)
                      .copyWith(color: c.ink),
                ),
                const SizedBox(height: 2),
                Text(
                  meta,
                  style: SureText.caption1().copyWith(color: c.inkFaded),
                ),
                if (l.problem != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    l.problem!,
                    style: SureText.caption1().copyWith(color: c.criticalInk),
                  ),
                ],
                SizedBox(height: widget.stepperGap),
                QtyStepper(
                  qty: l.qty,
                  busy: _busy,
                  onChanged: (q) => _run(
                    () => ref.read(bagProvider.notifier).setQty(l.id, q),
                  ),
                ),
              ],
            ),
          ),
          Semantics(
            button: true,
            label: 'Remove ${l.title}',
            excludeSemantics: true,
            child: IconButton(
              onPressed: _busy
                  ? null
                  : () =>
                        _run(() => ref.read(bagProvider.notifier).remove(l.id)),
              icon: Icon(LucideIcons.trash2, size: 16, color: c.critical),
            ),
          ),
        ],
      ),
    );
  }
}

/// Prototype "Cart" page (from the floating bag button): outlined line
/// cards and a glass Total / Checkout bar.
class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.colors;
    final bag = ref.watch(bagProvider);
    final cart = bag.value;
    final count = cart?.itemCount ?? 0;
    return PageScaffold(
      headerGap: 16,
      title: 'My Cart',
      subtitle: cart == null
          ? null
          : count == 0
          ? 'No items yet'
          : '$count ${count == 1 ? 'item' : 'items'}',
      onRefresh: () async {
        ref.invalidate(bagProvider);
        await ref.read(bagProvider.future);
      },
      bottomBar: cart == null || cart.lines.isEmpty
          ? null
          : BottomBarSurface(
              hairline: c.boxBorderFaded,
              child: _TotalRow(
                total: cart.subtotal.displayCode,
                onCheckout: () => context.push(AppRoutes.checkout),
              ),
            ),
      slivers: [
        if (cart == null)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 48),
              child: Center(child: _Spinner()),
            ),
          )
        else if (cart.lines.isEmpty)
          const SliverToBoxAdapter(child: _EmptyBag())
        else
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.separated(
              itemCount: cart.lines.length,
              separatorBuilder: (_, _) => const SizedBox(height: 16),
              itemBuilder: (_, i) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: SureRadius.all(SureRadius.large),
                  border: Border.all(color: c.boxBorder),
                ),
                child: CartLineRow(line: cart.lines[i]),
              ),
            ),
          ),
      ],
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
