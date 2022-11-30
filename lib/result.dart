import 'dart:ui';
import 'package:flutter/material.dart';
import 'barChart.dart';

class Result extends StatelessWidget {
  final int numerWrongAnswers;
  var appColor;
  final int totalscore;
  final String UserName;
  final List questions;
  final void Function() resetHandler;

  Result(this.numerWrongAnswers, this.appColor, this.totalscore, this.UserName,
      this.questions, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (totalscore < (this.numerWrongAnswers + this.totalscore)*0.5) {
      resultText = 'Hey ' +
          this.UserName +
          ', hier ist dein Ergebnis:\nDu hast ' +
          this.totalscore.toString() +
          '/' +
          (this.questions.length).toString() +
          ' Antworten richtig.\nDu solltest noch mehr üben!';
    } else if (totalscore <= (this.numerWrongAnswers + this.totalscore)*0.6) {
      resultText = 'Hey ' +
          this.UserName +
          ', hier ist dein Ergebnis:\nDu hast ' +
          this.totalscore.toString() +
          '/' +
          (this.questions.length).toString() +
          ' Antworten richtig.\nDas ist ok! Übe weiter, um besser zu werden!';
    }
    else if (totalscore <= (this.numerWrongAnswers + this.totalscore)*0.8) {
      resultText = 'Hey ' +
          this.UserName +
          ', hier ist dein Ergebnis:\nDu hast ' +
          this.totalscore.toString() +
          '/' +
          (this.questions.length).toString() +
          ' Antworten richtig.\nDas ist gut!';
    }
    else if (totalscore <= (this.numerWrongAnswers + this.totalscore)*0.9) {
      resultText = 'Hey ' +
          this.UserName +
          ', hier ist dein Ergebnis:\nDu hast ' +
          this.totalscore.toString() +
          '/' +
          (this.questions.length).toString() +
          ' Antworten richtig.\nDas ist sehr gut!';
    }
    else {
      resultText = 'Hey ' +
          this.UserName +
          ', hier ist dein Ergebnis:\nDu hast ' +
          this.totalscore.toString() +
          '/' +
          (this.questions.length).toString() +
          ' Antworten richtig.\nDas ist Spitze!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: <Widget>[
              Text(
                resultPhrase,
                style: TextStyle(
                  fontSize: 26,
                  fontStyle: FontStyle.italic,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = this.appColor,
                ),
              ),
              // Solid text as fill.
              Text(
                resultPhrase,
                style: TextStyle(
                  fontSize: 26,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(""),
          BarChart(this.totalscore, numerWrongAnswers),
          Text(""),
          MaterialButton(
            child: Text("Trainer neustarten",
                style: TextStyle(color: Colors.white)),
            color: this.appColor,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
