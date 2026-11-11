import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_app/main.dart';

void main() {
  testWidgets('Counter buttons update the centered count', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Rayen Ben Nejma'), findsOneWidget);
    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, Colors.green);
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.text('Up'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('Down'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.text('Down'));
    await tester.pump();
    expect(find.text('-1'), findsOneWidget);
  });
}
