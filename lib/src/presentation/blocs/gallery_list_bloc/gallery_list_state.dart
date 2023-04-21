part of 'gallery_list_bloc.dart';

abstract class GalleryListState extends Equatable {
  const GalleryListState();
}

class GalleryListEmptyState extends GalleryListState {
  const GalleryListEmptyState();

  @override
  List<Object?> get props => [];
}

class GalleryListLoadingState extends GalleryListState {
  const GalleryListLoadingState();

  @override
  List<Object?> get props => [];
}

class GalleryListLoadedState extends GalleryListState {
  const GalleryListLoadedState(this.images);

  final List<String> images;

  @override
  List<Object?> get props => [images];
}

class GalleryListFailureState extends GalleryListState {
  const GalleryListFailureState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
