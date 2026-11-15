import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/platform/device_caps.dart';
import 'package:sure_app/core/core_providers.dart';
import 'package:sure_app/design_system/adaptive/adaptive_shell.dart';
import 'package:sure_app/design_system/adaptive/fold_info.dart';
import 'package:sure_app/design_system/adaptive/window_class.dart';
import 'package:sure_app/design_system/components/glass_nav_bar.dart';
import 'package:sure_app/design_system/glass/glass_tier.dart';
import 'package:sure_app/design_system/theme/app_theme.dart';

DeviceCaps caps({
  String platform = 'android',
  int os = 34,
  bool lowRam = false,
  bool reduce = false,
}) => DeviceCaps(
  platform: platform,
  osMajorVersion: os,
  deviceName: 'test',
  appVersion: '1.0.0',
  isLowRamDevice: lowRam,
  reduceTransparency: reduce,
);

class _Counter extends StatefulWidget {
  const _Counter();
  @override
  State<_Counter> createState() => _CounterState();
}

class _CounterState extends State<_Counter> {
  int n = 0;
  @override
  Widget build(BuildContext context) =>
      TextButton(onPressed: () => setState(() => n++), child: Text('count $n'));
}

Widget shellApp({
  required Size size,
  List<DisplayFeature> features = const [],
}) {
  return ProviderScope(
    overrides: [deviceCapsProvider.overrideWithValue(caps())],
    child: MediaQuery(
      data: MediaQueryData(size: size, displayFeatures: features),
      child: MaterialApp(
        theme: AppTheme.light(),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(size: size, displayFeatures: features),
          child: child!,
        ),
        home: AdaptiveShell(
          destinations: const [
            ShellDestination(
              label: 'A',
              icon: Icons.home,
              selectedIcon: Icons.home,
            ),
            ShellDestination(
              label: 'B',
              icon: Icons.star,
              selectedIcon: Icons.star,
            ),
          ],
          selectedIndex: 0,
          onSelect: (_) {},
          badges: const {1: 3},
          body: const Center(child: _Counter()),
        ),
      ),
    ),
  );
}

void main() {
  test('window classes', () {
    expect(WindowClass.fromWidth(599), WindowClass.compact);
    expect(WindowClass.fromWidth(600), WindowClass.medium);
    expect(WindowClass.fromWidth(840), WindowClass.medium);
    expect(WindowClass.fromWidth(841), WindowClass.expanded);
  });

  test('glass tier picks liquid on iOS 26, solid when asked', () {
    GlassTier tierFor(DeviceCaps c) {
      final container = ProviderContainer(
        overrides: [deviceCapsProvider.overrideWithValue(c)],
      );
      addTearDown(container.dispose);
      return container.read(glassTierProvider);
    }

    expect(tierFor(caps(platform: 'ios', os: 26)), GlassTier.liquid);
    expect(tierFor(caps(platform: 'ios', os: 18)), GlassTier.frosted);
    expect(tierFor(caps()), GlassTier.frosted);
    expect(tierFor(caps(lowRam: true)), GlassTier.solid);
    expect(
      tierFor(caps(platform: 'ios', os: 26, reduce: true)),
      GlassTier.solid,
    );
  });

  testWidgets('compact uses glass bar, wide uses rail, state survives', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    tester.view.physicalSize = const Size(400, 800);
    await tester.pumpWidget(shellApp(size: const Size(400, 800)));
    expect(find.byType(GlassNavBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
    expect(find.text('3'), findsOneWidget);

    await tester.tap(find.text('count 0'));
    await tester.pump();

    // Unfold to a tablet-sized window.
    tester.view.physicalSize = const Size(900, 800);
    await tester.pumpWidget(shellApp(size: const Size(900, 800)));
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(GlassNavBar), findsNothing);
    expect(find.text('count 1'), findsOneWidget, reason: 'state kept');
  });

  testWidgets('tabletop posture: body above hinge, bar below', (tester) async {
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    const size = Size(700, 800);
    tester.view.physicalSize = size;
    const hinge = DisplayFeature(
      bounds: Rect.fromLTWH(0, 390, 700, 20),
      type: DisplayFeatureType.hinge,
      state: DisplayFeatureState.postureHalfOpened,
    );

    await tester.pumpWidget(shellApp(size: size, features: const [hinge]));
    final body = tester.getRect(find.text('count 0'));
    final bar = tester.getRect(find.byType(GlassNavBar));
    expect(body.bottom, lessThanOrEqualTo(390));
    expect(bar.top, greaterThanOrEqualTo(410));
  });

  testWidgets('seamless fold separates only when half-open', (tester) async {
    Future<FoldInfo?> read(DisplayFeatureState state) async {
      FoldInfo? info;
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(
            size: const Size(800, 800),
            displayFeatures: [
              DisplayFeature(
                bounds: const Rect.fromLTWH(400, 0, 0, 800),
                type: DisplayFeatureType.fold,
                state: state,
              ),
            ],
          ),
          child: Builder(
            builder: (context) {
              info = FoldInfo.of(context);
              return const SizedBox();
            },
          ),
        ),
      );
      return info;
    }

    expect(
      (await read(DisplayFeatureState.postureFlat))!.isSeparating,
      isFalse,
    );
    final open = (await read(DisplayFeatureState.postureHalfOpened))!;
    expect(open.posture, FoldPosture.book);
    expect(open.isVertical, isTrue);
  });
}
