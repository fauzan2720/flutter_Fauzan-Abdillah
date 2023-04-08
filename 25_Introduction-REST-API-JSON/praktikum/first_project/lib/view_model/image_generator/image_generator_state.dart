part of 'image_generator_cubit.dart';

abstract class ImageGeneratorState extends Equatable {
  const ImageGeneratorState();

  @override
  List<Object> get props => [];
}

class ImageGeneratorInitial extends ImageGeneratorState {}

class ImageGeneratorLoading extends ImageGeneratorState {}

class ImageGeneratorSuccess extends ImageGeneratorState {
  final String avatar;

  const ImageGeneratorSuccess(this.avatar);

  @override
  List<Object> get props => [avatar];
}

class ImageGeneratorSError extends ImageGeneratorState {
  final String error;

  const ImageGeneratorSError(this.error);

  @override
  List<Object> get props => [error];
}
