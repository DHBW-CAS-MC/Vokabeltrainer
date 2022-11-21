import 'package:flutter/material.dart';

class Evaluation extends StatelessWidget
{
  final String evaluationText;
  Evaluation(this.evaluationText);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(this.evaluationText, style: TextStyle(fontSize: 26)),
        ],
      ),
    );
  }
}