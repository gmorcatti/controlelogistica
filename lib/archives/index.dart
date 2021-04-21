import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Archive {

  Archive();

  List vagasIniciais = [
    {'id': '1', 'placa': 'RMX-1234', 'horario': '12:34', 'ocupada': true},
    {'id': '2', 'placa': 'ASD-9682', 'horario': '14:56', 'ocupada': false},
    {'id': '3', 'placa': 'QWE-8021', 'horario': '17:18', 'ocupada': false},
    {'id': '4', 'placa': 'ZXC-2982', 'horario': '10:11', 'ocupada': true},
    {'id': '5', 'placa': 'PJS-5389', 'horario': '10:11', 'ocupada': true},
    {'id': '6', 'placa': 'HJS-5743', 'horario': '10:11', 'ocupada': true},
    {'id': '7', 'placa': 'UIS-5874', 'horario': '10:11', 'ocupada': true},
    {'id': '8', 'placa': 'LKS-8922', 'horario': '10:11', 'ocupada': true},
  ];

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
      final file = await getFile();
      return file.readAsString();
    } catch (e) {
      return json.encode(vagasIniciais);
    }
  }

  String readDefaultData() {
    try {
      return json.encode(vagasIniciais);
    } catch (e) {
      return null;
    }
  }

}