import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// Text that wraps only between words.
///
/// At large text sizes a word can be wider than its line ("Transfer" under a
/// 48 pt icon, a balance like "847,149"), and plain [Text] then breaks it
/// mid-word ("Transfe" / "r"). Here the whole text shrinks instead, just
/// enough for its widest word to fit, so numbers and words stay whole while
/// the rest still follows the member's text size.
///
/// Needs a bounded width (inside [Expanded], [Flexible], a sized box, …);
/// without one it behaves like [Text].
class WordFitText extends StatelessWidget {
  const WordFitText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
  });

  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final scaler = MediaQuery.textScalerOf(context);
    return LayoutBuilder(
      builder: (context, box) {
        var effective = scaler;
        if (box.hasBoundedWidth) {
          final resolved = DefaultTextStyle.of(context).style.merge(style);
          final widest = _widestWord(
            resolved,
            scaler,
            Directionality.of(context),
          );
          if (widest > box.maxWidth && widest > 0) {
            final size = resolved.fontSize ?? 14;
            // Slightly under the exact fit, so rounding can't break it.
            final factor = scaler.scale(size) / size * box.maxWidth / widest;
            effective = TextScaler.linear(factor * 0.98);
          }
        }
        return Text(
          data,
          style: style,
          textAlign: textAlign,
          maxLines: maxLines,
          textScaler: effective,
        );
      },
    );
  }

  double _widestWord(
    TextStyle style,
    TextScaler scaler,
    TextDirection direction,
  ) {
    var widest = 0.0;
    for (final word in data.split(RegExp(r'\s+'))) {
      if (word.isEmpty) continue;
      final painter = TextPainter(
        text: TextSpan(text: word, style: style),
        textDirection: direction,
        textScaler: scaler,
        maxLines: 1,
      )..layout();
      widest = math.max(widest, painter.width);
      painter.dispose();
    }
    return widest;
  }
}
