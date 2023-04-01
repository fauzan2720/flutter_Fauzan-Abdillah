import 'package:flutter/material.dart';

class FormTimePicker extends StatelessWidget {
  final TimeOfDay initialTime;
  final void Function() onTap;

  const FormTimePicker({
    super.key,
    required this.initialTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("Time"),
        subtitle: Text(initialTime.format(context)),
        trailing: TextButton(
          onPressed: onTap,
          child: const Text("Select"),
        ),
      ),
    );
  }
}
