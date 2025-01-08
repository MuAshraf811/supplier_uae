import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static ImagePicker? _obj;

  static Future<XFile?> pick(bool fromCamera) async {
    _obj ??= ImagePicker();
    final xfile = await _obj!.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery);

    return xfile;
  }
}
