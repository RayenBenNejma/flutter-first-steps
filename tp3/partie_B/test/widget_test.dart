import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:localswap/main.dart';

void main() {
  testWidgets('shows LocalSwap home and announcement preview', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const LocalSwapApp());

    expect(find.text('LocalSwap'), findsNWidgets(2));
    expect(
      find.text('Donnez, échangez, trouvez près de chez vous.'),
      findsOneWidget,
    );
    expect(find.text('Les annonces près de vous'), findsOneWidget);
    expect(find.text('Chaise vintage'), findsOneWidget);
    expect(find.text('Maison'), findsOneWidget);
    expect(
      find.text('La liste des annonces sera disponible au TP4.'),
      findsOneWidget,
    );
    expect(find.byKey(const ValueKey('listing-image-stack')), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
