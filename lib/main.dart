import 'dart:ffi';
import 'package:flutter/material.dart';

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

  var questions = [
    {'questionText': 'Katze', 'answers': 'cat'},
    {'questionText': 'Hund', 'answers': 'dog'},
    {'questionText': 'Schwein', 'answers': 'pig'},
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

  void _handleSubmitButton() {
    //final form = _formKey.currentState;

    if(_formKey.currentState!.validate()){
      setState(() {
        userPost = _textController.text;
      });
      print(userPost);
    }
  }

  //functions
  void _answerQuestion(int score) {
    _totalscore += score;
    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
    print(_questionIndex);

    if (_questionIndex < questions.length) {
      print('Wir haben noch ein paar Fragen übrig!');
    }
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
              Text('', style: TextStyle(fontSize: 20)),
              Text('Frage', style: TextStyle(fontSize: 20)),
              Text('', style: TextStyle(fontSize: 15)),
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Bitte gib die Vokabel ein',
                  labelText: 'Antwort',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: _pressedHandler,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r'^[a-zA-Z]+$').hasMatch(value!)) {
                    return null;
                  } else {
                    return "Bitte gib ein korrektes Wort ein";
                  }
                },
              ),
              MaterialButton(
                onPressed: _handleSubmitButton,
                color: Colors.blue,
                child: const Text('Bestätigung',
                    style: TextStyle(color: Colors.white)),
              ),
              Text('', style: TextStyle(fontSize: 15))
            ],
          ),
        ),
      ),
    );
  }
}
