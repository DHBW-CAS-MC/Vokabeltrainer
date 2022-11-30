import 'package:flutter/material.dart';

class WordInput extends StatelessWidget {
  final String hinttext;
  final String labelText;
  final String errorText;
  final textController;
  var appColor;
  final void Function() pressedHandler;
  WordInput(this.appColor, this.hinttext, this.labelText, this.errorText,
      this.textController, this.pressedHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextFormField(
          controller: this.textController,
          cursorColor: this.appColor,
          style: TextStyle(color: this.appColor),
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
            if (RegExp(r'^[a-zA-ZäÄöÖüÜß]+$').hasMatch(value!)) {
              return null;
            } else {
              return this.errorText;
            }
          },
        ));
  }
}
