import 'package:first_project/model/post_model.dart';
import 'package:first_project/model/repository/post_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepositoryImpl _repository = PostRepositoryImpl();
  List<PostModel> _posts = [];

  PostCubit() : super(PostInitial()) {
    initData();
  }

  void initData() async {
    emit(PostLoading());
    final response = await _repository.getPosts();
    response.fold(
      (failed) => emit(PostSError(failed)),
      (result) {
        _posts = result;
        emit(PostSuccess(_posts));
      },
    );
  }

  void updatePost(int id) async {
    emit(PostLoading());
    final response = await _repository.updatePost(id);
    response.fold(
      (failed) => emit(PostSError(failed)),
      (result) {
        int index = _posts.indexWhere((element) => element.id == id);
        if (index != -1) {
          _posts[index] = PostModel(
            title: 'foo',
            body: 'bar',
          );
          emit(PostSuccess(_posts));
        } else {
          emit(const PostSError("Data tidak ditemukan"));
        }
      },
    );
  }
}
