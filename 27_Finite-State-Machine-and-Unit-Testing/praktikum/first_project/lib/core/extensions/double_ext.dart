import 'package:flutter/material.dart';

extension DoubleExt on double {
  SizedBox get width => SizedBox(width: this);

  SizedBox get height => SizedBox(height: this);
}
