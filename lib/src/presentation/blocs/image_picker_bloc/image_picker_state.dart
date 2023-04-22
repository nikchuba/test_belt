part of 'image_picker_bloc.dart';

abstract class ImagePickerState extends Equatable {
  const ImagePickerState();
}

class ImagePickerEmptyState extends ImagePickerState {
  const ImagePickerEmptyState();

  @override
  List<Object?> get props => [];
}

class ImagePickerPickingState extends ImagePickerState {
  const ImagePickerPickingState();

  @override
  List<Object?> get props => [];
}

class ImagePickerPickedState extends ImagePickerState {
  const ImagePickerPickedState(this.image);

  final Image image;

  @override
  List<Object?> get props => [image];
}

class ImagePickerFailureState extends ImagePickerState {
  const ImagePickerFailureState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
