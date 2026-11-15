import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../tokens/sure_colors.dart';
import '../tokens/sure_metrics.dart';
import '../tokens/sure_typography.dart';

abstract final class AppTheme {
  /// Status bar icons that read on the page color: dark icons in light
  /// mode, light icons in dark mode. Transparent bar, edge to edge.
  static SystemUiOverlayStyle statusBar(Brightness pageBrightness) =>
      (pageBrightness == Brightness.light
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light)
          .copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarContrastEnforced: false,
          );

  static ThemeData light() => _build(SureColors.light, Brightness.light);
  static ThemeData dark() => _build(SureColors.dark, Brightness.dark);

  static OutlineInputBorder _field(Color color, {double width = 1}) =>
      OutlineInputBorder(
        borderRadius: SureRadius.all(SureRadius.large),
        borderSide: BorderSide(color: color, width: width),
      );

  static ThemeData _build(SureColors c, Brightness b) {
    final scheme = ColorScheme(
      brightness: b,
      primary: c.primary,
      onPrimary: c.onPrimary,
      primaryContainer: c.primaryFaded,
      onPrimaryContainer: c.primaryInk,
      secondary: c.primaryInk,
      onSecondary: c.page,
      error: c.critical,
      onError: c.onBadge,
      errorContainer: c.criticalFaded,
      onErrorContainer: c.criticalInk,
      surface: c.page,
      onSurface: c.ink,
      onSurfaceVariant: c.inkFaded,
      surfaceContainerLowest: c.page,
      surfaceContainerLow: c.pageFaded,
      surfaceContainer: c.pageFaded,
      surfaceContainerHigh: c.raised,
      surfaceContainerHighest: c.neutralFaded,
      outline: c.border,
      outlineVariant: c.borderFaded,
      shadow: c.shadow,
      scrim: c.scrim,
    );
    final text = SureTypography.textTheme(c.ink);
    return ThemeData(
      useMaterial3: true,
      brightness: b,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.page,
      textTheme: text,
      fontFamily: SureTypography.fontFamily,
      extensions: [c],
      splashFactory: InkSparkle.splashFactory,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      appBarTheme: AppBarTheme(
        // Explicit: with a transparent app bar Flutter would guess white
        // status bar icons, invisible on the white page.
        systemOverlayStyle: statusBar(b),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: c.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: text.titleLarge,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.primary,
          foregroundColor: c.onPrimary,
          disabledBackgroundColor: c.disabled,
          disabledForegroundColor: c.disabledInk,
          minimumSize: const Size(SureSize.minTap, SureSize.minTap),
          shape: const StadiumBorder(),
          textStyle: text.labelLarge,
        ),
      ),
      cardTheme: CardThemeData(
        color: c.raised,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: SureRadius.all(SureRadius.xl),
          side: BorderSide(color: c.borderFaded),
        ),
      ),
      dividerTheme: DividerThemeData(color: c.borderFaded, space: 1),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.page,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: SureSpace.x4,
          vertical: SureSpace.x4,
        ),
        hintStyle: text.bodyLarge?.copyWith(color: c.inkFaded),
        prefixIconColor: c.inkFaded,
        suffixIconColor: c.inkFaded,
        errorStyle: text.bodySmall?.copyWith(color: c.criticalInk),
        errorMaxLines: 3,
        border: _field(c.border),
        enabledBorder: _field(c.border),
        focusedBorder: _field(c.primaryInk, width: 2),
        errorBorder: _field(c.critical),
        focusedErrorBorder: _field(c.critical, width: 2),
        disabledBorder: _field(c.borderFaded),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: c.ink,
        contentTextStyle: text.bodyMedium?.copyWith(color: c.page),
        shape: RoundedRectangleBorder(
          borderRadius: SureRadius.all(SureRadius.medium),
        ),
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: c.badge,
        textColor: c.onBadge,
        textStyle: text.labelSmall,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Colors.transparent,
        indicatorColor: c.primary,
        selectedIconTheme: IconThemeData(color: c.onPrimary),
        unselectedIconTheme: IconThemeData(color: c.inkFaded),
        selectedLabelTextStyle: text.labelMedium?.copyWith(color: c.ink),
        unselectedLabelTextStyle: text.labelMedium?.copyWith(color: c.inkFaded),
      ),
    );
  }
}

extension SureThemeContext on BuildContext {
  SureColors get colors => Theme.of(this).extension<SureColors>()!;
  TextTheme get text => Theme.of(this).textTheme;
}
