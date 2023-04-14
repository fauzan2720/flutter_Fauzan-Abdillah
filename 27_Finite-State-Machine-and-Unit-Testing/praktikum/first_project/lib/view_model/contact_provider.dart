import 'package:first_project/model/contact_query.dart';
import 'package:flutter/material.dart';

import 'package:first_project/core/state.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/model/repository/contact_repository_impl.dart';
import 'package:first_project/model/repository/image_generator_repository_impl.dart';

class ContactProvider with ChangeNotifier {
  DataStateStatus state = DataStateStatus.initial;
  List<ContactModel> contacts = [];

  final ContactRepositoryImpl _contactRepository = ContactRepositoryImpl();
  final ImageGeneratorRepositoryImpl _imageGeneratorRepository =
      ImageGeneratorRepositoryImpl();

  ContactProvider() {
    initData();
  }

  DataStateStatus changeState(DataStateStatus newState) {
    state = newState;
    notifyListeners();
    return state;
  }

  void initData() async {
    changeState(DataStateStatus.loading);
    contacts.clear();
    final response = await _contactRepository.getContacts();
    response.fold(
      (failed) => changeState(DataStateStatus.failed),
      (result) async {
        for (ContactModel item in result) {
          item.avatarUrl = await avatarUrl(item.name!);
          contacts += [item];
        }
        changeState(DataStateStatus.success);
      },
    );
  }

  Future<String> avatarUrl(String name) async {
    late String svg;
    final response = await _imageGeneratorRepository.generateAvatar(name);
    response.fold(
      (failed) => svg = "",
      (result) => svg = result,
    );
    return svg;
  }

  void addContact(ContactQuery query) async {
    changeState(DataStateStatus.loading);
    final response = await _contactRepository.createContact(query);
    response.fold(
      (failed) => changeState(DataStateStatus.failed),
      (result) async {
        result.avatarUrl = await avatarUrl(result.name!);
        contacts.add(result);
        changeState(DataStateStatus.success);
      },
    );
  }

  void updateContact(ContactQuery query) async {
    changeState(DataStateStatus.loading);
    final response = await _contactRepository.updateContact(query);
    response.fold(
      (failed) => changeState(DataStateStatus.failed),
      (result) async {
        int index = contacts.indexWhere((element) => element.id == result.id);
        result.avatarUrl = await avatarUrl(result.name!);
        contacts[index] = result;
        changeState(DataStateStatus.success);
      },
    );
  }

  void deleteContact(int id) async {
    changeState(DataStateStatus.loading);
    final response = await _contactRepository.deleteContact(id);
    response.fold(
      (failed) => changeState(DataStateStatus.failed),
      (result) {
        int index = contacts.indexWhere((element) => element.id == id);
        contacts.removeAt(index);
        changeState(DataStateStatus.success);
      },
    );
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
