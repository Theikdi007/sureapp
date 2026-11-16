import 'package:flutter/material.dart';

/// `--font-styles-*` mapped to Material text roles, in the fonts the
/// prototype actually renders: **IBM Plex Sans** for text and **Outfit** for
/// headings. The prototype's rule: weight ≥ 700 at 18 px or larger is set in
/// Outfit (featured-*, page titles, numbers), everything else in IBM Plex
/// Sans. Both are SIL OFL fonts bundled in assets/fonts.
abstract final class SureTypography {
  /// Body font; also the app-wide default family.
  static const String fontFamily = 'IBMPlexSans';

  /// Heading font.
  static const String titleFamily = 'Outfit';

  // Design system weights. Outfit's 700/800/900 assets are cut at wght
  // 750/850/900, the prototype's bold/black; IBM Plex tops out at 700 like
  // the prototype's loaded weights.
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const bold = FontWeight.w700; // design 750
  static const black = FontWeight.w800; // design 850
  static const heavy = FontWeight.w900;

  /// The prototype's family rule for a size and weight.
  static String familyFor(double size, FontWeight weight) =>
      weight.value >= 700 && size >= 18 ? titleFamily : fontFamily;

  /// A style in the right family for its size and weight.
  static TextStyle style({
    required double size,
    FontWeight weight = regular,
    double? height,
    double letterSpacing = 0,
    Color? color,
  }) => TextStyle(
    fontFamily: familyFor(size, weight),
    fontSize: size,
    height: height,
    fontWeight: weight,
    letterSpacing: letterSpacing,
    color: color,
  );

  static const _regular = regular;
  static const _medium = medium;
  static const _bold = bold;
  static const _extraBold = black;

  static TextStyle _s(double size, double line, FontWeight w) =>
      style(size: size, weight: w, height: line / size);

  /// IBM Plex Sans' `line-height: normal`.
  static const double normalLineHeight = 1.3;

  static TextTheme textTheme(Color ink) => TextTheme(
    displayLarge: _s(56, 60, _extraBold), // title-4
    displayMedium: _s(48, 52, _extraBold), // title-5
    displaySmall: _s(36, 40, _extraBold), // title-6
    headlineLarge: _s(32, 40, _bold), // featured-1
    headlineMedium: _s(24, 32, _bold), // featured-2
    headlineSmall: _s(20, 28, _bold), // featured-3
    titleLarge: _s(20, 28, _bold), // featured-3
    titleMedium: _s(18, 28, _medium), // body-1 medium
    titleSmall: _s(16, 24, _medium), // body-2 medium
    bodyLarge: _s(16, 24, _regular), // body-2
    // Material's default text style for every `Text` without its own
    // height. The prototype leaves line-height at `normal` there: IBM Plex
    // Sans' own 1.3 (ascender 1025 + descender 275). It must be explicit:
    // ThemeData merges this over Material 3's 1.43, so null keeps 1.43
    // (rows came out ~2 pt taller per line).
    bodyMedium: style(size: 14, height: normalLineHeight), // body-3
    bodySmall: _s(12, 16, _regular), // caption-1
    labelLarge: _s(14, 20, _medium), // body-3 medium
    labelMedium: _s(12, 16, _medium), // caption-1 medium
    labelSmall: _s(10, 12, _medium), // caption-2 medium
  ).apply(bodyColor: ink, displayColor: ink);
}

/// Design system `Text` variants (`variant` + `weight`), for components that
/// follow the prototype exactly rather than Material text roles.
abstract final class SureText {
  static TextStyle _v(double size, double line, FontWeight w) =>
      SureTypography.style(size: size, weight: w, height: line / size);

  static TextStyle featured1([FontWeight w = SureTypography.bold]) =>
      _v(32, 40, w);
  static TextStyle featured2([FontWeight w = SureTypography.bold]) =>
      _v(24, 32, w);
  static TextStyle featured3([FontWeight w = SureTypography.bold]) =>
      _v(20, 28, w);
  static TextStyle body1([FontWeight w = SureTypography.regular]) =>
      _v(18, 28, w);
  static TextStyle body2([FontWeight w = SureTypography.regular]) =>
      _v(16, 24, w);
  static TextStyle body3([FontWeight w = SureTypography.regular]) =>
      _v(14, 20, w);
  static TextStyle caption1([FontWeight w = SureTypography.regular]) =>
      _v(12, 16, w);
  static TextStyle caption2([FontWeight w = SureTypography.medium]) =>
      _v(10, 12, w);
}
