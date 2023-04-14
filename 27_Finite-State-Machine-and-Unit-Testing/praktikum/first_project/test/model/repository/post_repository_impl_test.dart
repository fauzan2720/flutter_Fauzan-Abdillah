import 'package:dartz/dartz.dart';
import 'package:first_project/model/post_model.dart';
import 'package:first_project/model/repository/post_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_repository_impl_test.mocks.dart';

@GenerateMocks([PostRepositoryImpl])
void main() {
  group("Post API =>", () {
    final PostRepositoryImpl postRepositoryImpl = MockPostRepositoryImpl();

    final List<PostModel> posts = [
      PostModel.fromJson({
        "userId": 1,
        "id": 1,
        "title": "",
        "body": "",
      })
    ];

    test(
        "get all posts success",
        () => when(postRepositoryImpl.getPosts())
            .thenAnswer((realInvocation) async => Right(posts)));

    test(
        "update post success",
        () => when(postRepositoryImpl.updatePost(1))
            .thenAnswer((realInvocation) async => Right(posts[0])));
  });
}
