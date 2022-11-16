import 'package:flutter/material.dart';

class Answer extends StatelessWidget
{
  final void Function() selectHandler;
  final String answerText;

  Answer(this.selectHandler,this.answerText);

  @override
  //build-Methode
  Widget build(BuildContext context)
  {
    return Container(
        //gesamte Breite des Bildschirms
        width: double.infinity,
        //Abstände in alle Richtungen 10px
        child: ElevatedButton(
          child:Text(answerText),
          style:ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: selectHandler,
        ),
        );
  }
}