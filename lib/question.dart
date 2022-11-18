import 'package:flutter/material.dart';

class Question extends StatelessWidget
{
  final String questionText;
  Question(this.questionText);

  @override
  //build-Methode
  Widget build(BuildContext context)
  {
    return Container(
      //gesamte Breite des Bildschirms
        width: double.infinity,
        //Abstände in alle Richtungen 10px
        margin: EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}