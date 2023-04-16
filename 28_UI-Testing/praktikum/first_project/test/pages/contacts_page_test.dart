import 'package:first_project/pages/contacts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Form", () {
    testWidgets('Memiliki appbar dengan judul “Contacts”',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactsPage()));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Contacts'), findsOneWidget);
    });

    testWidgets('memilki icon (gambar bebas)', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactsPage()));

      expect(find.byIcon(Icons.mobile_friendly), findsOneWidget);
    });

    testWidgets('memiliki deskripsi (text bebas)', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactsPage()));

      expect(find.byKey(const Key("description-text")), findsOneWidget);
    });

    testWidgets('Buatlah sebuah Title yang bertuliskan “Create New Contacts”',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactsPage()));

      expect(find.text('Create New Contacts'), findsOneWidget);
    });

    testWidgets('menampilkan sebuah form input nama dan no telp',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactsPage()));

      expect(find.byKey(const Key("form-input-name")), findsOneWidget);
      expect(find.byKey(const Key("form-input-phone")), findsOneWidget);
    });

    testWidgets('menampilkan tombol submit', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactsPage()));

      expect(find.byKey(const Key("form-button-submit")), findsOneWidget);
    });

    testWidgets('Memiliki title “List Contacts”', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactsPage()));

      expect(find.text('List Contacts'), findsOneWidget);
    });

    testWidgets('menampilkkan data nama dan no telp dalam listview',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactsPage()));

      expect(find.byKey(const Key("get-contacts")), findsOneWidget);
      expect(find.byKey(const Key("show-name")), findsWidgets);
      expect(find.byKey(const Key("show-no-telp")), findsWidgets);
    });
  });
}
