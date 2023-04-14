import 'package:first_project/model/food_model.dart';
import 'package:dartz/dartz.dart';
import 'package:first_project/model/repository/food_repository.dart';
import 'package:first_project/model/service/api_service.dart';

class FoodRepositoryImpl implements FoodRepository {
  final ApiService apiService = ApiService();
  final String baseUrl =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods';

  @override
  Future<Either<String, List<FoodModel>>> getFoods() async {
    try {
      final response = await apiService.get(baseUrl);
      final List<FoodModel> result =
          (response.data as List).map((e) => FoodModel.fromJson(e)).toList();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
