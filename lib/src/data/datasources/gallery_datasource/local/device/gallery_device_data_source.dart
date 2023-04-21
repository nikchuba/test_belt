import 'package:image_picker/image_picker.dart';

abstract class IGalleryDeviceDataSource {
  Future<XFile?> pickImage(ImageSource source);
}
