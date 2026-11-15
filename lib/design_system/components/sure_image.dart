import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_theme.dart';

/// Image from an API URL. Handles network raster and SVG, and `asset:`
/// URLs used by the mock flavor. Shows `neutral-faded` while loading or
/// when the image can't load.
class SureImage extends StatelessWidget {
  const SureImage(
    this.url, {
    super.key,
    this.fit = BoxFit.cover,
    this.semanticLabel,
    this.fallback,
  });

  final String? url;
  final BoxFit fit;
  final String? semanticLabel;

  /// Shown instead of the plain placeholder when there's no image.
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    final placeholder =
        fallback ?? ColoredBox(color: context.colors.neutralFaded);
    final u = url;
    if (u == null || u.isEmpty) return placeholder;

    final isSvg = Uri.tryParse(u)?.path.toLowerCase().endsWith('.svg') ?? false;
    Widget image;
    if (u.startsWith('asset:')) {
      final path = u.substring(6);
      image = isSvg
          ? SvgPicture.asset(path, fit: fit, semanticsLabel: semanticLabel)
          : Image.asset(path, fit: fit, semanticLabel: semanticLabel);
    } else if (isSvg) {
      image = SvgPicture.network(
        u,
        fit: fit,
        semanticsLabel: semanticLabel,
        placeholderBuilder: (_) => placeholder,
        errorBuilder: (_, _, _) => placeholder,
      );
    } else {
      image = CachedNetworkImage(
        imageUrl: u,
        fit: fit,
        fadeInDuration: const Duration(milliseconds: 200),
        placeholder: (_, _) => placeholder,
        errorWidget: (_, _, _) => placeholder,
      );
      if (semanticLabel != null) {
        image = Semantics(label: semanticLabel, image: true, child: image);
      }
    }
    return image;
  }
}
