import 'package:flutter/material.dart';
import './screens/homeScreen.dart';

void main()=>runApp(SIC());

class SIC extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Simple Interest Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blueAccent,
        primaryColor: Colors.brown,
        brightness: Brightness.dark
      ),
      home: HomeScreen(),
    );
  }
}