import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/home.dart';
import 'package:testing/main.dart';

void main() {
  testWidgets('hometest ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyHomePage(title: 'title'),
    ));

    var appbar = find.byType(AppBar);
    expect(appbar, findsOneWidget);

    var flot = find.byType(FloatingActionButton);
    expect(flot, findsAtLeast(1));

    var f1 = find.byIcon(Icons.remove_circle);
    expect(f1, findsAny);

    var val1 = find.text('0');
    expect(val1, findsOneWidget);

    var incrWidget = find.byKey(const Key('_incrementCounter'));
    await tester.tap(incrWidget);

    await tester.pump();

    var val2 = find.text('1');
    expect(val2, findsOneWidget);

    var val3 = find.text('0');
    expect(val3, findsNothing);

    var decWidget = find.byIcon(Icons.remove_circle);
    await tester.tap(decWidget);

    await tester.pump();

    var val4 = find.text('0');
    expect(val4, findsOneWidget);

    var resetWidget = find.byType(TextButton);
    await tester.tap(resetWidget);
    await tester.pump();
    var val5 = find.text('0');
    expect(val5, findsOneWidget);
  });
}
