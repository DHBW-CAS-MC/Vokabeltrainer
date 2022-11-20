import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  final String buttonText;
  final void Function() confirmationHandler;

  Confirmation(this.buttonText, this.confirmationHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
          onPressed: this.confirmationHandler,
          color: Colors.blue,
          child: Text(this.buttonText, style: TextStyle(color: Colors.white)),
        ));
  }
}
