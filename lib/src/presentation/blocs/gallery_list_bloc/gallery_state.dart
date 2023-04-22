part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();
}

class GalleryInitState extends GalleryState {
  const GalleryInitState();

  @override
  List<Object?> get props => [];
}

class GalleryLoadingState extends GalleryState {
  const GalleryLoadingState();

  @override
  List<Object?> get props => [];
}

class GalleryUpdatingState extends GalleryState {
  const GalleryUpdatingState();

  @override
  List<Object?> get props => [];
}

class GalleryLoadedState extends GalleryState {
  const GalleryLoadedState(this.images);

  final List<String> images;

  @override
  List<Object?> get props => [images];
}

class GalleryFailureState extends GalleryState {
  const GalleryFailureState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
