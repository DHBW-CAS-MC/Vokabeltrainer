import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  final String buttonText;
  var appColor;
  final void Function() confirmationHandler;

  Confirmation(this.buttonText, this.appColor, this.confirmationHandler);

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

class ConfirmationCard extends StatelessWidget {
  var appColor;
  final String buttonText;
  final void Function() confirmationHandler;
  final String german;
  final String english;

  ConfirmationCard(this.appColor, this.buttonText, this.confirmationHandler, this.german, this.english);

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
