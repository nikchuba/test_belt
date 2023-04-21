part of 'gallery_list_bloc.dart';

abstract class GalleryListEvent extends Equatable {
  const GalleryListEvent();
}

class GalleryListLoadEvent extends GalleryListEvent {
  const GalleryListLoadEvent();

  @override
  List<Object?> get props => [];
}
