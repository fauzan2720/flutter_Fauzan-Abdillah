import 'package:first_project/core/state.dart';
import 'package:first_project/model/repository/image_generator_repository_impl.dart';
import 'package:flutter/material.dart';

class ImageGeneratorProvider with ChangeNotifier {
  DataStateStatus state = DataStateStatus.initial;
  final ImageGeneratorRepositoryImpl _repository =
      ImageGeneratorRepositoryImpl();
  String avatar = "";

  DataStateStatus changeState(DataStateStatus newState) {
    state = newState;
    notifyListeners();
    return state;
  }

  void avatarUrl(String name) async {
    changeState(DataStateStatus.loading);
    final response = await _repository.generateAvatar(name);
    response.fold(
      (failed) => changeState(DataStateStatus.failed),
      (result) {
        avatar = result;
        changeState(DataStateStatus.success);
      },
    );
  }
}
