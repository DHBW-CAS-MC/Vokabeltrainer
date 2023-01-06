// @dart=2.9

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import 'package:lernapp/main.dart';
import 'package:lernapp/startpage.dart';
import 'package:lernapp/welcome.dart';
import 'package:lernapp/welcome.dart';
import 'package:lernapp/wordInput.dart';
import 'package:lernapp/confirmation.dart';
import 'package:lernapp/navBar.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });
  testWidgets("Test adding a new card", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.pump();

    await tester.enterText(find.byType(TextFormField), "Max");

    await tester.tap(find.byIcon(Icons.arrow_forward));

    await tester.pumpAndSettle();

    expect(find.text("Vokabox"), findsOneWidget);
    expect(
        find.text(
            "Hey Max, schön, dass du heute Vokabeln lernen möchtest. Bitte wähle einen Modus aus!"),
        findsAtLeastNWidgets(1));

    await tester.tap(find.text("Karteikarten bearbeiten"));

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.add));

    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(WordInput, "deutsche Vokabel"), "Test de");

    await tester.enterText(
        find.widgetWithText(WordInput, "englische Vokabel"), "test en");

    await tester.tap(find.byType(ConfirmationCard));

    await tester.pumpAndSettle();

    expect(find.text("Test de"), findsOneWidget);

    await tester.tap(find.text("Test de"));

    await tester.pumpAndSettle();

    expect(find.text("test en"), findsOneWidget);
  });

  testWidgets("Test Login", (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    await tester.pumpWidget(MyApp());

    await tester.pump();

    await tester.enterText(find.byType(TextFormField), "Mona");

    await tester.tap(find.text('🦁'));

    await tester.tap(find.byIcon(Icons.arrow_forward));

    // await tester.tap(tester.firstWidget(find.byType(Radio)));

    await tester
        .tap(find.byWidgetPredicate((widget) => widget is Radio<int>).first);

    await tester.pumpAndSettle();

    expect(find.text("Vokabox"), findsOneWidget);
    expect(
        find.text(
            "Hey Mona, schön, dass du heute Vokabeln lernen möchtest. Bitte wähle einen Modus aus!"),
        findsAtLeastNWidgets(1));

    expect(
        (tester.firstWidget(find.byType(MaterialButton)) as MaterialButton)
            .color,
        Colors.blue);

    await tester.tap(find.byIcon(Icons.menu));

    await tester.pumpAndSettle();

    expect(find.text('Mona'), findsWidgets);
  });
}
