import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pageview/UI/Pages/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Timer(Duration(seconds: 4), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => HomePage(),
            ));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Image.asset(
          'assets/fondol.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
