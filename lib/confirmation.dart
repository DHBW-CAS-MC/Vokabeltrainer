import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  final String buttonText = 'Bestätigung';
  final void Function() confirmationHandler;

  Confirmation(this.confirmationHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
          onPressed: this.confirmationHandler,
          color: Colors.blue,
          child: Text(buttonText, style: TextStyle(color: Colors.white)),
        ));
  }
}
