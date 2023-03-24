import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void showError(BuildContext context, {String? message}) {
  Alert(
    context: context,
    type: AlertType.error,
    title: message ?? "Error",
    buttons: [
      DialogButton(
        color: Colors.red[700],
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
