import 'dart:ffi';
import 'package:flutter/material.dart';
import 'startpage.dart';
import 'mainPage.dart';
import 'question.dart';
import 'evaluation.dart';
import 'wordInput.dart';
import 'confirmation.dart';
import 'result.dart';
import 'vocabularyTrainer.dart';
import 'databse.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalscore = 0;
  String _evaluationText = "";
  bool _startTrainer = false;

  List _contentDb = WriteDb().getTestDb();
  bool _answerCorrect = true;
  int sex = 1;

  //variables for vocabulary input
  final GlobalKey<FormState> _formKeyWord = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyUsername = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _textControllerUsername = TextEditingController();
  String _userInput = '';
  String _userName = '';

  //functions for vocabulary input
  void _clearWordInput() {
    _textController.clear();
  }

  void _clearUsernameInput() {
    _textControllerUsername.clear();
  }

  void _evaluation(String antwort) {
    _textController.clear();
    if ((antwort == _contentDb[_questionIndex]['answer'] as String)) {
      _evaluationText =
          "Klasse, " + _userName + "! " + "Die Antwort war korrekt.";
      _totalscore += 1;
    } else {
      _evaluationText = "Schade, " +
          _userName +
          "! " +
          "Die Antwort war leider nicht korrekt. Die richtige Antwort lautet " +
          '"' +
          (_contentDb[_questionIndex]['answer'] as String) +
          '"';
    }
  }

  void _confirmationHandlerTrainer() {
    if (_formKeyWord.currentState!.validate()) {
      setState(() {
        _userInput = _textController.text;
        if (_questionIndex < _contentDb.length - 1) {
          _evaluation(_userInput);
        }
        _answerQuestion();
      });
    }
  }

  void _confirmationHandlerUsername() {
    if (_formKeyUsername.currentState!.validate()) {
      setState(() {
        _userName = _textControllerUsername.text;
      });
    }
  }

  void _setSex(int value) {
    setState(() {
      sex = value;
    });
  }

  void _confirmationStartTrainer() {
    setState(() {
      _startTrainer = true;
    });
  }

  void _answerQuestion() {
    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
  }

  void _resetTrainer() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
      _userInput = "";
      _evaluationText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'Vokabeltrainer',
                  style: TextStyle(
                    fontSize: 26,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.indigo,
                  ),
                ),
                // Solid text as fill.
                Text(
                  'Vokabeltrainer',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          body: _startTrainer == false
              ? StartPage(
                  sex,
                  _userName,
                  _textControllerUsername,
                  _formKeyUsername,
                  _clearUsernameInput,
                  _confirmationHandlerUsername,
                  _confirmationStartTrainer,
                  _setSex)
              : MainPage(
                  _questionIndex,
                  _contentDb,
                  _totalscore,
                  _evaluationText,
                  _userName,
                  _answerCorrect,
                  _formKeyWord,
                  _textController,
                  _confirmationHandlerTrainer,
                  _clearWordInput,
                  _resetTrainer)),
    );
  }
}
