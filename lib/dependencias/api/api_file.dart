import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiFile extends ChangeNotifier {
  int total = 0;
  int received = 0;

  late http.StreamedResponse _response;
  final List<int> bytes = [];

  Future<File?> downloadFile(String url, String fileName) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      // Salvar no diretório de armazenamento externo
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';

      // Escrever os bytes do arquivo
      File file = await File(filePath).writeAsBytes(bytes);
      return file;
    } else {
      return null;
    }
  }

  Future<void> downloadProgressFile(String url, String fileName) async {
    try {
      _response = await http.Client().send(http.Request('GET', Uri.parse(url)));
      total = _response.contentLength ?? 0;
      notifyListeners();
      _response.stream.listen((value) {
        bytes.addAll(value);
        received += value.length;
        notifyListeners();
      }).onDone(() async {
        final file = File('${(await getApplicationDocumentsDirectory()).path}/$fileName');
        await file.writeAsBytes(bytes);
        notifyListeners();
      });
    } catch (e, s) {
      log("$e\n\n$s");
    }
  }
}
