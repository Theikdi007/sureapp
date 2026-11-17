import 'package:flutter/material.dart';

/// Brand palette (design-ref/prototype/tokens-extracted.css, `--sure-*`).
abstract final class SureBrand {
  static const neon = Color(0xFFA0F04B);
  static const neonPress = Color(0xFF8EDC3A);
  static const darkGreen = Color(0xFF14372D);
  static const fresh = Color(0xFF73D755);
  static const electric = Color(0xFF0F50F5);
  static const coolWhite = Color(0xFFF4FFF3);
  static const warmWhite = Color(0xFFEFEEEA);
  static const darkGray = Color(0xFF1C1C1C);
  static const midGray = Color(0xFF757572);
  static const lightGray = Color(0xFFBFBFBB);
}

/// Semantic colors. Read with `context.colors`.
@immutable
class SureColors extends ThemeExtension<SureColors> {
  const SureColors({
    required this.page,
    required this.pageFaded,
    required this.raised,
    required this.ink,
    required this.inkFaded,
    required this.inkPlaceholder,
    required this.primary,
    required this.primaryPress,
    required this.primaryFaded,
    required this.primaryFadedBorder,
    required this.keypad,
    required this.navInk,
    required this.dotInactive,
    required this.onPrimary,
    required this.primaryInk,
    required this.neutralFaded,
    required this.border,
    required this.borderFaded,
    required this.borderPrimary,
    required this.critical,
    required this.criticalInk,
    required this.criticalFaded,
    required this.positive,
    required this.positiveInk,
    required this.positiveFaded,
    required this.warning,
    required this.warningInk,
    required this.warningFaded,
    required this.disabled,
    required this.disabledInk,
    required this.glassTint,
    required this.glassRim,
    required this.scrim,
    required this.shadow,
    required this.badge,
    required this.onBadge,
    required this.points,
    required this.pointsInk,
    required this.pointsFaded,
    required this.mintInk,
    required this.mintFaded,
    required this.hero,
    required this.onHeroFaded,
    required this.card,
    required this.descriptionPanel,
    required this.ratingBarTrack,
    required this.neutral,
    required this.boxBorder,
    required this.boxBorderFaded,
  });

  final Color page;
  final Color pageFaded;
  final Color raised;
  final Color ink;
  final Color inkFaded;

  /// Placeholder digits (prototype phone field).
  final Color inkPlaceholder;
  final Color primary;
  final Color primaryPress;
  final Color primaryFaded;
  final Color primaryFadedBorder;

  /// On-screen number keys.
  final Color keypad;

  /// Unselected tab bar icon/label.
  final Color navInk;

  /// Inactive carousel dot.
  final Color dotInactive;
  final Color onPrimary;

  /// Primary-colored text/icons that stay readable on [page].
  final Color primaryInk;
  final Color neutralFaded;
  final Color border;
  final Color borderFaded;
  final Color borderPrimary;
  final Color critical;
  final Color criticalInk;
  final Color criticalFaded;
  final Color positive;
  final Color positiveInk;
  final Color positiveFaded;
  final Color warning;
  final Color warningInk;
  final Color warningFaded;
  final Color disabled;
  final Color disabledInk;

  /// Fill laid over the blurred backdrop of a [GlassSurface].
  final Color glassTint;

  /// Specular edge highlight of a glass surface.
  final Color glassRim;
  final Color scrim;
  final Color shadow;
  final Color badge;
  final Color onBadge;

  /// Rewards: point amounts (amber), birthday/points banners, mint
  /// coupon tint, the dark points hero.
  final Color points;
  final Color pointsInk;
  final Color pointsFaded;
  final Color mintInk;
  final Color mintFaded;
  final Color hero;
  final Color onHeroFaded;

  /// The prototype's `surfaceCard` (notification cards): white in light,
  /// 6 % white over the page in dark.
  final Color card;

  /// "About this product" panel. Light: the prototype's `rgb(243,245,249)`.
  /// The prototype keeps it light in dark mode too, which left its faded
  /// text unreadable; dark uses a dark surface instead.
  final Color descriptionPanel;

  /// Rating bar track. Light: the prototype's `rgb(240,240,242)`; dark: a
  /// dark track instead of the prototype's bright one.
  final Color ratingBarTrack;

  /// `background-neutral`: switch track, sheet handle, stepper rail.
  final Color neutral;

