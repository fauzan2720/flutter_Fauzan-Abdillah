import 'package:first_project/model/repository/image_generator_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'image_generator_repository_impl_test.mocks.dart';

@GenerateMocks([ImageGeneratorRepositoryImpl])
void main() {
  group("Image Generator API =>", () {
    final ImageGeneratorRepositoryImpl imageGeneratorRepositoryImpl =
        MockImageGeneratorRepositoryImpl();

    test(
        "generate image success",
        () => when(
            imageGeneratorRepositoryImpl.generateAvatar("Fauzan Abdillah")));
  });
}
