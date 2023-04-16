import 'package:project/core/themes/colors.dart';
import 'package:flutter/material.dart';

class FozFormInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isTextArea;
  final bool isHint;

  const FozFormInput({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.validator,
    this.isTextArea = false,
    this.isHint = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(
            height: 4.0,
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            maxLines: isTextArea ? 3 : null,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              labelStyle: TextStyle(
                color: AppColors.primaryColor,
              ),
              hintText: isHint ? "Enter ${label.toLowerCase()}" : null,
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
