import 'package:controlelogistica/Home/components/tile_vaga.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Garagem'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: 5,
        itemBuilder: (context, index){
          return TileVaga('Teste', 'GYB-1983', '19:15', false);
        },
      )
    );
  }
}