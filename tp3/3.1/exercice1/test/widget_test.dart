import 'package:exercice1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('notification badge is visible', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byIcon(Icons.notifications), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });
}
