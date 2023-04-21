import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_belt/src/core/extensions.dart';
import 'package:test_belt/src/domain/repositories/gallery_repository.dart';

part 'gallery_list_event.dart';
part 'gallery_list_state.dart';

class GalleryListBloc extends Bloc<GalleryListEvent, GalleryListState> {
  final IGalleryRepository _repository;

  GalleryListBloc(this._repository) : super(const GalleryListEmptyState()) {
    on<GalleryListLoadEvent>(_loadEventHandle);
  }

  Future<void> _loadEventHandle(
    GalleryListLoadEvent event,
    Emitter<GalleryListState> emit,
  ) async {
    emit(const GalleryListLoadingState());

    final result = await _repository.getPaintedImages();

    if (result.isRight()) {
      final images = result.asRight();
      emit(GalleryListLoadedState(images));
    } else {
      final errorMessage = result.asLeft().message;
      emit(GalleryListFailureState(errorMessage));
    }
  }
}
