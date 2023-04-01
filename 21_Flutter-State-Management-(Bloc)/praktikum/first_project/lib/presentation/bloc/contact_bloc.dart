import 'package:first_project/model/contact_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<ContactModel> contacts = [];

  ContactBloc() : super(ContactInitial()) {
    on<AddContact>((event, emit) {
      emit(ContactLoading());
      final int index =
          contacts.indexWhere((element) => element.id == event.contact.id);
      if (index == -1) {
        contacts.add(event.contact);
        emit(ContactSuccess(contacts, 'Berhasil ditambahkan'));
      } else {
        contacts[index] = event.contact;
        emit(ContactSuccess(contacts, 'Berhasil diperbarui'));
      }
    });

    on<UpdateContact>((event, emit) {
      emit(ContactLoading());
      final int index =
          contacts.indexWhere((element) => element.id == event.contact.id);
      if (index != -1) {
        contacts[index] = event.contact;
        emit(ContactSuccess(contacts, 'Berhasil diperbarui'));
      } else {
        emit(const ContactSError("Gagal diperbarui"));
      }
    });

    on<DeleteContact>((event, emit) {
      emit(ContactLoading());
      final int index =
          contacts.indexWhere((element) => element.id == event.id);
      if (index != -1) {
        contacts.removeAt(index);
        emit(ContactSuccess(contacts, 'Berhasil dihapus'));
      } else {
        emit(const ContactSError("Gagal dihapus"));
      }
    });
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
