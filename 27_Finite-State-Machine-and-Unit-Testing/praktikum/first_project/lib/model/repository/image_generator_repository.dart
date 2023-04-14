import 'package:dartz/dartz.dart';

abstract class ImageGeneratorRepository {
  Future<Either<String, String>> generateAvatar(String name);
}
