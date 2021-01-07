import 'package:flutter/material.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Quizz",
      theme: new ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false, // Enlever la banniere
      home: Home(title: "Quizz | VRAI / FAUX"),
    );
  }
}
