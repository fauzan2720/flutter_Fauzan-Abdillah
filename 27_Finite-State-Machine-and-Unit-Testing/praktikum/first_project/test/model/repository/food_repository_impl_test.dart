import 'package:first_project/model/repository/food_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'food_repository_impl_test.mocks.dart';

@GenerateMocks([FoodRepositoryImpl])
void main() {
  group("Food API =>", () {
    final FoodRepositoryImpl foodRepositoryImpl = MockFoodRepositoryImpl();

    test("get all food success", () => when(foodRepositoryImpl.getFoods()));
  });
}
