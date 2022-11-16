import 'dart:ffi';

import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalscore = 0;
  var resetHandler = 0;

  final _questions = const [
    {
      'questionText': 'Was ist deine Lieblingsfarbe?',
      'answers': [
        {'text': 'Schwarz', 'score': 10},
        {'text': 'Rot', 'score': 5},
        {'text': 'Blau', 'score': 3},
        {'text': 'Schwarz', 'score': 1}
      ]
    },
    {
      'questionText': 'Was ist dein Lieblingstier?',
      'answers': [
        {'text': 'Hund', 'score': 10},
        {'text': 'Katze', 'score': 5},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Elefant', 'score': 1}
      ]
    },
    {
      'questionText': 'Was ist dein Lieblingsdozent?',
      'answers': [
        {'text': 'Becher', 'score': 10},
        {'text': 'Straub', 'score': 5},
        {'text': 'Hübl', 'score': 3},
        {'text': 'Plümicke', 'score': 1}
      ]
    },
  ];

  var questions = [
    {
      'questionText': 'Was ist deine Lieblingsfarbe?',
      'answers': ['Schwarz', 'Rot', 'Blau', 'Magenta']
    },
    {
      'questionText': 'Was ist dein Lieblingstier?',
      'answers': ['Hund', 'Katze', 'Tiger', 'Elefant']
    },
    {
      'questionText': 'Was ist dein Lieblingsdozent?',
      'answers': ['Becher', 'Straub', 'Hübl', 'Plümicke']
    },
  ];

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }


  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
        _questionIndex = _questionIndex + 1;
      },
    );
    print(_questionIndex);

    if (_questionIndex < questions.length) {
      print('Wir haben noch ein paar Fragen übrig!');
    }
  }

  //Methode build zum Anzeigen auf dem Bildschirm
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meine erste App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questions: _questions,
          questionIndex: _questionIndex,
        )
            : Result(_totalscore,_resetQuiz),
      ),
    );
  }
}
