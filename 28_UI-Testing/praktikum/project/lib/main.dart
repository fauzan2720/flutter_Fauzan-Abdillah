import 'package:flutter/material.dart';
import 'package:project/presentation/pages/contact_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: ContactPage.routeName,
      routes: {
        ContactPage.routeName: (context) => const ContactPage(),
      },
    );
  }
}
