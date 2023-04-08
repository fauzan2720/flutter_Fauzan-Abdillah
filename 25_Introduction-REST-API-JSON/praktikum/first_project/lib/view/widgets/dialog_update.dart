import 'package:first_project/core/extensions/double_ext.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:first_project/core/widgets/form_input.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/model/contact_query.dart';
import 'package:first_project/view_model/contact/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogUpdate extends StatelessWidget {
  final ContactModel contact;

  const DialogUpdate(this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formEditKey = GlobalKey<FormState>();
    final TextEditingController nameEditController =
        TextEditingController(text: contact.name);
    final TextEditingController phoneEditController =
        TextEditingController(text: contact.phone);

    return Form(
      key: formEditKey,
      child: AlertDialog(
        title: const Text('Update Contact'),
        actions: <Widget>[
          FozFormInput(
            label: 'Name',
            hint: 'Insert Your Name',
            controller: nameEditController,
            validator: (value) =>
                context.read<ContactCubit>().nameValidation(value!),
          ),
          16.0.height,
          FozFormInput(
            label: 'Nomor',
            hint: '+62 ....',
            controller: phoneEditController,
            keyboardType: TextInputType.phone,
            validator: (value) =>
                context.read<ContactCubit>().phoneValidation(value!),
          ),
          16.0.height,
          Align(
            alignment: Alignment.centerRight,
            child: FozFormButton(
              label: 'Update',
              onPressed: () {
                final FormState form = formEditKey.currentState!;
                if (form.validate()) {
                  context.read<ContactCubit>().updateContact(ContactQuery(
                        name: nameEditController.text,
                        phone: phoneEditController.text,
                        id: contact.id,
                      ));
                  Navigator.pop(context);
                  nameEditController.clear();
                  phoneEditController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
