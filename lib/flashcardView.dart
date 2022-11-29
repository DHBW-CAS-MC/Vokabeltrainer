import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  var appColor;
  final String text;

  FlashcardView({Key? key, this.appColor, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 15,
      child: Center(
        child: Text(text, textAlign: TextAlign.center, style: TextStyle(color: appColor, fontSize: 26)),
      ),
    );
  }
}
