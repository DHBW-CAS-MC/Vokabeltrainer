import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  final String buttonText;
  var appColor;
  final void Function() confirmationHandler;

  Confirmation(this.buttonText,this.appColor, this.confirmationHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
          onPressed: this.confirmationHandler,
          color: this.appColor,
          child: Text(this.buttonText, style: TextStyle(color: Colors.white)),
        ));
  }
}
