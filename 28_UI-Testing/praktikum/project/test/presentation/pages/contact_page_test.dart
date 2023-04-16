import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/presentation/pages/contact_page.dart';

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() {
  CustomBindings();

  group("Testing Code Competence 1", () {
    testWidgets('terdapat text/logo pada header', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactPage()));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byKey(const Key("header-app")), findsOneWidget);
    });

    testWidgets('terdapat welcome section gambar dan text',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactPage()));

      expect(find.byKey(const Key("welcome-section-image")), findsOneWidget);
      expect(find.byKey(const Key("welcome-section-text")), findsOneWidget);
    });

    testWidgets('terdapat form input username bertipe text',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactPage()));

      expect(
          find.byKey(const Key("form-input-text-firstname")), findsOneWidget);
      expect(find.byKey(const Key("form-input-text-lastname")), findsOneWidget);
    });

    testWidgets('terdapat form input email bertipe email',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactPage()));

      expect(find.byKey(const Key("form-input-email")), findsOneWidget);
    });

    testWidgets('terdapat form input message bertipe text area',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactPage()));

      expect(find.byKey(const Key("form-input-textarea")), findsOneWidget);
    });

    testWidgets('terdapat form submit dan menampilkan hasil inputan',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactPage()));

      expect(find.byKey(const Key("form-button-submit")), findsOneWidget);
    });
  });
}
