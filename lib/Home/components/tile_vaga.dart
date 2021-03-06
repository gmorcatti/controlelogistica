import 'package:flutter/material.dart';

// Widget para cada card de vaga existente.
class TileVaga extends StatelessWidget {
  
  final String id;
  final String placa;
  final String horario;
  final bool ocupada;
  final Function onPressed;

  TileVaga({this.id, this.placa, this.horario, this.ocupada, this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black26,
              Colors.black12,
            ],
          ),
      ),
      height: 80.0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundColor: ocupada ? Colors.red : Colors.green,
              child: Icon(
                ocupada ? Icons.highlight_remove_outlined : Icons.check_circle_outline,
                color: Colors.white,
              )
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Vaga $id', 
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 3.0,),
                Text('${ocupada ? "Placa do Veículo" : "Último Veículo"}: $placa'),
                SizedBox(height: 3.0,),
                Text('Horário de ${ocupada ? "Entrada" : "Saída"}: $horario'),
              ]
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 25, 5),
            child: IconButton(
              icon: ocupada ? Icon(Icons.logout) : Icon(Icons.login),
              tooltip: ocupada ? 'Remover caminhão' : 'Adicionar caminhão',
              onPressed: () {
                onPressed(id);
              },
            ),
          ),
        ],
      ),
    );
  }
}