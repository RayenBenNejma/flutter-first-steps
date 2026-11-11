import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tp4/ex5_directory.dart';

void main() {
  testWidgets('directory switches between lazy list and grid views', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DirectoryApp());

    expect(find.text('Annuaire du club'), findsOneWidget);
    expect(members, hasLength(51));
    expect(members.last.name, 'Rayen Ben Nejma');
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
    expect(find.text('Amira 1'), findsOneWidget);
    expect(find.text('Tunis · membre depuis 2015'), findsOneWidget);

    await tester.tap(find.byTooltip('Afficher en grille'));
    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsNothing);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.text('Amira 1'), findsOneWidget);
    expect(find.byTooltip('Afficher en liste'), findsOneWidget);

    await tester.tap(find.byTooltip('Afficher en liste'));
    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
    expect(find.text('Amira 1'), findsOneWidget);
  });
}
