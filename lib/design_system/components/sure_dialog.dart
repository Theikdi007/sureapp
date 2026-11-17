import 'package:flutter/material.dart';

import '../glass/glass_surface.dart';
import '../glass/liquid_glass.dart';
import '../theme/app_theme.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

/// A confirm dialog (title, content, actions). The Material [AlertDialog]
/// everywhere; on iOS 26 the same layout on a Liquid Glass panel.
///
/// Action buttons use `primary-ink`: the theme's default (the neon brand
/// colour) as text on a light dialog was hard to read.
class SureDialog extends StatelessWidget {
  const SureDialog({
    super.key,
    required this.title,
    this.content,
    required this.actions,
  });

  final Widget title;
  final Widget? content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: c.primaryInk,
          textStyle: SureText.body3(SureTypography.bold),
        ),
      ),
      child: LiquidGlassSwitch(
        liquid: (context) => Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          child: GlassSurface(
            borderRadius: SureRadius.all(SureRadius.xl2),
            padding: const EdgeInsets.fromLTRB(24, 24, 16, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: DefaultTextStyle.merge(
                    style: SureText.body1(
                      SureTypography.bold,
                    ).copyWith(color: c.ink),
                    child: title,
                  ),
                ),
                if (content != null) ...[
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: DefaultTextStyle.merge(
                      style: SureText.body3().copyWith(color: c.inkFaded),
                      child: content!,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                OverflowBar(
                  alignment: MainAxisAlignment.end,
                  spacing: 8,
                  children: actions,
                ),
              ],
            ),
          ),
        ),
        otherwise: (_) =>
            AlertDialog(title: title, content: content, actions: actions),
      ),
    );
  }
}
