part of 'image_picker_bloc.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();
}

class ImagePickerPickEvent extends ImagePickerEvent {
  const ImagePickerPickEvent(this.source);

  final ImageSource source;

  @override
  List<Object?> get props => [source];
}
