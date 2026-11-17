import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../glass/glass_surface.dart';
import '../glass/liquid_glass.dart';
import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

enum SureToastColor { primary, positive, neutral, critical }

/// The prototype's `flash()` toast: a design system `Alert` pinned 16 pt
/// from the sides just under the status bar, sliding up into place, gone
/// after ~2.4 s. One at a time.
abstract final class SureToast {
  static OverlayEntry? _entry;
  static Timer? _timer;

  static void show(
    BuildContext context,
    String message, {
    IconData icon = LucideIcons.circleCheck,
    SureToastColor color = SureToastColor.primary,
  }) {
    hide();
    final overlay = Overlay.of(context, rootOverlay: true);
    _entry = OverlayEntry(
      builder: (context) =>
          _ToastView(message: message, icon: icon, color: color),
    );
    overlay.insert(_entry!);
    _timer = Timer(const Duration(milliseconds: 2400), hide);
  }

  static void hide() {
    _timer?.cancel();
    _timer = null;
    _entry?.remove();
    _entry = null;
  }
}

class _ToastView extends StatelessWidget {
  const _ToastView({
    required this.message,
    required this.icon,
    required this.color,
  });

  final String message;
  final IconData icon;
  final SureToastColor color;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final (bg, border, fg) = switch (color) {
      SureToastColor.primary => (
        c.primaryFaded,
        c.primaryFadedBorder,
        c.primaryInk,
      ),
      SureToastColor.positive => (
        c.positiveFaded,
        c.positiveInk.withValues(alpha: 0.3),
        c.positiveInk,
      ),
      SureToastColor.critical => (
        c.criticalFaded,
        c.criticalInk,
        c.criticalInk,
      ),
      SureToastColor.neutral => (c.neutralFaded, c.borderFaded, c.ink),
    };
    final top = MediaQuery.paddingOf(context).top + SureSpace.x2;
    final content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: SureSpace.x3,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Icon(icon, size: 20, color: fg),
          ),
          const SizedBox(width: SureSpace.x3),
          Expanded(
            child: Text(
              message,
              style: SureText.body3().copyWith(color: c.inkFaded),
            ),
          ),
        ],
      ),
    );
    return Positioned(
      left: SureSpace.x4,
      right: SureSpace.x4,
      top: top,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        builder: (context, t, child) => Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 12 * (1 - t)),
            child: child,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Semantics(
              liveRegion: true,
              // iOS 26: glass tinted with the status colour; elsewhere the
              // prototype's solid alert.
              child: LiquidGlassSwitch(
                liquid: (_) => GlassSurface(
                  borderRadius: SureRadius.all(SureRadius.medium),
                  tint: bg.withValues(alpha: 0.88),
                  solidColor: bg,
                  child: content,
                ),
                otherwise: (_) => Material(
                  color: bg,
                  shape: RoundedRectangleBorder(
                    borderRadius: SureRadius.all(SureRadius.medium),
                    side: BorderSide(color: border),
                  ),
                  child: content,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
