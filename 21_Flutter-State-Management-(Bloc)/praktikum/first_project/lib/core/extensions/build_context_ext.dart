import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

extension BuildContextExt on BuildContext {
  void pop<T extends Object>([T? result]) {
    Navigator.pop(this, result);
  }

  void successDialog({String? message}) {
    Alert(
      context: this,
      type: AlertType.success,
      title: message ?? "Berhasil",
      buttons: [
        DialogButton(
          color: Colors.greenAccent[700],
          child: const Text(
            "Oke",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.popUntil(this, (route) => route.isFirst),
        )
      ],
    ).show();
  }

  void errorDialog({String? message}) {
    Alert(
      context: this,
      type: AlertType.error,
      title: message ?? "Error",
      buttons: [
        DialogButton(
          color: Colors.red[700],
          child: const Text(
            "Oke",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.popUntil(this, (route) => route.isFirst),
        )
      ],
    ).show();
  }
}
