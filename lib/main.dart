// @dart=2.9
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:lernapp/cards.dart';
import 'startpage.dart';
import 'mainPage.dart';
import 'question.dart';
import 'evaluation.dart';
import 'wordInput.dart';
import 'confirmation.dart';
import 'result.dart';
import 'vocabularyTrainer.dart';
import 'databse.dart';
import 'cards.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _cardIndex = 0;
  int _totalscore = 0;
  String _evaluationText = "";
  bool _startTrainer = false;

  List _contentDb = WriteDb().getTestDb();
  // var test = Test7().writeJson('test3', 'test4');
  // var moin = Test7().readJson();

  //variables for vocabulary input
  final GlobalKey<FormState> _formKeyWord = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyUsername = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyCards = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _textControllerUsername = TextEditingController();
  final _textControllerCards = TextEditingController();
  String _userInput = '';
  String _userName = '';

  //functions for vocabulary input
  void _clearWordInput() {
    _textController.clear();
  }

  void _clearUsernameInput() {
    _textControllerUsername.clear();
  }

  void _clearCardsInput() {
    _textControllerCards.clear();
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
    if (_formKeyWord.currentState.validate()) {
      setState(() {
        _userInput = _textController.text;
        if (_questionIndex < _contentDb.length - 1) {
          _evaluation(_userInput);
        }
        _answerQuestion();
      });
    }
  }

  void _confirmationHandlerCards() {
    if (_formKeyCards.currentState.validate()) {
      setState(() {
        _userInput = _textControllerCards.text;
        if (_questionIndex < _contentDb.length - 1) {
          _evaluation(_userInput);
        }
        _answerQuestion();
      });
    }
  }

  void _confirmationHandlerUsername() {
    if (_formKeyUsername.currentState.validate()) {
      setState(() {
        _userName = _textControllerUsername.text;
      });
    }
  }

  void _confirmationStartTrainer() {
    setState(() {
      _startTrainer = true;
    });
  }

  void _confirmationStartCards() {
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

  void _showNextCard() {
    setState(() {
      _cardIndex = (_cardIndex < _contentDb.length) ? _cardIndex + 1 : 0;
    });
  }

  void _showPrevCard() {
    setState(() {
      _cardIndex =
          (_cardIndex - 1 >= 0) ? _cardIndex - 1 : _contentDb.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Vokabeltrainer'),
          ),
          body: _startTrainer == false
              ? StartPage(
                  _userName,
                  _textControllerUsername,
                  _formKeyUsername,
                  _clearUsernameInput,
                  _confirmationHandlerUsername,
                  _confirmationStartTrainer,
                  _confirmationStartCards)
              // : MainPage(
              //     _questionIndex,
              //     _contentDb,
              //     _totalscore,
              //     _evaluationText,
              //     _userName,
              //     _formKeyWord,
              //     _textController,
              //     _confirmationHandlerTrainer,
              //     _clearWordInput,
              //     _resetTrainer)),
              : Cards(
                  _cardIndex,
                  _contentDb,
                  _formKeyWord,
                  _textController,
                  _showNextCard,
                  _showPrevCard,
                  _confirmationHandlerTrainer,
                  _clearWordInput,
                  _resetTrainer)),
    );
  }
}
