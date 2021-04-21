import 'package:controlelogistica/Home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Garagem',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Antonio'
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}