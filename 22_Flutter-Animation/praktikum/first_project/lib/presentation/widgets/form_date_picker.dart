import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormDatePicker extends StatelessWidget {
  final DateTime initialDate;
  final void Function() onTap;

  const FormDatePicker({
    super.key,
    required this.initialDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("Date"),
        subtitle: Text(DateFormat.yMMMMEEEEd().format(initialDate)),
        trailing: TextButton(
          onPressed: onTap,
          child: const Text("Select"),
        ),
      ),
    );
  }
}
