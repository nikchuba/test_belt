import 'dart:ui';

abstract class IGalleryStorageDataSource {
  Future<void> saveImage(Image image);
  Future<void> deleteImage(Image image);
  Future<void> deleteAllImages();
}
