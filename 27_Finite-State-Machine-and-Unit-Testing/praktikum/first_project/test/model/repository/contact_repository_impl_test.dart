import 'package:dartz/dartz.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/model/contact_query.dart';
import 'package:first_project/model/repository/contact_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contact_repository_impl_test.mocks.dart';

@GenerateMocks([ContactRepositoryImpl])
void main() {
  group('Contact API =>', () {
    final ContactRepositoryImpl contactRepositoryImpl =
        MockContactRepositoryImpl();

    final List<ContactModel> contacts = [
      ContactModel.fromJson({
        "id": 1,
        "name": "John Doe",
        "phone": "08123456789",
        "job": "Developer",
        "created_at": "2022-01-01T00:00:00.000Z"
      })
    ];

    final ContactQuery query = ContactQuery(
      id: 1,
      name: "name",
      phone: "phone",
      job: "Developer",
    );

    test('get all contacts success', () {
      when(contactRepositoryImpl.getContacts())
          .thenAnswer((realInvocation) async => Right(contacts));
    });

    test('create contact success', () {
      when(contactRepositoryImpl.createContact(query))
          .thenAnswer((realInvocation) async => Right(ContactModel(
                id: query.id,
                name: query.name,
                phone: query.phone,
                job: query.job,
              )));
    });

    test('update contact success', () {
      when(contactRepositoryImpl.updateContact(query))
          .thenAnswer((realInvocation) async => Right(ContactModel(
                id: query.id,
                name: query.name,
                phone: query.phone,
                job: query.job,
              )));
    });

    test('delete contact success', () {
      when(contactRepositoryImpl.deleteContact(query.id!))
          .thenAnswer((realInvocation) async => const Right(""));
    });
  });
}
