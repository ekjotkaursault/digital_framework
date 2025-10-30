// This is a basic Flutter widget test.
//
// Use the WidgetTester to interact with your widgets in tests.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digital_framework/main.dart';

void main() {
  testWidgets('Digital picture frame loads and displays an image',
      (WidgetTester tester) async {
    // Build the DigitalFrameApp widget
    await tester.pumpWidget(const DigitalFrameApp());

    // Wait for any async image loading
    await tester.pumpAndSettle();

    // Check that at least one Image widget is found
    expect(find.byType(Image), findsWidgets);

    // Optional: Check for specific text
    expect(find.text('Digital Picture Frame'), findsOneWidget);
  });
}
