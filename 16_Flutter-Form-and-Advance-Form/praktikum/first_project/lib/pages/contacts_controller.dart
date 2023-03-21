import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:first_project/core/dialogs/show_success.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/model/dummy.dart';

class ContactsController {
  final BuildContext context;
  final void Function(void Function()) setState;

  ContactsController(this.context, this.setState);

  final Dummy dummy = Dummy();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formEditKey = GlobalKey<FormState>();
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
    final FormState form = formKey.currentState!;
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

  void updateContact(String id) {
    final FormState form = formEditKey.currentState!;
    int index = dummy.contacts.indexWhere((element) => element.id == id);
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
}
