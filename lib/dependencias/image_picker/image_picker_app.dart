import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerApp {
  static ImagePicker _picker = ImagePicker();

  static Future<File?> gallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static Future<void> saveFile(File file, String fileName) async {
    Directory dir = await getTemporaryDirectory();
    String path = "${dir.path}/$fileName";
    File file2 = File(path);
    await file2.writeAsBytes(await file.readAsBytes());
  }

  static Future<File?> readFile(String fileName) async {
    Directory dir = await getTemporaryDirectory();
    String path = "${dir.path}/$fileName";
    if (await ImagePickerApp.exist(fileName)) {
      return File(path);
    }
    return null;
  }

  static Future<bool> exist(String fileName) async {
    Directory dir = await getTemporaryDirectory();
    String path = "${dir.path}/$fileName";
    File file2 = File(path);
    return file2.exists();
  }
}
