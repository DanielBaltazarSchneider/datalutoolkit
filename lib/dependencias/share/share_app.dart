import 'dart:io';

import 'package:share_plus/share_plus.dart';

class ShareApp {
  Future<void> shareFile(File file, {String? filename}) async {
    final result = await Share.shareXFiles([XFile(file.path)], text: filename ?? 'Recomendação de calagem');

    if (result.status == ShareResultStatus.dismissed) {
      print('Did you not like the pictures?');
    }
  }

  Future<void> shareText(String txt) async {
    Share.share(txt);
  }
}
