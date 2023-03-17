import 'package:first_project/pages/cupertino_page.dart';
import 'package:first_project/pages/exploration_page.dart';
import 'package:first_project/pages/material_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// NOTE: buka salah satu tag comment dari 3 fungsi main dibawah:

void main() => runApp(const MyMaterialApp());
// void main() => runApp(const MyCupertinoApp());
// void main() => runApp(const MyFlutterApp());

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      initialRoute: MyMaterialPage.routeName,
      routes: {
        MyMaterialPage.routeName: (context) => const MyMaterialPage(),
      },
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cupertino App',
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      home: MyCupertinoPage(),
    );
  }
}

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      initialRoute: MyFlutterPage.routeName,
      routes: {
        MyFlutterPage.routeName: (context) => const MyFlutterPage(),
      },
    );
  }
}
