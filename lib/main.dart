import 'package:flutter/material.dart';
import 'package:pageview/UI/Pages/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SplashScreen(),
      theme: ThemeData(primaryColor: Colors.blueGrey[900]),
    );
  }
}