  /// The prototype's inline 1 pt box ring (`rgba(0,0,0,.12)`) on settings
  /// groups, stat tiles, history and benefit lists, store and brand rows.
  /// Its dark-mode swap never applies in the prototype (the selector
  /// misses Chrome's `0.12`), so it stays black there and all but
  /// disappears on the dark page; this token does the same.
  final Color boxBorder;

  /// The fainter inline ring (`rgba(0,0,0,.08)`), same story.
  final Color boxBorderFaded;

  // Literal colours in the prototype that its dark mode leaves alone, so
  // they look the same in both themes.

  /// Ink on the white discs and pills over product photos (`rgb(20,22,27)`).
  static const literalInk = Color(0xFF14161B);

  /// Strikethrough compare price (`rgb(175,177,182)`).
  static const strikePrice = Color(0xFFAFB1B6);

  static const light = SureColors(
    page: Color(0xFFFFFFFF),
    pageFaded: Color(0xFFF5F5F5),
    raised: Color(0xFFFFFFFF),
    ink: Color(0xFF14161B),
    inkFaded: Color(0xFF52555B),
    inkPlaceholder: Color(0xFFAFB1B6),
    primary: SureBrand.neon,
    primaryPress: SureBrand.neonPress,
    primaryFaded: Color(0xFFEDFBDD),
    primaryFadedBorder: Color(0xFFD6F2BC),
    keypad: Color(0xFFF5F5F5),
    navInk: Color(0xFF52555B),
    // Hero dots (`rgb(225,229,235)`, the same in dark).
    dotInactive: Color(0xFFE1E5EB),
    onPrimary: SureBrand.darkGreen,
    primaryInk: SureBrand.darkGreen,
    neutralFaded: Color(0xFFF3F3F5),
    border: Color(0x1F000000),
    borderFaded: Color(0x14000000),
    borderPrimary: SureBrand.fresh,
    critical: Color(0xFFE22C2C),
    criticalInk: Color(0xFFC42525),
    criticalFaded: Color(0xFFFDEDED),
    positive: Color(0xFF118850),
    positiveInk: Color(0xFF0D7544),
    positiveFaded: Color(0xFFEDFDF5),
    warning: Color(0xFFFACC15),
    warningInk: Color(0xFF7B6305),
    warningFaded: Color(0xFFFFFAE9),
    disabled: Color(0xFFECEEF2),
    disabledInk: Color(0xFFC6CCDA),
    glassTint: Color(0xA6FFFFFF),
    glassRim: Color(0xB3FFFFFF),
    scrim: Color(0x80000000),
    shadow: Color(0x1F14161B),
    badge: Color(0xFFE22C2C),
    onBadge: Color(0xFFFFFFFF),
    points: Color(0xFFEE9A00),
    pointsInk: Color(0xFF9C4C00),
    pointsFaded: Color(0xFFFFF3D8),
    mintInk: Color(0xFF00783E),
    mintFaded: Color(0xFFEBF9EF),
    hero: Color(0xFF14161B),
    onHeroFaded: Color(0xFFAAAEB6),
    neutral: Color(0xFFDFE2EA),
    boxBorder: Color(0x1F000000),
    boxBorderFaded: Color(0x14000000),
    card: Color(0xFFFFFFFF),
    descriptionPanel: Color(0xFFF3F5F9),
    ratingBarTrack: Color(0xFFF0F0F2),
  );

