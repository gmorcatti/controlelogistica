import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Archive {

  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/garage.json");
  }

  Future<File> saveData(list) async {
    String data = json.encode(list);
    final file = await this.getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await this.getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

}