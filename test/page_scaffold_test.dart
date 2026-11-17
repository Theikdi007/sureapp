import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/design_system/components/page_scaffold.dart';
import 'package:sure_app/design_system/glass/glass_surface.dart';
import 'package:sure_app/design_system/glass/glass_tier.dart';
import 'package:sure_app/design_system/theme/app_theme.dart';

void main() {
  Future<void> pumpPage(WidgetTester tester, {GlassTier? tier}) async {
    tester.view.physicalSize = const Size(402, 874);
    tester.view.devicePixelRatio = 1;
    // A real phone's status bar: the strip must lay out and paint its height.
    tester.view.padding = const FakeViewPadding(top: 62);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.light(),
          home: GlassTierOverride(
            tier: tier,
            child: PageScaffold(
              title: 'Warranty',
              slivers: [
                SliverList.list(
                  children: [for (var i = 0; i < 80; i++) Text('row $i')],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(tester.getTopLeft(find.text('Warranty')).dy, greaterThan(62));
    await tester.drag(find.byType(Scrollable).first, const Offset(0, -400));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  }

  testWidgets('header scrolls away under a status bar strip', (tester) async {
    await pumpPage(tester, tier: GlassTier.frosted);
    // Scrolled away, as in the prototype; the strip stays at the top.
    expect(find.text('Warranty').hitTestable(), findsNothing);
  });

  testWidgets('iOS 26: the header stays pinned as a glass bar', (
    tester,
  ) async {
    await pumpPage(tester, tier: GlassTier.liquid);
    expect(find.text('Warranty').hitTestable(), findsOneWidget);
    expect(
      find.ancestor(
        of: find.text('Warranty'),
        matching: find.byType(GlassSurface),
      ),
      findsOneWidget,
    );
  });

  test('a failed pull-to-refresh does not escape', () async {
    await expectLater(
      refreshQuietly(() async => throw Exception('offline')),
      completes,
    );
  });
}
