import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/design_system/components/page_scaffold.dart';
import 'package:sure_app/design_system/theme/app_theme.dart';

void main() {
  testWidgets('header scrolls away under a status bar strip', (tester) async {
    tester.view.physicalSize = const Size(402, 874);
    tester.view.devicePixelRatio = 1;
    // A real phone's status bar: the strip must lay out and paint its height.
    tester.view.padding = const FakeViewPadding(top: 62);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: PageScaffold(
          title: 'Warranty',
          slivers: [
            SliverList.list(
              children: [for (var i = 0; i < 40; i++) Text('row $i')],
            ),
          ],
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(tester.getTopLeft(find.text('Warranty')).dy, greaterThan(62));

    await tester.drag(find.byType(Scrollable).first, const Offset(0, -400));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    // Scrolled away, as in the prototype; the strip stays at the top.
    expect(find.text('Warranty').hitTestable(), findsNothing);
  });
}
