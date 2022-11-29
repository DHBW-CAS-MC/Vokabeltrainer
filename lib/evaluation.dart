import 'package:flutter/material.dart';

class Evaluation extends StatelessWidget {
  final String evaluationText;
  final bool answerCorrect;

  Evaluation(this.evaluationText, this.answerCorrect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        this.answerCorrect
            ? Stack(
                children: <Widget>[
                  Text(
                    this.evaluationText,
                    style: TextStyle(
                      fontSize: 26,
                      fontStyle: FontStyle.italic,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.green,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    this.evaluationText,
                    style: TextStyle(
                      fontSize: 26,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Stack(
                children: <Widget>[
                  Text(
                    this.evaluationText,
                    style: TextStyle(
                      fontSize: 26,
                      fontStyle: FontStyle.italic,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.red,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    this.evaluationText,
                    style: TextStyle(
                      fontSize: 26,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
      ]),
    );
  }
}
