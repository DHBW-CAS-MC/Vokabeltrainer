import 'dart:ffi';
import 'package:flutter/material.dart';
import 'usernameInput.dart';
import 'welcome.dart';

class StartPage extends StatelessWidget {
  final textControllerUsernameInput;
  final GlobalKey<FormState> formKeyUsername;
  final String userName;
  final int sex;
  var appColor;

  final void Function() clearUsernameInput;
  final void Function() confirmationHandlerUsername;
  final void Function() confirmationHandlerStartTrainer;
  final void Function(int value) setSex;

  StartPage(
      this.sex,
      this.appColor,
      this.userName,
      this.textControllerUsernameInput,
      this.formKeyUsername,
      this.clearUsernameInput,
      this.confirmationHandlerUsername,
      this.confirmationHandlerStartTrainer,
      this.setSex);

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
                  appColor: this.appColor,
                  textControllerUsernameInput: this.textControllerUsernameInput,
                  clearUsernameInput: this.clearUsernameInput,
                  confirmationHandlerUsername: this.confirmationHandlerUsername,
                  setSex: this.setSex,
                )
              : Welcome(this.userName,this.appColor, this.confirmationHandlerStartTrainer)
        ],
      ),
    );
  }
}
