import 'package:first_project/core/state.dart';
import 'package:first_project/model/food_model.dart';
import 'package:first_project/model/repository/food_repository_impl.dart';
import 'package:flutter/material.dart';

class FoodProvider with ChangeNotifier {
  DataStateStatus state = DataStateStatus.initial;
  final FoodRepositoryImpl _repository = FoodRepositoryImpl();
  List<FoodModel> foods = [];

  FoodProvider() {
    initData();
  }

  DataStateStatus changeState(DataStateStatus newState) {
    state = newState;
    notifyListeners();
    return state;
  }

  void initData() async {
    changeState(DataStateStatus.loading);
    final response = await _repository.getFoods();
    response.fold(
      (failed) => changeState(DataStateStatus.failed),
      (result) {
        foods = result;
        changeState(DataStateStatus.success);
      },
    );
  }
}
