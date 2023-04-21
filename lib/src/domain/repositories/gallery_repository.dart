import 'dart:ui';

import 'package:image_picker/image_picker.dart';
import 'package:test_belt/src/core/typedef.dart';

abstract class IGalleryRepository {
  Future<ErrorOr<Image?>> pickImageFrom(ImageSource source);
  Future<ErrorOr<void>> saveImageToGallery(Image image);
  Future<ErrorOr<void>> saveImageToApp(Image image);
  Future<ErrorOr<void>> deletePaintedImage(Image image);
  Future<ErrorOr<List<String>>> getPaintedImages();
  Future<ErrorOr<void>> clearPaintedImages();
}
