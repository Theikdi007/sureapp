import 'package:flutter/widgets.dart';

/// `--space-*` (4 pt grid).
abstract final class SureSpace {
  static const double x0 = 0;
  static const double x1 = 4;
  static const double x2 = 8;
  static const double x3 = 12;
  static const double x4 = 16;
  static const double x5 = 20;
  static const double x6 = 24;
  static const double x7 = 28;
  static const double x8 = 32;
  static const double x10 = 40;
  static const double x12 = 48;
  static const double x14 = 56;
  static const double x16 = 64;
}

/// `--radius-*`.
abstract final class SureRadius {
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double larger = 20;
  static const double xl = 24;
  static const double xl2 = 28;
  static const double xl3 = 32;
  static const double pill = 9999;

  static BorderRadius all(double r) => BorderRadius.all(Radius.circular(r));
}

/// `--shadow-*`. Pass `context.colors.shadow` (the float/glass strength;
/// cards use half of it).
abstract final class SureShadow {
  static List<BoxShadow> card(Color c) => [
    BoxShadow(
      color: c.withValues(alpha: c.a * 0.5),
      offset: const Offset(0, 4),
      blurRadius: 16,
    ),
  ];

  static List<BoxShadow> float(Color c) => [
    BoxShadow(color: c, offset: const Offset(0, 8), blurRadius: 24),
  ];

  static List<BoxShadow> glass(Color c) => [
    BoxShadow(color: c, offset: const Offset(0, 8), blurRadius: 40),
  ];
}

/// Motion durations.
abstract final class SureMotion {
  static const fast = Duration(milliseconds: 150);
  static const medium = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 400);
}

/// Hit target and component sizes.
abstract final class SureSize {
  static const double minTap = 48;
  static const double navBar = 60;
  static const double railWidth = 88;
  static const double railExtendedWidth = 240;
  static const double listPaneWidth = 360;
  static const double maxContentWidth = 840;
}
