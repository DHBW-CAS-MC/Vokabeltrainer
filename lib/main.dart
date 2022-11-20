import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:lernapp/wordInput.dart';
import 'question.dart';
import 'evaluation.dart';
import 'wordInput.dart';
import 'confirmation.dart';
import 'result.dart';
import 'vocabularyTrainer.dart';

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
  String _evaluationText = "";

  var questions = [
    {
      'word': 'Katze',
      'answer': 'cat'
    },
    {
      'word': 'Hund',
      'answer': 'dog'
    },
    {
      'word': 'Schwein',
      'answer': 'pig'
    },
  ];


  //variables for vocabulary input
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String userPost = '';

  //functions for vocabulary input
  void _pressedHandler()
  {
    _textController.clear();
  }

  void _evaluation(String antwort)
  {
    _textController.clear();
    if(antwort == questions[_questionIndex]['answer'] as String)
      {
        _evaluationText = "Super, die Antwort war korrekt!";
        _totalscore += 1;
      }
    else
      {
        _evaluationText = "Die Antwort war leider nicht korrekt. Die richtige Antwort lautet " + '"' + (questions[_questionIndex]['answer'] as String) + '"';
      }
  }

  void _handleSubmitButton()
  {
    //final form = _formKey.currentState;

    if(_formKey.currentState!.validate()){
      setState(() {
        userPost = _textController.text;
        _evaluation(userPost);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vokabeltrainer'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //display text
              Evaluation(_evaluationText),
              Question(questions[_questionIndex]['word'] as String),
              WordInput(_textController,_pressedHandler),
              Confirmation(_handleSubmitButton)
            ],
          ),
        ),
      ),
    );
  }
}
