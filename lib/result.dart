import 'dart:ui';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final void Function() resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 1) {
      resultText = 'Du solltest mehr üben!';
    } else if (resultScore <= 2) {
      resultText = 'Du bist ok';
    } else {
      resultText = 'Du bist sehr gut!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(""),
            MaterialButton(
              child: Text("Trainer neustarten", style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: resetHandler,
            ),
          ],
        )
    );
  }
}

