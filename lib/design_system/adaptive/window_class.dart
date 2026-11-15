import 'package:flutter/widgets.dart';

/// Width classes from CLAUDE.md: compact <600, medium 600–840, expanded >840.
enum WindowClass {
  compact,
  medium,
  expanded;

  static WindowClass fromWidth(double width) {
    if (width < 600) return compact;
    if (width <= 840) return medium;
    return expanded;
  }

  static WindowClass of(BuildContext context) =>
      fromWidth(MediaQuery.sizeOf(context).width);

  bool get isCompact => this == compact;

  /// Medium and expanded use the navigation rail and list-detail panes.
  bool get usesRail => this != compact;
}
