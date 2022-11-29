import 'package:flutter/material.dart';

class WordInput extends StatelessWidget {
  final String hinttext;
  final String labelText;
  final String errorText;
  final textController;
  final void Function() pressedHandler;
  WordInput(this.hinttext, this.labelText, this.errorText, this.textController,
      this.pressedHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextFormField(
          controller: this.textController,
          cursorColor:Colors.blue,
          style: TextStyle(color: Colors.blue),
          decoration: InputDecoration(
            hintText: this.hinttext,
            labelText: this.labelText,
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: this.pressedHandler,
              icon: const Icon(Icons.clear),
            ),
          ),
          validator: (value) {
            if (RegExp(r'^[a-zA-Z]+$').hasMatch(value!)) {
              return null;
            } else {
              return this.errorText;
            }
          },
        ));
  }
}
