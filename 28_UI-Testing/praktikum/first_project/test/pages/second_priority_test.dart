import 'package:first_project/pages/second_priority.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Prioritas 2", () {
    testWidgets('Memiliki appbar dengan judul "Login"',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('Memiliki logo app', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      expect(find.byKey(const Key("logo-app")), findsOneWidget);
    });

    testWidgets('Menampilkan sebuah form input nama dan no telp',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      expect(find.byKey(const Key("form-input-username")), findsOneWidget);
      expect(find.byKey(const Key("form-input-password")), findsOneWidget);
    });

    testWidgets('Menampilkan tombol submit', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      expect(find.byKey(const Key("form-do-login")), findsOneWidget);
    });
  });
}
