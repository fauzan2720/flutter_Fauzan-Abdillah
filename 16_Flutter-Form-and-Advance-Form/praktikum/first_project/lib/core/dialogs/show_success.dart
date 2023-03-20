import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void showSuccess(BuildContext context, {String? message}) {
  Alert(
    context: context,
    type: AlertType.success,
    title: message ?? "Berhasil",
    buttons: [
      DialogButton(
        color: Colors.greenAccent[700],
        child: const Text(
          "Oke",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: () => Navigator.pop(context),
      )
    ],
  ).show();
  return;
}
