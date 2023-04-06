import 'dart:io';

import 'package:first_project/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

extension StringExt on String {
  Color toColor() => Color(int.parse(this));

  File toFile() => File(this);

  DateTime toDateTime() => DateTime.parse(this);

  TimeOfDay toTimeOfDay() =>
      TimeOfDay.fromDateTime(DateTime.parse("2023-04-06 $this"));

  void successDialog(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: this,
      buttons: [
        DialogButton(
          color: Colors.green[700],
          child: const Text(
            "Oke",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
        )
      ],
    ).show();
  }

  void errorDialog(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: this,
      buttons: [
        DialogButton(
          color: Colors.red[700],
          child: const Text(
            "Oke",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
        )
      ],
    ).show();
  }

  void succeedBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        content: Text(
          this,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black),
        ),
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
