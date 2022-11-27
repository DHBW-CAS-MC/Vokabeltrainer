import 'dart:ffi';
import 'package:flutter/material.dart';
import 'usernameInput.dart';
import 'welcome.dart';

class StartPage extends StatelessWidget {
  final textControllerUsernameInput;
  final GlobalKey<FormState> formKeyUsername;
  final String userName;

  final void Function() clearUsernameInput;
  final void Function() confirmationHandlerUsername;
  final void Function() confirmationHandlerStartTrainer;
  final void Function() confirmationHandlerStartCards;

  StartPage(
      this.userName,
      this.textControllerUsernameInput,
      this.formKeyUsername,
      this.clearUsernameInput,
      this.confirmationHandlerUsername,
      this.confirmationHandlerStartTrainer,
      this.confirmationHandlerStartCards);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKeyUsername,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          this.userName == ""
              ? UsernameInput(this.textControllerUsernameInput,
                  this.clearUsernameInput, this.confirmationHandlerUsername)
              : Welcome(this.userName, this.confirmationHandlerStartTrainer,
                  this.confirmationHandlerStartCards)
        ],
      ),
    );
  }
}
