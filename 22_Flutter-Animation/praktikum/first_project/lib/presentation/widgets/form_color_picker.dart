import 'package:first_project/core/extensions/double_ext.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:flutter/material.dart';

class FormColorPicker extends StatelessWidget {
  final Color initialColor;
  final void Function() onTap;

  const FormColorPicker({
    super.key,
    required this.initialColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("Color"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.0.height,
            Container(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: initialColor,
              ),
            ),
            Center(
              child: FozFormButton(
                label: "Pick Color",
                backgroundColor: initialColor,
                onPressed: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
