import 'package:dartz/dartz.dart';
import 'package:first_project/model/contact_query.dart';
import 'package:first_project/model/contact_model.dart';
import 'package:first_project/model/repository/contact_repository.dart';
import 'package:first_project/model/service/api_service.dart';

class ContactRepositoryImpl implements ContactRepository {
  final String baseUrl =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

  @override
  Future<Either<String, List<ContactModel>>> getContacts() async {
    try {
      final response = await ApiService().get(baseUrl);
      final List<ContactModel> result =
          (response.data as List).map((e) => ContactModel.fromJson(e)).toList();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ContactModel>> createContact(ContactQuery query) async {
    try {
      final Map<String, dynamic> data = {
        "name": query.name,
        "phone": query.phone,
        "job": query.job,
        "created_at": DateTime.now().toString(),
      };
      final response = await ApiService().post(baseUrl, data: data);
      final ContactModel result = ContactModel.fromJson(response.data);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ContactModel>> updateContact(ContactQuery query) async {
    try {
      final Map<String, dynamic> data = {
        "name": query.name,
        "phone": query.phone,
        "job": query.job,
      };
      final response =
          await ApiService().put('$baseUrl/${query.id}', data: data);
      print("response: ${response.data}");
      final ContactModel result = ContactModel.fromJson(response.data);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> deleteContact(int id) async {
    try {
      await ApiService().delete("$baseUrl/$id");
      return const Right("Successfully");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
