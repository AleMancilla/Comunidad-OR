import 'package:flutter/material.dart';
import 'package:pageview/UI/Pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comunidad OR',
      home: HomePage(),
      theme: ThemeData(primaryColor: Colors.blueGrey[900]),
    );
  }
}
