import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_project/model/contact_model.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  List<ContactModel> contacts = [];

  void addContact(ContactModel query) {
    emit(ContactLoading());
    final int index = contacts.indexWhere((element) => element.id == query.id);
    if (index == -1) {
      contacts.add(query);
      emit(ContactSuccess(contacts, 'Berhasil ditambahkan'));
    } else {
      contacts[index] = query;
      emit(ContactSuccess(contacts, 'Berhasil diperbarui'));
    }
  }

  void updateContact(ContactModel query) {
    emit(ContactLoading());
    final int index = contacts.indexWhere((element) => element.id == query.id);
    if (index != -1) {
      contacts[index] = query;
      emit(ContactSuccess(contacts, 'Berhasil diperbarui'));
    } else {
      emit(const ContactSError("Gagal diperbarui"));
    }
  }

  void deleteContact(ContactModel query) {
    emit(ContactLoading());
    final int index = contacts.indexWhere((element) => element.id == query.id);
    if (index != -1) {
      contacts.removeAt(index);
      emit(ContactSuccess(contacts, 'Berhasil dihapus'));
    } else {
      emit(const ContactSError("Gagal dihapus"));
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
