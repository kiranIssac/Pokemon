// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokeman_app/CardDetail.dart';
import 'package:pokeman_app/HomeScreen.dart';

import 'package:pokeman_app/main.dart';

void main() {
  testWidgets('test for details page', (widgetTester) async {
    final button = find.byKey(ValueKey("button1"));
    final text = find.byKey(ValueKey("AblityText"));
    await widgetTester.pumpWidget(MaterialApp(
      home: Home(),
    ));
    await widgetTester.tap(button);
    await widgetTester.pumpWidget(MaterialApp(
      home: Home(),
    ));

    await widgetTester.pump();
  });
}
