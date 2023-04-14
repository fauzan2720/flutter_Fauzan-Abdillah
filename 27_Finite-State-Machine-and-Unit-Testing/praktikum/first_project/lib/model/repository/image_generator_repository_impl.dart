import 'package:dartz/dartz.dart';
import 'package:first_project/model/repository/image_generator_repository.dart';
import 'package:first_project/model/service/api_service.dart';

class ImageGeneratorRepositoryImpl implements ImageGeneratorRepository {
  final ApiService apiService = ApiService();
  final String baseUrl = 'https://api.dicebear.com/6.x/pixel-art/svg';

  @override
  Future<Either<String, String>> generateAvatar(String name) async {
    try {
      final Map<String, dynamic> params = {
        "seed": name,
      };
      final response = await apiService.get(baseUrl, params: params);
      return Right(response.data.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
