import 'package:dartz/dartz.dart';
import 'package:first_project/model/contact_query.dart';
import 'package:first_project/model/contact_model.dart';

abstract class ContactRepository {
  Future<Either<String, List<ContactModel>>> getContacts();

  Future<Either<String, ContactModel>> createContact(ContactQuery query);

  Future<Either<String, ContactModel>> updateContact(ContactQuery query);

  Future<Either<String, String>> deleteContact(int id);
}
