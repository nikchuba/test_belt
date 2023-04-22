import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_belt/src/core/errors/error.dart';
import 'package:test_belt/src/core/errors/exception.dart';
import 'package:test_belt/src/core/typedef.dart';
import 'package:test_belt/src/data/datasources/gallery_datasource/local/device/gallery_device_data_source.dart';
import 'package:test_belt/src/data/datasources/gallery_datasource/local/storage/gallery_storage_data_source.dart';
import 'package:test_belt/src/domain/repositories/gallery_repository.dart';

class GalleryRepository implements IGalleryRepository {
  const GalleryRepository(
    IGalleryDeviceDataSource deviceDataSource,
    IGalleryStorageDataSource storageDataSource,
  )   : _deviceDataSource = deviceDataSource,
        _storageDataSource = storageDataSource;

  final IGalleryDeviceDataSource _deviceDataSource;
  final IGalleryStorageDataSource _storageDataSource;

  @override
  Future<ErrorOr<void>> clearPaintedImages() {
    // TODO: implement clearPaintedImages
    throw UnimplementedError();
  }

  @override
  Future<ErrorOr<void>> deletePaintedImageByPath(String path) async {
    try {
      final result = await _storageDataSource.deleteImageByPath(path);
      return Right(result);
    } catch (e) {
      return Left(UnexpectedError(e.toString()));
    }
  }

  @override
  Future<ErrorOr<Image?>> pickImageFrom(ImageSource source) async {
    try {
      final xFile = await _deviceDataSource.pickImage(source);
      final bytes = await xFile?.readAsBytes();

      if (bytes != null) {
        final image = await decodeImageFromList(bytes);
        return Right(image);
      }

      return const Right(null);
    } on ArgumentError catch (e) {
      return Left(DevicePlatformError('${e.name} ${e.message}'));
    } on PlatformException catch (e) {
      return Left(DevicePlatformError(e.message ?? e.code));
    } catch (e) {
      return Left(UnexpectedError(e.toString()));
    }
  }

  @override
  Future<ErrorOr<List<String>>> getPaintedImages() async {
    try {
      final result = await _storageDataSource.getImages();
      return Right(result);
    } on CacheException catch (e) {
      return Left(UnexpectedError(e.message));
    } catch (e) {
      return Left(UnexpectedError(e.toString()));
    }
  }

  @override
  Future<ErrorOr<void>> saveImageToApp(Image image) async {
    try {
      final result = await _storageDataSource.saveImage(image);
      return Right(result);
    } on CacheException catch (e) {
      return Left(UnexpectedError(e.message));
    } catch (e) {
      return Left(UnexpectedError(e.toString()));
    }
  }

  @override
  Future<ErrorOr<void>> saveImageToGallery(Image image) {
    // TODO: implement saveImageToGallery
    throw UnimplementedError();
  }
}
