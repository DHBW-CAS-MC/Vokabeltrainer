import 'package:flutter/material.dart';
import 'wordInput.dart';

class UsernameInput extends StatefulWidget {
  int sex;
  final textControllerUsernameInput;

  final void Function() clearUsernameInput;
  final void Function() confirmationHandlerUsername;
  final void Function(int value) setSex;

  UsernameInput({
    Key? key,
    required this.sex,
    this.textControllerUsernameInput,
    required this.clearUsernameInput,
    required this.confirmationHandlerUsername,
    required this.setSex,
  }) : super(key: key);

  @override
  UserInputState createState() => UserInputState();
}

class UserInputState extends State<UsernameInput> {
  final String hinttext = 'Dein Name';
  final String labelText = 'Wie heißt du?';
  final String errorText = 'Bitte gib einen korrekten Namen ein!';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WordInput(hinttext, labelText, errorText,
              widget.textControllerUsernameInput, widget.clearUsernameInput),
          Text(""),
          Radio(
              value: 1,
              groupValue: widget.sex,
              onChanged: (value) => widget.setSex(value as int)),
          SizedBox(width: 10.0),
          Text("Junge"),
          Radio(
              value: 2,
              groupValue: widget.sex,
              onChanged: (value) => widget.setSex(value as int)
          ),
          SizedBox(width: 10.0),
          Text("Mädchen"),
          Text(""),
          FloatingActionButton(
              onPressed: widget.confirmationHandlerUsername,
              child: Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
