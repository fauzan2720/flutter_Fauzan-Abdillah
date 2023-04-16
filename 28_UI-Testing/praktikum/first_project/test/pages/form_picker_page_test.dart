import 'package:first_project/pages/form_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Advance Form", () {
    testWidgets('menampilkkan form date picker', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: FormPickerPage()));

      expect(find.byKey(const Key("form-date-picker")), findsOneWidget);
    });

    testWidgets('menampilkkan form color picker', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: FormPickerPage()));

      expect(find.byKey(const Key("form-color-picker")), findsOneWidget);
    });

    testWidgets('menampilkkan form file picker', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: FormPickerPage()));

      expect(find.byKey(const Key("form-file-picker")), findsOneWidget);
    });
  });
}
