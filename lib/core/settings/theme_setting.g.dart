// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_setting.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Light / dark / follow the phone (Profile › Dark Mode). Kept on the
/// device; follows the system until the member picks one.

@ProviderFor(ThemeSetting)
final themeSettingProvider = ThemeSettingProvider._();

/// Light / dark / follow the phone (Profile › Dark Mode). Kept on the
/// device; follows the system until the member picks one.
final class ThemeSettingProvider
    extends $NotifierProvider<ThemeSetting, ThemeMode> {
  /// Light / dark / follow the phone (Profile › Dark Mode). Kept on the
  /// device; follows the system until the member picks one.
  ThemeSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeSettingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeSettingHash();

  @$internal
  @override
  ThemeSetting create() => ThemeSetting();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeSettingHash() => r'8c604fa65f39b78dfad8e23c693b1595b13b8c1d';

/// Light / dark / follow the phone (Profile › Dark Mode). Kept on the
/// device; follows the system until the member picks one.

abstract class _$ThemeSetting extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
