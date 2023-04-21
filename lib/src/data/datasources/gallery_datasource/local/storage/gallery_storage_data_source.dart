import 'dart:io';
import 'dart:ui';

import 'package:flutter_painter/flutter_painter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_belt/src/core/errors/exception.dart';

abstract class IGalleryStorageDataSource {
  Future<void> saveImage(Image image);
  Future<List<String>> getImages();
  Future<void> deleteImage(Image image);
  Future<void> deleteAllImages();
}

class GalleryStorageDataSource implements IGalleryStorageDataSource {
  const GalleryStorageDataSource(
    this._prefs,
    String appDocDirPath,
  ) : _imagesPath = '$appDocDirPath/images';

  final SharedPreferences _prefs;
  final String _imagesPath;

  static const String imagesKey = 'imagesKey';

  @override
  Future<void> saveImage(Image image) async {
    final pngBytes = await image.pngBytes;

    if (pngBytes == null) {
      throw CacheException('Something went wrong...');
    }

    final imageName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final file = await File('$_imagesPath/$imageName').create(recursive: true);
    await file.writeAsBytes(pngBytes);

    _prefs.setStringList(
      imagesKey,
      [...?_prefs.getStringList(imagesKey), imageName],
    );
  }

  @override
  Future<List<String>> getImages() async {
    final imageNames = _prefs.getStringList(imagesKey);

    return imageNames?.map((name) => '$_imagesPath/$name').toList() ?? [];
  }

  @override
  Future<void> deleteAllImages() {
    // TODO: implement deleteAllImages
    throw UnimplementedError();
  }

  @override
  Future<void> deleteImage(Image image) {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }
}
