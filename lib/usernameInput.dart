import 'package:flutter/material.dart';
import 'confirmation.dart';
import 'wordInput.dart';

class UsernameInput extends StatelessWidget {
  final String hinttext = 'Dein Name';
  final String labelText = 'Wie heißt du?';
  final String errorText = 'Bitte gib einen korrekten Namen ein!';

  final textControllerUsernameInput;

  final void Function() clearUsernameInput;
  final void Function() confirmationHandlerUsername;

  UsernameInput(this.textControllerUsernameInput, this.clearUsernameInput,
      this.confirmationHandlerUsername);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WordInput(this.hinttext, this.labelText, this.errorText,
              this.textControllerUsernameInput, this.clearUsernameInput),
          Text(""),
          FloatingActionButton(
              onPressed: this.confirmationHandlerUsername,
              child: Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
