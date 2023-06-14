// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:personal_finance_manager/main.dart';
import 'package:personal_finance_manager/utils/constants.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Create a new transaction', (widgetTester) async {
    await widgetTester.pumpWidget(const MyApp());

    //Premo il pulsante per aprire la schermata di inserimento transazione

    final openNewTransactionPageButton = find.byType(FloatingActionButton);
    await widgetTester.tap(openNewTransactionPageButton);

    await widgetTester.pump();

    final nameOfTransactionTextField = find.byKey(TestElements.titleOfTransactionKey);
    final amountOfTransactionTextField = find.byKey(TestElements.amountOfTransactionKey);

    await widgetTester.enterText(nameOfTransactionTextField, "First transaction");
    await widgetTester.pump();

    await widgetTester.enterText(amountOfTransactionTextField, "10");
    await widgetTester.pump();

    final saveButton = find.byType(IconButton);
    await widgetTester.tap(saveButton);
    await widgetTester.pump();

    final listview = widgetTester.widgetList(find.byType(ListView));

    expect(listview.length, 1);
  });
}
