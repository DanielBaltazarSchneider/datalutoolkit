import 'package:open_filex/open_filex.dart';

class OpenFileApp {
  static Future<void> open(String path) async {
    await OpenFilex.open(path);
  }
}
