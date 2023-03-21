import 'package:first_project/core/colors.dart';
import 'package:first_project/pages/contacts_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyMaterialApp());

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: AppColors.backgroundColor,
          centerTitle: true,
        ),
      ),
      initialRoute: ContactsPage.routeName,
      routes: {
        ContactsPage.routeName: (context) => const ContactsPage(),
      },
    );
  }
}
