// @dart=2.9
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lernapp/cards.dart';
import 'package:path_provider/path_provider.dart';
import 'startpage.dart';
import 'mainPage.dart';
import 'question.dart';
import 'evaluation.dart';
import 'wordInput.dart';
import 'confirmation.dart';
import 'result.dart';
import 'vocabularyTrainer.dart';
import 'database.dart';
import 'cards.dart';
import 'addCard.dart';
import 'navBar.dart';
import 'dart:convert';
import 'flashcard.dart';

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
  int _language = 1;
  String _evaluationText = "";
  bool _startTrainer = false;
  bool _startCards = false;
  bool _startAddCard = false;

  Future<List> _contentDbFuture = DbEnglish().getDb();
  List _contentDb;

  bool _answerCorrect = true;
  int sex = 0;
  var _appColor = Colors.green;

  //variables for vocabulary input
  final GlobalKey<FormState> _formKeyWord = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyUsername = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyCards = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _textControllerUsername = TextEditingController();
  final _textControllerCardsGerman = TextEditingController();
  final _textControllerCardsEnglish = TextEditingController();
  String _userInput = '';
  String _userName = '';
  String _german = '';
  String _english = '';

  //functions for vocabulary input
  void _clearWordInput() {
    _textController.clear();
  }

  void _clearUsernameInput() {
    _textControllerUsername.clear();
  }

  void _clearCardsInputGerman() {
    _textControllerCardsGerman.clear();
  }

  void _clearCardsInputEnglish() {
    _textControllerCardsEnglish.clear();
  }

  void getLanguage() async {
    switch (_language) {
      case 1:
        {
          Future _contentDbFuture = DbEnglish().getDb();
          _contentDb = await _contentDbFuture;
          break;
        }
      case 2:
        {
          Future _contentDbFuture = DbSpanish().getDb();
          _contentDb = await _contentDbFuture;
          break;
        }
      case 3:
        {
          Future _contentDbFuture = DbFrench().getDb();
          _contentDb = await _contentDbFuture;
          break;
        }
      case 4:
        {
          Future _contentDbFuture = DbItalian().getDb();
          _contentDb = await _contentDbFuture;
          break;
        }
      default:
        print("no language selected");
    }
  }

  void getContentDb() async {
    getLanguage();
  }

  void _evaluation(String antwort) async {
    Future _contentDbFuture = DbEnglish().getDb();
    _contentDb = await _contentDbFuture;
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

  void _confirmationHandlerTrainer() async {
    Future _contentDbFuture = DbEnglish().getDb();
    _contentDb = await _contentDbFuture;
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

  void _setVokabel() async {
    if (_formKeyCards.currentState.validate()) {
      setState(() {
        _german = _textControllerCardsGerman.text;
        _english = _textControllerCardsEnglish.text;
        _startTrainer = false;
        _startCards = true;
        _startAddCard = false;
      });
      await DbEnglish().writeWord(_german, _english);
    }
    await getContentDb();
    await _showNextCard();
  }

  void _confirmationHandlerUsername() {
    if (_formKeyUsername.currentState.validate()) {
      setState(() {
        _userName = _textControllerUsername.text;
      });
    }
  }

  void _setSex(int value) {
    setState(() {
      sex = value;
      if (sex == 1) {
        _appColor = Colors.blue;
      } else {
        _appColor = Colors.pink;
      }
    });
  }

  void _confirmationStartTrainer() {
    setState(() {
      _startTrainer = true;
      _startCards = false;
      _startAddCard = false;
      getContentDb();
    });
  }

  void _confirmationStartCards() {
    setState(() {
      _startTrainer = false;
      _startCards = true;
      _startAddCard = false;
      getContentDb();
    });
  }

  void _confirmationStartAddCard() {
    setState(() {
      _startTrainer = false;
      _startCards = false;
      _startAddCard = true;
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

  void _showNextCard() async {
    Future _contentDbFuture = DbEnglish().getDb();
    _contentDb = await _contentDbFuture;
    setState(() {
      _cardIndex = (_cardIndex < (_contentDb.length - 1)) ? _cardIndex + 1 : 0;
    });
  }

  void _showPrevCard() async {
    Future _contentDbFuture = DbEnglish().getDb();
    _contentDb = await _contentDbFuture;
    setState(() {
      _cardIndex =
          (_cardIndex - 1 >= 0) ? _cardIndex - 1 : _contentDb.length - 1;
    });
  }

  Future<void> _deleteCard(index) async {
    await DbEnglish().deleteWord(index);
    await getContentDb();
    await _showPrevCard();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          drawer: NavBar(),
          appBar: AppBar(
            backgroundColor: _appColor,
            title: Text(
              'Vokabeltrainer',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
          ),
          body: _startTrainer == false &&
                  _startCards == false &&
                  _startAddCard == false
              ? StartPage(
                  sex,
                  _appColor,
                  _userName,
                  _textControllerUsername,
                  _formKeyUsername,
                  _clearUsernameInput,
                  _confirmationHandlerUsername,
                  _confirmationStartTrainer,
                  _setSex,
                  _confirmationStartCards)
              : _startTrainer == true &&
                      _startCards == false &&
                      _startAddCard == false
                  ? MainPage(
                      _appColor,
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
                      _resetTrainer)
                  : _startTrainer == false &&
                          _startCards == true &&
                          _startAddCard == false
                      ? Cards(
                          _cardIndex,
                          _contentDb,
                          _formKeyWord,
                          _textController,
                          _showNextCard,
                          _showPrevCard,
                          _confirmationStartAddCard,
                          _clearWordInput,
                          _resetTrainer,
                          _deleteCard)
                      : AddCard(
                          _german,
                          _english,
                          _textControllerCardsGerman,
                          _textControllerCardsEnglish,
                          _formKeyCards,
                          _clearCardsInputGerman,
                          _clearCardsInputEnglish,
                          _setVokabel,
                          _confirmationStartTrainer,
                          _confirmationStartCards,
                          _appColor)),
    );
  }
}
