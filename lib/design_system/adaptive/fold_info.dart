import 'dart:ui' show DisplayFeature, DisplayFeatureState, DisplayFeatureType;

import 'package:flutter/widgets.dart';

enum FoldPosture {
  /// No separating fold (phones, tablets, foldables lying flat).
  flat,

  /// Half-open with a horizontal hinge: content on top, controls on bottom.
  tabletop,

  /// Half-open (or a physical hinge) with a vertical hinge: two side-by-side
  /// panes.
  book,
}

/// The hinge/fold that splits the window, read from
/// `MediaQuery.displayFeatures` (Android foldables: Galaxy Z Fold, Pixel Fold;
/// any platform that reports display features).
///
/// iOS doesn't report display features to Flutter, so a foldable iPhone
/// gets the width-class layout (rail + two panes when open), which never puts
/// a hinge under content because there is none reported.
@immutable
class FoldInfo {
  const FoldInfo._(this.hinge, this.posture);

  static const none = FoldInfo._(null, FoldPosture.flat);

  /// In the coordinates of the MediaQuery it was read from (the window).
  final Rect? hinge;
  final FoldPosture posture;

  bool get isSeparating => hinge != null;
  bool get isVertical => hinge != null && hinge!.height > hinge!.width;

  static FoldInfo of(BuildContext context) {
    final features = MediaQuery.displayFeaturesOf(context);
    final size = MediaQuery.sizeOf(context);
    for (final f in features) {
      if (!_separates(f)) continue;
      final b = f.bounds;
      final vertical = b.height >= size.height - 1 || b.height > b.width;
      return FoldInfo._(b, vertical ? FoldPosture.book : FoldPosture.tabletop);
    }
    return none;
  }

  /// Same rule as Jetpack WindowManager's `isSeparating`: a physical hinge
  /// always separates; a seamless fold only when half-open.
  static bool _separates(DisplayFeature f) => switch (f.type) {
    DisplayFeatureType.hinge => true,
    DisplayFeatureType.fold => f.state == DisplayFeatureState.postureHalfOpened,
    _ => false,
  };

  @override
  bool operator ==(Object other) =>
      other is FoldInfo && other.hinge == hinge && other.posture == posture;

  @override
  int get hashCode => Object.hash(hinge, posture);
}
