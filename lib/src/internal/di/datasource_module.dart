import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_belt/src/data/datasources/gallery_datasource/local/local.dart';

void init(GetIt locator) {
  locator
    ..registerSingleton<IGalleryDeviceDataSource>(
      GalleryDeviceDataSource(ImagePicker()),
    )
    ..registerSingletonAsync<IGalleryStorageDataSource>(
      () async => GalleryStorageDataSource(
        await SharedPreferences.getInstance(),
        (await getApplicationDocumentsDirectory()).path,
      ),
    );
}
