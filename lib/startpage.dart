import 'dart:ffi';
import 'package:flutter/material.dart';
import 'usernameInput.dart';
import 'welcome.dart';

class StartPage extends StatelessWidget {
  final textControllerUsernameInput;
  final GlobalKey<FormState> formKeyUsername;
  final String userName;
  final int sex;
  final int emoji;
  var appColor;

  final void Function() clearUsernameInput;
  final void Function() confirmationHandlerUsername;
  final void Function() confirmationHandlerStartTrainer;
  final void Function(int value) setSex;
  final void Function() confirmationHandlerStartCards;
  final void Function(dynamic) setEmoji;

  StartPage(
      this.emoji,
      this.sex,
      this.appColor,
      this.userName,
      this.textControllerUsernameInput,
      this.formKeyUsername,
      this.clearUsernameInput,
      this.confirmationHandlerUsername,
      this.confirmationHandlerStartTrainer,
      this.setSex,
      this.confirmationHandlerStartCards,
      this.setEmoji);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKeyUsername,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Wähle dein Emoji'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => setEmoji(0), child: Text('🦍')),
              ElevatedButton(onPressed: () => setEmoji(0), child: Text('🦍')),
              ElevatedButton(onPressed: () => setEmoji(0), child: Text('🦍')),
              ElevatedButton(onPressed: () => setEmoji(0), child: Text('🦍')),
            ],
          ),
          this.userName == ""
              ? UsernameInput(
                  sex: this.sex,
                  appColor: this.appColor,
                  textControllerUsernameInput: this.textControllerUsernameInput,
                  clearUsernameInput: this.clearUsernameInput,
                  confirmationHandlerUsername: this.confirmationHandlerUsername,
                  setSex: this.setSex,
                )
              : Welcome(
                  this.userName,
                  this.appColor,
                  this.confirmationHandlerStartTrainer,
                  this.confirmationHandlerStartCards)
        ],
      ),
    );
  }
}
