import 'package:first_project/core/state.dart';
import 'package:first_project/model/post_model.dart';
import 'package:first_project/model/repository/post_repository_impl.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  DataStateStatus state = DataStateStatus.initial;
  final PostRepositoryImpl _repository = PostRepositoryImpl();
  List<PostModel> posts = [];

  PostProvider() {
    initData();
  }

  DataStateStatus changeState(DataStateStatus newState) {
    state = newState;
    notifyListeners();
    return state;
  }

  void initData() async {
    changeState(DataStateStatus.loading);
    final response = await _repository.getPosts();
    response.fold(
      (failed) => changeState(DataStateStatus.failed),
      (result) {
        posts = result;
        changeState(DataStateStatus.success);
      },
    );
  }

  void updatePost(int id) async {
    changeState(DataStateStatus.loading);
    final response = await _repository.updatePost(id);
    response.fold(
      (failed) => changeState(DataStateStatus.failed),
      (result) {
        int index = posts.indexWhere((element) => element.id == id);
        if (index != -1) {
          posts[index] = PostModel(
            title: 'foo',
            body: 'bar',
          );
          changeState(DataStateStatus.success);
        } else {
          changeState(DataStateStatus.failed);
        }
      },
    );
  }
}
