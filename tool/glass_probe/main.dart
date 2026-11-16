import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/design_system/glass/glass_lens.dart';
import 'package:sure_app/design_system/glass/glass_surface.dart';
import 'package:sure_app/design_system/glass/glass_tier.dart';
import 'package:sure_app/design_system/theme/app_theme.dart';

// Visual check of GlassSurface tiers over busy content (not part of the app).
//   flutter run -t tool/glass_probe/main.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final caps = await DeviceCaps.load();
  await GlassLens.preload();
  runApp(
    ProviderScope(
      overrides: [deviceCapsProvider.overrideWithValue(caps)],
      child: MaterialApp(
        theme: AppTheme.light(),
        home: const _Probe(),
      ),
    ),
  );
}

class _Probe extends StatelessWidget {
  const _Probe();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        ListView(
          children: [
            for (var i = 0; i < 40; i++)
              Container(
                height: 44,
                color: i.isEven ? const Color(0xFF14372D) : const Color(0xFFA0F04B),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Row $i  —  The quick brown fox jumps over the lazy dog',
                  style: TextStyle(
                    color: i.isEven ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
        for (final (top, tier) in [
          (180.0, GlassTier.liquid),
          (330.0, GlassTier.frosted),
          (480.0, GlassTier.solid),
        ])
          Positioned(
            left: 24,
            right: 24,
            top: top,
            height: 96,
            child: GlassSurface(
              tier: tier,
              borderRadius: const BorderRadius.all(Radius.circular(48)),
              child: Center(
                child: Text(
                  '${tier.name}  lens=${GlassLens.available}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        // Raw lens, almost no blur, to see the bending itself.
        Positioned(
          left: 24,
          right: 24,
          top: 640,
          height: 120,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            child: GlassLensBackdrop(
              inner: ui.ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              radius: 60,
              bezel: 30,
              strength: 18,
              child: const SizedBox.expand(),
            ),
          ),
        ),
      ],
    ),
  );
}
