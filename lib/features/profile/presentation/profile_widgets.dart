import 'dart:io';

import 'package:flutter/material.dart';

import '../../../design_system/components/sure_image.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_typography.dart';

/// Design system `MemberAvatar`: an `Avatar` (photo or initials) with a
/// 2 pt page-colored gap inside a 1 pt ring (the prototype's 3 pt ring
/// under a 2 pt page shadow). [size] is the outer size; the default is the
/// `lg` avatar (48) plus the ring.
class MemberAvatar extends StatelessWidget {
  const MemberAvatar({
    super.key,
    required this.name,
    this.photoUrl,
    this.size = 54,
  });

  final String name;
  final String? photoUrl;
  final double size;

  static String initials(String name) {
    final words = name.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty);
    final s = words.map((w) => w[0]).take(2).join().toUpperCase();
    return s.isEmpty ? '?' : s;
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final url = photoUrl;
    // `Avatar` initials: neutral fill, ink, 500 weight at 40 % of the
    // avatar's diameter.
    final fallback = ColoredBox(
      color: c.neutralFaded,
      child: Center(
        child: Text(
          initials(name),
          style: SureTypography.style(
            size: ((size - 6) * 0.4).roundToDouble(),
            height: 1,
            weight: SureTypography.medium,
            color: c.ink,
          ),
        ),
      ),
    );
    final Widget inner = switch (url) {
      // The mock flavor stands in a local file for the uploaded photo.
      final u? when u.startsWith('file:') => Image.file(
        File.fromUri(Uri.parse(u)),
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => fallback,
      ),
      final u? => SureImage(u, fallback: fallback),
      null => fallback,
    };
    return ExcludeSemantics(
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(1),
        // Tier ring: the prototype's `classic`/neutral ring.
        decoration: BoxDecoration(color: c.neutral, shape: BoxShape.circle),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(color: c.page, shape: BoxShape.circle),
          child: ClipOval(child: inner),
        ),
      ),
    );
  }
}
