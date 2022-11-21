import 'dart:ffi';
import 'package:flutter/material.dart';
import 'startpage.dart';
import 'mainPage.dart';

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

  final List <Map<String, String>> _questions = [
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
    {
      'word':'',
      'answer': ''
    }
  ];


  //variables for vocabulary input
  final GlobalKey<FormState> _formKeyWord = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyUsername = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _textControllerUsername = TextEditingController();
  String _userInput = '';
  String _userName ='';

  //functions for vocabulary input
  void _clearWordInput()
  {
    _textController.clear();
  }

  void _clearUsernameInput()
  {
    _textControllerUsername.clear();
  }

  void _evaluation(String antwort)
  {
    _textController.clear();
    if((antwort == _questions[_questionIndex]['answer'] as String))
      {
        _evaluationText = "Klasse, " + _userName + "! " + "Die Antwort war korrekt.";
        _totalscore += 1;
      }
    else
      {
        _evaluationText = "Schade, " + _userName + "! "+ "Die Antwort war leider nicht korrekt. Die richtige Antwort lautet " + '"' + (_questions[_questionIndex]['answer'] as String) + '"';
      }
  }

  void _confirmationHandlerTrainer()
  {
    if(_formKeyWord.currentState!.validate()){
      setState(() {
        _userInput = _textController.text;
        if(_questionIndex < _questions.length -1) {
          _evaluation(_userInput);
        }
        _answerQuestion();
      });
    }
  }

  void _confirmationHandlerUsername()
  {
    if(_formKeyUsername.currentState!.validate()){
      setState(() {
        _userName = _textControllerUsername.text;
      });
    }
  }


 void _confirmationStartTrainer()
 {
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

  void _resetTrainer(){
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
        body:
        _startTrainer == false?
          StartPage(_userName, _textControllerUsername, _formKeyUsername, _clearUsernameInput, _confirmationHandlerUsername, _confirmationStartTrainer)
            :MainPage(_questionIndex, _questions, _totalscore, _evaluationText,_userName, _formKeyWord, _textController, _confirmationHandlerTrainer, _clearWordInput, _resetTrainer)
      ),
    );
  }
}
