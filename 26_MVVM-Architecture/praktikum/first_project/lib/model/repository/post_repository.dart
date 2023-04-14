import 'package:dartz/dartz.dart';
import 'package:first_project/model/post_model.dart';

abstract class PostRepository {
  Future<Either<String, List<PostModel>>> getPosts();

  Future<Either<String, PostModel>> updatePost(int id);
}
