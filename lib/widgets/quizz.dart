import 'package:flutter/material.dart';
import 'package:flutter_quizz/widgets/text_utils.dart';
import 'package:flutter_quizz/models/question.dart';
import 'dart:async';

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => new _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  Question question;
  List<Question> listQuestions = [
    new Question('Paris est-elle la capitale de la France ? ', true,
        "Et oui ! Paris est bien notre capitale !", 'paris.jpg')
  ];

  int index = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    question = listQuestions[index];
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5;
    return new Scaffold(
      appBar: new AppBar(
        title: new TextUtils("Quizz | PARTIE"),
      ),
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new TextUtils("Question numéro ${index + 1}", color: Colors.grey),
          new TextUtils(
            "Score : $score / ${index + 1} ",
            color: Colors.grey,
          ),
          new Card(
            elevation: 8.0,
            child: new Container(
              height: size,
              width: size,
              child: Image.asset("assets/" + question.imagePath),
            ),
          ),
          new TextUtils(question.question,
              color: Colors.grey, textScaleFactor: 1.5),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [boutonBool(true), boutonBool(false)],
          ) // Récupère la question
        ],
      )),
    );
  }

  RaisedButton boutonBool(bool b) {
    return new RaisedButton(
        color: Colors.green,
        elevation: 8.0,
        onPressed: () => dialog(b),
        child: TextUtils(
          b ? "Vrai" : "Faux",
          color: Colors.white,
        ));
  }

  Future dialog(bool b) async {
    bool bonneResponse = (b == question.response);
    String vrai = "assets/true.png"; // Image en cas de bonne réponse
    String faux = "assets/false.png"; // Image en cas de mauvaise réponse

    if (bonneResponse) {
      score++; // Chaque bonne réponse augmente le score
    }
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new TextUtils(
              bonneResponse ? "Bravo !" : "Dommage !", // Condition Ternaire
              textScaleFactor: 1.5, // Augmente la taille de la police
              color: bonneResponse ? Colors.green : Colors.red,
            ),
            contentPadding: EdgeInsets.all(18),
            children: [
              new Image.asset(
                bonneResponse ? vrai : faux,
                fit: BoxFit.cover,
              ),
              new Container(height: 20), // Créer un container vide pour espace
              new TextUtils(question.explication,
                  textScaleFactor: 1.5, color: Colors.grey),
              new Container(height: 20),
              new RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                  getNextQuestion();
                },
                color: Colors.green,
                child: new TextUtils(
                  "Question Suivante",
                  color: Colors.white,
                  textScaleFactor: 1.2,
                ),
              ),
            ],
          );
        });
  }

  Future alerte() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: new TextUtils("Fin du quizz",
                color: Colors.purple, textScaleFactor: 1.5),
            contentPadding: EdgeInsets.all(10),
            content: new TextUtils(
              "Votre score :  $score/${index + 1} ",
              color: Colors.grey,
            ),
            actions: [
              // Permet de faire des actions en plus
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(buildContext); // Permet de fermer la fênetre
                    Navigator.pop(context); // Permet de fermer la fênetre
                  },
                  child: new TextUtils(
                    "Terminer",
                    textScaleFactor: 1.5,
                    color: Colors.purple,
                  ))
            ],
          );
        });
  }

  void getNextQuestion() {
    if (index < listQuestions.length - 1) {
      index++;
      setState(() {
        question = listQuestions[index];
      });
    } else {
      alerte();
    }
  }
}
