import 'package:flutter/material.dart';
import 'package:flutter_quizz/widgets/text_utils.dart';
import 'package:flutter_quizz/widgets/quizz.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title; // Récupère le titre crée dans une autre page

  @override
  _Home createState() => new _Home(); // Récupère la prochaine class
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(widget.title), // Insère le titre récupéré
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Card(
              elevation: 8.0,
              child: new Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: new Image.asset(
                  'assets/quizz_cover.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new QuizzPage();
                  }));
                },
                color: Colors.green,
                child: new TextUtils(
                  "Démarrer le quizz !",
                ))
          ],
        ),
      ),
    );
  }
}
