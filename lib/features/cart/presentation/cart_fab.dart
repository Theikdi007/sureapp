import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../design_system/adaptive/window_class.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../catalog/presentation/shop_state.dart';

/// Prototype: the floating bag button (right 20, bottom 108 — above the
/// tab bar) on the tabs and Browse while the bag has items; opens the Cart
/// page.
class WithCartFab extends ConsumerWidget {
  const WithCartFab({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load the bag once so the badge is right after launch.
    ref.watch(bagProvider);
    final count = ref.watch(shopCountsProvider).cartItems;
    final mq = MediaQuery.of(context);
    final compact = WindowClass.fromWidth(mq.size.width).isCompact;
    return Stack(
      children: [
        child,
        Positioned(
          right: 20 + mq.padding.right,
          bottom: compact
              ? (mq.padding.bottom > 0 ? 108 : 99)
              : 24 + mq.padding.bottom,
          child: AnimatedScale(
            scale: count > 0 ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutBack,
            child: CartFab(
              count: count,
              onTap: () => context.push(AppRoutes.cart),
            ),
          ),
        ),
      ],
    );
  }
}
