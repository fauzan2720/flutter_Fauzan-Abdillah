import 'package:first_project/core/helpers/database_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_project/model/contact_model.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial()) {
    initData();
  }

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<List<ContactModel>> initData() async {
    final List<ContactModel> contacts = await databaseHelper.getContacts();
    emit(ContactSuccess(contacts));
    return contacts;
  }

  void addContact(ContactModel query) async {
    emit(ContactLoading());
    try {
      if (await databaseHelper.isContact(query.id)) {
        await databaseHelper.updateContact(query);
        emit(ContactSuccess(await initData()));
      } else {
        await databaseHelper.insertContact(query);
        emit(ContactSuccess(await initData()));
      }
    } catch (e) {
      emit(ContactSError(e.toString()));
    }
  }

  void updateContact(ContactModel query) async {
    emit(ContactLoading());
    try {
      await databaseHelper.updateContact(query);
      emit(ContactSuccess(await initData()));
    } catch (e) {
      emit(ContactSError(e.toString()));
    }
  }

  void deleteContact(String id) async {
    emit(ContactLoading());
    try {
      await databaseHelper.deleteContact(id);
      emit(ContactSuccess(await initData()));
    } catch (e) {
      emit(ContactSError(e.toString()));
    }
  }

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
}
