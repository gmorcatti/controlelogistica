import 'package:controlelogistica/Home/components/tile_vaga.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List vagas = [
    { 'id': 1, 'placa': '1234', 'horario': '1234', 'ocupada': true },
    { 'id': 2, 'placa': 'asd', 'horario': '456', 'ocupada': false },
    { 'id': 3, 'placa': 'qwe', 'horario': '798', 'ocupada': false },
    { 'id': 4, 'placa': 'zxc', 'horario': '1011', 'ocupada': true },
  ];

  void handleChangeVaga(String id) {
    setState(() {
      List index = vagas.where((vaga) => vaga['id'] == id).toList();

      bool isOcupada = index[0]['ocupada'] == true;
      index[0]['ocupada'] = isOcupada ? false : true;
      debugPrint('$index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Garagem'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: vagas.length,
        itemBuilder: (context, index){
          return TileVaga(
            id: vagas[index]['id'], 
            placa: vagas[index]['placa'],  
            horario: vagas[index]['horario'],  
            ocupada: vagas[index]['ocupada'],
            onPressed: handleChangeVaga,
          );
        },
      )
    );
  }
}