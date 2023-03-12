import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final String name;

  const MyHomePage({
    super.key,
    required this.title,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          "Nama saya adalah $name",
          style: const TextStyle(
            fontSize: 32.0,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
