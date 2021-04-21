import 'dart:convert';

import 'package:controlelogistica/Home/components/tile_vaga.dart';
import 'package:controlelogistica/archives/index.dart';
import 'package:controlelogistica/components/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textFieldController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showDialog = false;

  String lastIdVagaChanged = '';

  List vagas = [];

  Archive archive = Archive();

  @override
  initState(){
    // Ao se abrir o app busca os dados salvos no .json ou busca os dados padrões.
    super.initState();

    archive.readData()
      .then((data) {
        setState(() {
          vagas = json.decode(data);
        });
      })
      .catchError((Object error) {
        setState(() {
          String encodedJson = archive.readDefaultData();

          vagas = json.decode(encodedJson);
        });
      });
  }

  // Função para retornar o horário formatado.
  String getFormatedTime() {
    DateTime dt = DateTime.now();
    DateFormat newFormat = DateFormat("HH:mm");
    String updatedDt = newFormat.format(dt);
    return updatedDt;
  }

  // Função acionada sempre que o botão de cada tile é acionada.
  void handleChangeVaga(String id) {
    setState(() {
      List index = vagas.where((vaga) => vaga['id'] == id).toList();
      bool isOcupada = index[0]['ocupada'] == true;

      if (isOcupada) {
        index[0]['ocupada'] = false;
        index[0]['horario'] = getFormatedTime();
      } else {
        showDialog = true;
        lastIdVagaChanged = id;
      }

      archive.saveData(vagas);
    });
  }

  // Ao cancelar o dialog existente.
  void _cancelAddVeiculo() {
    setState(() {
      showDialog = false;
    });
  }

  // Ao confirmar o dialog existente. Atualiza os dados da vaga selecionada.
  void _addVeiculo() {
    setState(() {
      List index =
          vagas.where((vaga) => vaga['id'] == lastIdVagaChanged).toList();

      index[0]['ocupada'] = true;
      index[0]['placa'] = _textFieldController.text;
      index[0]['horario'] = getFormatedTime();

      _textFieldController.text = '';
      showDialog = false;

      archive.saveData(vagas);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
        body: Stack(
          children: <Widget>[
            Container(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: vagas.length,
                itemBuilder: (context, index) {
                  return TileVaga(
                    id: '${vagas[index]['id']}',
                    placa: vagas[index]['placa'],
                    horario: vagas[index]['horario'],
                    ocupada: vagas[index]['ocupada'],
                    onPressed: handleChangeVaga,
                  );
                },
              ),
            ),
            showDialog
                ? Container(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    child: Form(
                      key: _formKey,
                      child: AlertDialog(
                        title: Text('Qual a placa do veículo?'),
                        content: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Informe a placa do veículo";
                            }
                          },
                          controller: _textFieldController,
                          decoration: InputDecoration(hintText: 'Placa'),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black12)),
                              child: Text('Cancelar'),
                              onPressed: _cancelAddVeiculo),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue[300])),
                            child: Text('OK'),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _addVeiculo();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : Container()
          ],
        ));
  }
}
