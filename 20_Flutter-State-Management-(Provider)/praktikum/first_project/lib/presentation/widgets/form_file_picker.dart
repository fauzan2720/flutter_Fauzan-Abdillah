import 'dart:io';

import 'package:first_project/core/colors.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:flutter/material.dart';

class FormFilePicker extends StatelessWidget {
  final File? initialFile;
  final void Function() onTap;
  final void Function() onShowImage;

  const FormFilePicker({
    super.key,
    required this.initialFile,
    required this.onTap,
    required this.onShowImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: initialFile == null
            ? const Text("File")
            : GestureDetector(
                onTap: onShowImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Hero(
                    tag: initialFile!,
                    child: Image.file(
                      initialFile!,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ),
        subtitle: FozFormButton(
          label: "Pick and Open File",
          backgroundColor: AppColors.primaryColor,
          onPressed: onTap,
        ),
      ),
    );
  }
}
