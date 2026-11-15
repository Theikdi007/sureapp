import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/core_providers.dart';

part 'glass_tier.g.dart';

/// How [GlassSurface] renders.
enum GlassTier {
  /// iOS 26+: strong blur + saturation boost + specular rim (Liquid Glass look).
  liquid,

  /// Everywhere else: frosted blur with a denser tint.
  frosted,

  /// Opaque surface: Reduce Transparency, high contrast, low-RAM devices, or
  /// when the app has been dropping frames.
  solid,
}

/// Device-level tier. [GlassSurface] still drops to [GlassTier.solid] when
/// the platform asks for high contrast.
@Riverpod(keepAlive: true)
GlassTier glassTier(Ref ref) {
  final caps = ref.watch(deviceCapsProvider);
  final reduce =
      ref.watch(reduceTransparencyProvider).value ?? caps.reduceTransparency;
  final slow = ref.watch(glassPerformanceProvider);
  if (reduce || slow || caps.isLowRamDevice) return GlassTier.solid;
  if (caps.supportsLiquidGlass) return GlassTier.liquid;
  return GlassTier.frosted;
}

/// `true` once the app has been dropping frames. Sticky for the session so
/// surfaces don't flicker between tiers. Only measured in profile/release.
@Riverpod(keepAlive: true)
class GlassPerformance extends _$GlassPerformance {
  static const _window = 180;
  static const _jankThreshold = Duration(milliseconds: 25);
  static const _maxJankRatio = 0.25;
  static const _warmUp = Duration(seconds: 4);

  final _recent = ListQueue<bool>();
  int _jankCount = 0;
  DateTime? _startedAt;

  @override
  bool build() {
    if (kDebugMode) return false;
    _startedAt = DateTime.now();
    SchedulerBinding.instance.addTimingsCallback(_onTimings);
    ref.onDispose(
      () => SchedulerBinding.instance.removeTimingsCallback(_onTimings),
    );
    return false;
  }

  void _onTimings(List<FrameTiming> timings) {
    if (state) return;
    if (DateTime.now().difference(_startedAt!) < _warmUp) return;
    for (final t in timings) {
      final janky = t.totalSpan > _jankThreshold;
      _recent.addLast(janky);
      if (janky) _jankCount++;
      if (_recent.length > _window && _recent.removeFirst()) _jankCount--;
    }
    if (_recent.length >= _window && _jankCount / _window > _maxJankRatio) {
      SchedulerBinding.instance.removeTimingsCallback(_onTimings);
      state = true;
    }
  }
}
