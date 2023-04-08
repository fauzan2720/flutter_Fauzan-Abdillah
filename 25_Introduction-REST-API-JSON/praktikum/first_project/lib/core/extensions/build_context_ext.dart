import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();

  void pop<T extends Object>([T? result]) => Navigator.pop(this, result);

  void popToRoot() => Navigator.popUntil(this, (route) => route.isFirst);
}
