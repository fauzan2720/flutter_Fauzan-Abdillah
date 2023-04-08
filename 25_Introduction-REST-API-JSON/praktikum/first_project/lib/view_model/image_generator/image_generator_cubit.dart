import 'package:first_project/model/repository/image_generator_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_generator_state.dart';

class ImageGeneratorCubit extends Cubit<ImageGeneratorState> {
  final ImageGeneratorRepositoryImpl _repository =
      ImageGeneratorRepositoryImpl();
  ImageGeneratorCubit() : super(ImageGeneratorInitial());

  void avatarUrl(String name) async {
    emit(ImageGeneratorLoading());
    final response = await _repository.generateAvatar(name);
    response.fold(
      (failed) => emit(ImageGeneratorSError(failed)),
      (result) => emit(ImageGeneratorSuccess(result)),
    );
  }
}