  static const dark = SureColors(
    page: Color(0xFF17191F),
    pageFaded: Color(0xFF262930),
    // `elevation-base` as the prototype resolves it.
    raised: Color(0xFF15171E),
    ink: Color(0xFFF0F1F4),
    inkFaded: Color(0xFFA0A3AB),
    inkPlaceholder: Color(0xFF5C5F66),
    primary: SureBrand.neon,
    primaryPress: SureBrand.neonPress,
    // `.dark`: neon at 16 %.
    primaryFaded: Color(0x29A0F04B),
    primaryFadedBorder: Color(0x4DA0F04B),
    keypad: Color(0xFF262930),
    navInk: Color(0xFFAAAEB6),
    // Hero dots keep their light colour in the prototype's dark mode.
    dotInactive: Color(0xFFE1E5EB),
    onPrimary: SureBrand.darkGreen,
    primaryInk: SureBrand.neon,
    neutralFaded: Color(0xFF222835),
    border: Color(0x24FFFFFF),
    borderFaded: Color(0x14FFFFFF),
    borderPrimary: SureBrand.fresh,
    critical: Color(0xFFD02626),
    criticalInk: Color(0xFFF36A6A),
    criticalFaded: Color(0xFF3E1F1F),
    positive: Color(0xFF14784A),
    positiveInk: Color(0xFF18AB66),
    positiveFaded: Color(0xFF1F2A23),
    warning: Color(0xFFF1C512),
    warningInk: Color(0xFFB4920C),
    warningFaded: Color(0xFF2C271F),
    disabled: Color(0xFF1E212A),
    disabledInk: Color(0xFF434959),
    glassTint: Color(0xA6202228),
    glassRim: Color(0x40FFFFFF),
    scrim: Color(0x80000000),
    shadow: Color(0x66000000),
    // Count badges and form errors: literal `rgb(226,44,44)`.
    badge: Color(0xFFE22C2C),
    onBadge: Color(0xFFFFFFFF),
    // Points and mint are literal colours in the prototype with no dark
    // override, so they look the same in dark mode.
    points: Color(0xFFEE9A00),
    pointsInk: Color(0xFF9C4C00),
    pointsFaded: Color(0xFFFFF3D8),
    mintInk: Color(0xFF00783E),
    mintFaded: Color(0xFFEBF9EF),
    hero: Color(0xFF0E0F13),
    onHeroFaded: Color(0xFFAAAEB6),
    neutral: Color(0xFF494F60),
    boxBorder: Color(0x1F000000),
    boxBorderFaded: Color(0x14000000),
    card: Color(0x0FFFFFFF),
    descriptionPanel: Color(0xFF262930),
    ratingBarTrack: Color(0xFF30343C),
  );

  @override
  SureColors copyWith() => this;

  @override
  SureColors lerp(SureColors? other, double t) {
    if (other == null) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return SureColors(
      page: l(page, other.page),
      pageFaded: l(pageFaded, other.pageFaded),
      raised: l(raised, other.raised),
      ink: l(ink, other.ink),
      inkFaded: l(inkFaded, other.inkFaded),
      inkPlaceholder: l(inkPlaceholder, other.inkPlaceholder),
      primary: l(primary, other.primary),
      primaryPress: l(primaryPress, other.primaryPress),
      primaryFaded: l(primaryFaded, other.primaryFaded),
      primaryFadedBorder: l(primaryFadedBorder, other.primaryFadedBorder),
      keypad: l(keypad, other.keypad),
      navInk: l(navInk, other.navInk),
      dotInactive: l(dotInactive, other.dotInactive),
      onPrimary: l(onPrimary, other.onPrimary),
      primaryInk: l(primaryInk, other.primaryInk),
      neutralFaded: l(neutralFaded, other.neutralFaded),
      border: l(border, other.border),
      borderFaded: l(borderFaded, other.borderFaded),
      borderPrimary: l(borderPrimary, other.borderPrimary),
      critical: l(critical, other.critical),
      criticalInk: l(criticalInk, other.criticalInk),
      criticalFaded: l(criticalFaded, other.criticalFaded),
      positive: l(positive, other.positive),
      positiveInk: l(positiveInk, other.positiveInk),
      positiveFaded: l(positiveFaded, other.positiveFaded),
      warning: l(warning, other.warning),
      warningInk: l(warningInk, other.warningInk),
      warningFaded: l(warningFaded, other.warningFaded),
      disabled: l(disabled, other.disabled),
      disabledInk: l(disabledInk, other.disabledInk),
      glassTint: l(glassTint, other.glassTint),
      glassRim: l(glassRim, other.glassRim),
      scrim: l(scrim, other.scrim),
      shadow: l(shadow, other.shadow),
      badge: l(badge, other.badge),
      onBadge: l(onBadge, other.onBadge),
      points: l(points, other.points),
      pointsInk: l(pointsInk, other.pointsInk),
      pointsFaded: l(pointsFaded, other.pointsFaded),
      mintInk: l(mintInk, other.mintInk),
      mintFaded: l(mintFaded, other.mintFaded),
      hero: l(hero, other.hero),
      onHeroFaded: l(onHeroFaded, other.onHeroFaded),
      card: l(card, other.card),
      descriptionPanel: l(descriptionPanel, other.descriptionPanel),
      ratingBarTrack: l(ratingBarTrack, other.ratingBarTrack),
      neutral: l(neutral, other.neutral),
      boxBorder: l(boxBorder, other.boxBorder),
      boxBorderFaded: l(boxBorderFaded, other.boxBorderFaded),
    );
  }
}
