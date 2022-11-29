import 'dart:ffi';
import 'package:flutter/material.dart';
import 'usernameInput.dart';
import 'welcome.dart';

class StartPage extends StatelessWidget {
  final textControllerUsernameInput;
  final GlobalKey<FormState> formKeyUsername;
  final String userName;
  final int sex;

  final void Function() clearUsernameInput;
  final void Function() confirmationHandlerUsername;
  final void Function() confirmationHandlerStartTrainer;
  final void Function(int value) setSex;
  final void Function() confirmationHandlerStartCards;

  StartPage(
      this.sex,
      this.userName,
      this.textControllerUsernameInput,
      this.formKeyUsername,
      this.clearUsernameInput,
      this.confirmationHandlerUsername,
      this.confirmationHandlerStartTrainer,
      this.setSex,
      this.confirmationHandlerStartCards);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKeyUsername,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          this.userName == ""
              ? UsernameInput(
                  sex: this.sex,
                  textControllerUsernameInput: this.textControllerUsernameInput,
                  clearUsernameInput: this.clearUsernameInput,
                  confirmationHandlerUsername: this.confirmationHandlerUsername,
                  setSex: this.setSex,
                )
              : Welcome(this.userName, this.confirmationHandlerStartTrainer, this.confirmationHandlerStartCards)
        ],
      ),
    );
  }
}
