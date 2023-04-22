import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_belt/src/core/extensions.dart';
import 'package:test_belt/src/domain/repositories/gallery_repository.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final IGalleryRepository _repository;

  ImagePickerBloc(
    this._repository,
  ) : super(const ImagePickerEmptyState()) {
    on<ImagePickerPickEvent>(_pickEventHandler);
  }

  Future<void> _pickEventHandler(
    ImagePickerPickEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    Image? previousImage;
    if (state is ImagePickerPickedState) {
      previousImage = (state as ImagePickerPickedState).image;
    }

    emit(const ImagePickerPickingState());

    final result = await _repository.pickImageFrom(event.source);

    if (result.isRight()) {
      final image = result.asRight();
      if (image != null) {
        emit(ImagePickerPickedState(image));
      } else {
        emit(
          previousImage != null
              ? ImagePickerPickedState(previousImage)
              : const ImagePickerEmptyState(),
        );
      }
    } else {
      final errorMessage = result.asLeft().message;
      emit(ImagePickerFailureState(errorMessage));
    }
  }
}
