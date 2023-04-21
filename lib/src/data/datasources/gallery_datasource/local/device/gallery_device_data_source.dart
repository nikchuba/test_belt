import 'package:image_picker/image_picker.dart';

abstract class IGalleryDeviceDataSource {
  Future<XFile?> pickImage(ImageSource source);
}

class GalleryDeviceDataSource implements IGalleryDeviceDataSource {
  const GalleryDeviceDataSource(this._picker);

  final ImagePicker _picker;

  @override
  Future<XFile?> pickImage(ImageSource source) {
    final xFile = _picker.pickImage(source: source);
    return xFile;
  }
}
