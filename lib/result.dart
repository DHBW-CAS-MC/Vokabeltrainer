import 'dart:ui';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final void Function() resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'Du bist nicht so super drauf!';
    } else if (resultScore <= 12) {
      resultText = 'Du bist ok';
    } else if (resultScore <= 16) {
      resultText = 'Du bist gut!';
    } else {
      resultText = 'Du bist sehr gut!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      TextButton(
        child: Text('Quiz neustarten!'),
        onPressed: resetHandler,
      )
    ]));
  }
}
