import 'package:first_project/core/colors.dart';
import 'package:flutter/material.dart';

class FozFormInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const FozFormInput({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.backgroundColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        labelText: label,
        labelStyle: TextStyle(
          color: AppColors.primaryColor,
        ),
        hintText: hint,
      ),
      onChanged: (value) {},
    );
  }
}
