import 'package:flutter/material.dart';

class WordInput extends StatelessWidget
{
  final textController;
  final void Function() pressedHandler;
  WordInput(this.textController, this.pressedHandler);

  @override
  Widget build(BuildContext context)
  {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextFormField(
          controller: this.textController,
          decoration: InputDecoration(
            hintText: 'Bitte gib die Antwort ein',
            labelText: 'Antwort',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: this.pressedHandler,
              icon: const Icon(Icons.clear),
            ),
          ),
          onSaved: (value) => print(value),
          validator: (value) {
            if (value!.isEmpty ||
                RegExp(r'^[a-zA-Z]+$').hasMatch(value!)) {
              return null;
            } else {
              return "Bitte gib ein korrektes Wort ein";
            }
          },
        ));
  }
}


