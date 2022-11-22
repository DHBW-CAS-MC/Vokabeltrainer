import 'dart:ffi';
import 'package:flutter/material.dart';
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

  List _contentDb = WriteDb().getTestDb();

  //variables for vocabulary input
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String _userInput = '';

  //functions for vocabulary input
  void _pressedHandler() {
    _textController.clear();
  }

  void _evaluation(String antwort) {
    _textController.clear();
    if (antwort == _contentDb[_questionIndex]['answer'] as String) {
      _evaluationText = "Super, die Antwort war korrekt!";
      _totalscore += 1;
    } else {
      _evaluationText =
          "Die Antwort war leider nicht korrekt. Die richtige Antwort lautet " +
              '"' +
              (_contentDb[_questionIndex]['answer'] as String) +
              '"';
    }
  }

  void _confirmationHandler() {
    //final form = _formKey.currentState;

    if (_formKey.currentState!.validate()) {
      setState(() {
        _userInput = _textController.text;
        _evaluation(_userInput);
        _answerQuestion();
      });
    }
  }

  //functions
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
          title: Text('Vokabeltrainer'),
        ),
        body: _questionIndex < _contentDb.length
            ? vocabularyTrainer(
                _questionIndex,
                _contentDb,
                _totalscore,
                _evaluationText,
                _textController,
                _formKey,
                _confirmationHandler,
                _pressedHandler)
            : Result(_totalscore, _resetTrainer),
      ),
    );
  }
}
