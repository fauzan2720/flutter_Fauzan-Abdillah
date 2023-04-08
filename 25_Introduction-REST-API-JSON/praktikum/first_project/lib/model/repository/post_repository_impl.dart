import 'package:first_project/model/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:first_project/model/repository/post_repository.dart';
import 'package:first_project/model/service/api_service.dart';

class PostRepositoryImpl implements PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<Either<String, List<PostModel>>> getPosts() async {
    try {
      final response = await ApiService().get(baseUrl);
      final List<PostModel> result =
          (response.data as List).map((e) => PostModel.fromJson(e)).toList();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PostModel>> updatePost(int id) async {
    try {
      final Map<String, dynamic> data = {
        'id': id,
        'title': 'foo',
        'body': 'bar',
        'userId': 1,
      };
      final response = await ApiService().put("$baseUrl/$id", data: data);
      return Right(PostModel.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
