import 'package:dartz/dartz.dart';
import 'package:first_project/model/food_model.dart';

abstract class FoodRepository {
  Future<Either<String, List<FoodModel>>> getFoods();
}
