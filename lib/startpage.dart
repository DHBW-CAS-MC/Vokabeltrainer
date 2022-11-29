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

  StartPage(
      this.sex,
      this.userName,
      this.textControllerUsernameInput,
      this.formKeyUsername,
      this.clearUsernameInput,
      this.confirmationHandlerUsername,
      this.confirmationHandlerStartTrainer);

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
                  confirmationHandlerUsername: this.confirmationHandlerUsername)
              : Welcome(this.userName, this.confirmationHandlerStartTrainer)
        ],
      ),
    );
  }
}
