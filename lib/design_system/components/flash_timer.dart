import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../tokens/sure_typography.dart';

/// Design system `FlashTimer`: HH · MM · SS on neon chips (radius 6,
/// 14/750 tabular digits) separated by two-dot colons. Counts down to
/// [endsAt] (UTC from the API); shows 00:00:00 once it passes.
class FlashTimer extends StatefulWidget {
  const FlashTimer({super.key, required this.endsAt});

  final DateTime endsAt;

  @override
  State<FlashTimer> createState() => _FlashTimerState();
}

class _FlashTimerState extends State<FlashTimer> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    var left = widget.endsAt.difference(DateTime.now().toUtc());
    if (left.isNegative) left = Duration.zero;
    String two(int v) => v.toString().padLeft(2, '0');
    final h = two(left.inHours.clamp(0, 99));
    final m = two(left.inMinutes % 60);
    final s = two(left.inSeconds % 60);

    Widget seg(String v) => Container(
      constraints: const BoxConstraints(minWidth: 24),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: c.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        v,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: SureTypography.fontFamily,
          fontSize: 14,
          height: 1,
          fontWeight: SureTypography.bold,
          color: c.onPrimary,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );

    Widget dots() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 2; i++) ...[
            if (i > 0) const SizedBox(height: 3),
            Container(
              width: 2,
              height: 2,
              decoration: BoxDecoration(
                color: c.primary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );

    return Semantics(
      label: 'Ends in ${left.inHours} hours ${left.inMinutes % 60} minutes',
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [seg(h), dots(), seg(m), dots(), seg(s)],
      ),
    );
  }
}
