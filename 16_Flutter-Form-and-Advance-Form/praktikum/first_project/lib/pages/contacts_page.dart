import 'package:first_project/core/colors.dart';
import 'package:first_project/core/dialogs/show_success.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:first_project/core/widgets/form_input.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/model/dummy.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ContactsPage extends StatefulWidget {
  static const routeName = 'contacts_page';

  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final Dummy dummy = Dummy();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formEditKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameEditController = TextEditingController();
  final TextEditingController phoneEditController = TextEditingController();

  String? nameValidation(String value) {
    if (value.isEmpty) {
      return 'Nama harus diisi';
    }
    List<String> words = value.trim().split(' ');
    if (words.length < 2) {
      return 'Nama harus terdiri dari minimal 2 kata';
    }
    for (String word in words) {
      if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(word)) {
        return 'Nama tidak boleh mengandung angka atau karakter khusus';
      }
      if (!RegExp(r'^[A-Z][a-z]*$').hasMatch(word)) {
        return 'Setiap kata harus dimulai dengan huruf kapital';
      }
    }
    return null;
  }

  String? phoneValidation(String value) {
    if (value.isEmpty) {
      return 'Nama harus diisi';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Nomor telepon harus terdiri dari angka saja';
    }
    if (value.length < 8 || value.length > 15) {
      return 'Nomor telepon harus terdiri dari 8-15 digit';
    }
    if (!value.startsWith('0')) {
      return 'Nomor telepon harus dimulai dengan angka 0';
    }
    return null;
  }

  void saveContact() {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      dummy.contacts.add(
        ContactModel(
          id: const Uuid().v4(),
          name: nameController.text,
          phoneNumber: phoneController.text,
        ),
      );
      nameController.text = '';
      phoneController.text = '';
      showSuccess(context, message: "Berhasil ditambahkan");
      setState(() {});
    }
  }

  void showFormEditContact(ContactModel contact) async {
    nameEditController.text = contact.name;
    phoneEditController.text = contact.phoneNumber;

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Form(
          key: _formEditKey,
          child: AlertDialog(
            title: const Text('Update Contact'),
            actions: <Widget>[
              FozFormInput(
                label: 'Name',
                hint: 'Insert Your Name',
                controller: nameEditController,
                validator: (value) => nameValidation(value!),
              ),
              const SizedBox(
                height: 16.0,
              ),
              FozFormInput(
                label: 'Nomor',
                hint: '+62 ....',
                controller: phoneEditController,
                keyboardType: TextInputType.phone,
                validator: (value) => phoneValidation(value!),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FozFormButton(
                  label: 'Update',
                  onPressed: () {
                    updateContact(contact.id);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showConfirmDeleteContact(ContactModel contact) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: Text('Apakah kamu yakin ingin hapus ${contact.name}?'),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
                deleteContact(contact.id);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void updateContact(String id) {
    final FormState form = _formEditKey.currentState!;
    int index = dummy.contacts.indexWhere((element) {
      return element.id == id;
    });
    if (form.validate()) {
      Navigator.pop(context);
      dummy.contacts[index] = ContactModel(
        id: id,
        name: nameEditController.text,
        phoneNumber: phoneEditController.text,
      );
      showSuccess(context, message: "Berhasil diperbarui");
      setState(() {});
    }
  }

  void deleteContact(String id) {
    dummy.contacts.removeWhere((element) => element.id == id);
    showSuccess(context, message: "Berhasil dihapus");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: const [
                Icon(Icons.mobile_friendly),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Create New Contacts",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                    "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made."),
                SizedBox(
                  height: 16.0,
                ),
                Divider(),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  FozFormInput(
                    label: 'Name',
                    hint: 'Insert Your Name',
                    controller: nameController,
                    validator: (value) => nameValidation(value!),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  FozFormInput(
                    label: 'Nomor',
                    hint: '+62 ....',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) => phoneValidation(value!),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FozFormButton(
                      label: 'Submit',
                      onPressed: saveContact,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    "List Contacts",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Column(
                    children: dummy.contacts.reversed.map((item) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColors.backgroundColor,
                            child: Text(
                              item.name[0].toUpperCase(),
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          title: Text(item.name),
                          subtitle: Text(item.phoneNumber),
                          trailing: SizedBox(
                            width: 96.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => showFormEditContact(item),
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      showConfirmDeleteContact(item),
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
