import 'dart:async';

import 'package:flutter/material.dart';

class ClockApp extends StatefulWidget {
  final String title;
  const ClockApp({super.key, required this.title});

  @override
  State<ClockApp> createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  String _timeString = '';

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getCurrentTime());
  }

  void _getCurrentTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          _timeString,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32.0,
          ),
        ),
      ),
    );
  }
}
