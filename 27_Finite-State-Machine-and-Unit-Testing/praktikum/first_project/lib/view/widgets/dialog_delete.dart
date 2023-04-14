import 'package:first_project/model/contact_model.dart';
import 'package:first_project/view_model/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogDelete extends StatelessWidget {
  final ContactModel contact;

  const DialogDelete(this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm'),
      content: Text('Apakah kamu yakin ingin hapus ${contact.name}?'),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[600],
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "No",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            context.read<ContactProvider>().deleteContact(contact.id!);
            Navigator.pop(context);
          },
          child: const Text(
            "Yes",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
