import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Archive {

  Archive();

  // Cria lista padrão de vagas para caso não se tenha o arquivo base.
  List vagasIniciais = [
    {'id': '1', 'placa': 'RMX-1234', 'horario': '12:34', 'ocupada': true},
    {'id': '2', 'placa': 'ASD-9682', 'horario': '14:56', 'ocupada': false},
    {'id': '3', 'placa': 'QWE-8021', 'horario': '17:18', 'ocupada': false},
    {'id': '4', 'placa': 'ZXC-2982', 'horario': '10:11', 'ocupada': true},
    {'id': '5', 'placa': 'PJS-5389', 'horario': '10:11', 'ocupada': true},
    {'id': '6', 'placa': 'HJS-5743', 'horario': '10:11', 'ocupada': true},
    {'id': '7', 'placa': 'UIS-5874', 'horario': '10:11', 'ocupada': true},
    {'id': '8', 'placa': 'LKS-8922', 'horario': '10:11', 'ocupada': false},
    {'id': '9', 'placa': 'KSD-9012', 'horario': '12:34', 'ocupada': true},
    {'id': '10', 'placa': 'HGH-0012', 'horario': '14:56', 'ocupada': false},
    {'id': '11', 'placa': 'LOLS-8721', 'horario': '17:18', 'ocupada': false},
    {'id': '12', 'placa': 'CXA-0112', 'horario': '10:11', 'ocupada': true},
    {'id': '13', 'placa': 'SJP-8321', 'horario': '10:11', 'ocupada': true},
    {'id': '14', 'placa': 'KKI-3123', 'horario': '10:11', 'ocupada': false},
    {'id': '15', 'placa': 'OPA-3189', 'horario': '10:11', 'ocupada': true},
    {'id': '16', 'placa': 'KLB-8637', 'horario': '10:11', 'ocupada': true},
  ];

  // Função para recolher arquivos .json e retornar os dados.
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/garage.json");
  }

  // Função para salvar o arquivo .json com novos dados.
  Future<File> saveData(list) async {
    String data = json.encode(list);
    final file = await this.getFile();
    return file.writeAsString(data);
  }

  // Função para realizar a leitura dos dados salvos.
  Future<String> readData() async {
      final file = await getFile();
      return file.readAsString();
  }

  // Função para fazer a leitura dos dados padrões.
  String readDefaultData() {
    try {
      return json.encode(vagasIniciais);
    } catch (e) {
      return null;
    }
  }

}