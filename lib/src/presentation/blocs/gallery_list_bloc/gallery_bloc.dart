import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_belt/src/core/extensions.dart';
import 'package:test_belt/src/domain/repositories/gallery_repository.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final IGalleryRepository _repository;

  GalleryBloc(this._repository) : super(const GalleryInitState()) {
    on<GalleryLoadEvent>(_loadEventHandler);
    on<GalleryAddImageEvent>(_addImageEventHandler);
    on<GalleryDeleteImageEvent>(_deleteImageEventHandler);
  }

  Future<void> _loadEventHandler(
    GalleryLoadEvent event,
    Emitter<GalleryState> emit,
  ) async {
    emit(const GalleryLoadingState());

    final result = await _repository.getPaintedImages();

    if (result.isRight()) {
      final images = result.asRight();
      emit(GalleryLoadedState(images));
    } else {
      final errorMessage = result.asLeft().message;
      emit(GalleryFailureState(errorMessage));
    }
  }

  Future<void> _addImageEventHandler(
    GalleryAddImageEvent event,
    Emitter<GalleryState> emit,
  ) async {
    emit(const GalleryUpdatingState());

    final result = await _repository.saveImageToApp(event.image);

    if (result.isRight()) {
      add(const GalleryLoadEvent());
    } else {
      final errorMessage = result.asLeft().message;
      emit(GalleryFailureState(errorMessage));
    }
  }

  Future<void> _deleteImageEventHandler(
    GalleryDeleteImageEvent event,
    Emitter<GalleryState> emit,
  ) async {
    emit(const GalleryUpdatingState());

    final result = await _repository.deletePaintedImageByPath(event.path);

    if (result.isRight()) {
      add(const GalleryLoadEvent());
    } else {
      final errorMessage = result.asLeft().message;
      emit(GalleryFailureState(errorMessage));
    }
  }
}
