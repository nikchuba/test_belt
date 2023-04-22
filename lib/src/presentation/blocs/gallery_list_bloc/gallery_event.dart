part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();
}

class GalleryLoadEvent extends GalleryEvent {
  const GalleryLoadEvent();

  @override
  List<Object?> get props => [];
}

class GalleryAddImageEvent extends GalleryEvent {
  const GalleryAddImageEvent(this.image);

  final Image image;

  @override
  List<Object?> get props => [image];
}

class GalleryDeleteImageEvent extends GalleryEvent {
  const GalleryDeleteImageEvent(this.path);

  final String path;

  @override
  List<Object?> get props => [];
}
