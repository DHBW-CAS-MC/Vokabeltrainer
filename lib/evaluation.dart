import 'package:flutter/material.dart';

class Evaluation extends StatelessWidget
{
  final String evaluationText;
  Evaluation(this.evaluationText);

  @override
  //build-Methode
  Widget build(BuildContext context)
  {
    return Container(
      //gesamte Breite des Bildschirms
        width: double.infinity,
        //Abstände in alle Richtungen 10px
        margin: EdgeInsets.all(60),
        child: Text(
          evaluationText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}