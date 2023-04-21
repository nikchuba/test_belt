import 'dart:ui';

import 'package:image_picker/image_picker.dart';
import 'package:test_belt/src/core/typedef.dart';
import 'package:test_belt/src/domain/repositories/gallery_repository.dart';

class GalleryRepository implements IGalleryRepository {
  @override
  Future<ErrorOr<void>> clearPaintedImages() {
    // TODO: implement clearPaintedImages
    throw UnimplementedError();
  }

  @override
  Future<ErrorOr<void>> deletePaintedImage(Image image) {
    // TODO: implement deletePaintedImage
    throw UnimplementedError();
  }

  @override
  Future<ErrorOr<Image?>> pickImageFrom(ImageSource source) {
    // TODO: implement getImageBy
    throw UnimplementedError();
  }

  @override
  Future<ErrorOr<List<Image>>> getPaintedImages() {
    // TODO: implement getPaintedImages
    throw UnimplementedError();
  }

  @override
  Future<ErrorOr<void>> saveImageToApp(Image image) {
    // TODO: implement saveImageToApp
    throw UnimplementedError();
  }

  @override
  Future<ErrorOr<void>> saveImageToGallery(Image image) {
    // TODO: implement saveImageToGallery
    throw UnimplementedError();
  }
}
