import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Widget de AppBar com tamanho customizado
class AppBarWidget extends PreferredSize {
  AppBarWidget()
    : super(
      preferredSize: Size.fromHeight(100),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.blue[200],
            ],
          ),
        ),
        child: Center(
          child: Text('Gerenciador de\nGaragem',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            )
          ),
        )
      ),
    );
}
