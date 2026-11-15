import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_theme.dart';

/// Sure wordmark. The mark keeps its brand colors; the word follows `ink`
/// so it reads in light and dark.
class SureLogo extends StatelessWidget {
  const SureLogo({super.key, this.height = 44});

  final double height;

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Sure',
    image: true,
    child: SvgPicture.asset(
      'assets/images/sure_logo.svg',
      height: height,
      theme: SvgTheme(currentColor: context.colors.ink),
      excludeFromSemantics: true,
    ),
  );
}
