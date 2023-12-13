import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lecture_1_app/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    return Scaffold(
      backgroundColor: Colors.blue,  // Поменять
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Column(
              children: [
                Text('Flutter', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),), // Поменять (опционально)
              ],
            ),
            Text('Королёв Кирилл, 211-323', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),) // Поменять (обязательно)
          ],
        )
      )
    );
  }
}
