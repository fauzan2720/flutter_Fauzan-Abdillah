import 'package:first_project/core/constants/colors.dart';
import 'package:flutter/material.dart';

class FozFormButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color? backgroundColor;

  const FozFormButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: backgroundColor ?? AppColors.primaryColor,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
