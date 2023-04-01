import 'dart:io';

import 'package:flutter/material.dart';

class ContactModel {
  final String id;
  final String name;
  final String phoneNumber;
  final DateTime? pickedDate;
  final TimeOfDay? pickedTime;
  final Color? pickedColor;
  final File? selectedFile;

  ContactModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.pickedDate,
    this.pickedTime,
    this.pickedColor,
    this.selectedFile,
  });
}
