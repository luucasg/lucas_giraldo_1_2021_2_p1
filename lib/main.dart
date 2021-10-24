import 'package:dogs_lucas/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dogs Api - Parcial Distribuida',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(title: 'Dogs Api - Parcial Distribuida'),
    );
  }
}
