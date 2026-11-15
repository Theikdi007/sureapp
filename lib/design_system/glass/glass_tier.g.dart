// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glass_tier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Device-level tier. [GlassSurface] still drops to [GlassTier.solid] when
/// the platform asks for high contrast.

@ProviderFor(glassTier)
final glassTierProvider = GlassTierProvider._();

/// Device-level tier. [GlassSurface] still drops to [GlassTier.solid] when
/// the platform asks for high contrast.

final class GlassTierProvider
    extends $FunctionalProvider<GlassTier, GlassTier, GlassTier>
    with $Provider<GlassTier> {
  /// Device-level tier. [GlassSurface] still drops to [GlassTier.solid] when
  /// the platform asks for high contrast.
  GlassTierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'glassTierProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$glassTierHash();

  @$internal
  @override
  $ProviderElement<GlassTier> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GlassTier create(Ref ref) {
    return glassTier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlassTier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlassTier>(value),
    );
  }
}

String _$glassTierHash() => r'0035ec78388b1f84ae4ba2a073d3e1e0efbd9254';

/// `true` once the app has been dropping frames. Sticky for the session so
/// surfaces don't flicker between tiers. Only measured in profile/release.

@ProviderFor(GlassPerformance)
final glassPerformanceProvider = GlassPerformanceProvider._();

/// `true` once the app has been dropping frames. Sticky for the session so
/// surfaces don't flicker between tiers. Only measured in profile/release.
final class GlassPerformanceProvider
    extends $NotifierProvider<GlassPerformance, bool> {
  /// `true` once the app has been dropping frames. Sticky for the session so
  /// surfaces don't flicker between tiers. Only measured in profile/release.
  GlassPerformanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'glassPerformanceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$glassPerformanceHash();

  @$internal
  @override
  GlassPerformance create() => GlassPerformance();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$glassPerformanceHash() => r'65f7b40512b4b2b50da7a63052082afc328cc299';

/// `true` once the app has been dropping frames. Sticky for the session so
/// surfaces don't flicker between tiers. Only measured in profile/release.

abstract class _$GlassPerformance extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
