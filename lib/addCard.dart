import 'dart:developer';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'cardInput.dart';
import 'welcome.dart';

class AddCard extends StatelessWidget {
  final textControllerCardsGerman;
  final textControllerCardsEnglish;
  final GlobalKey<FormState> formKeyCards;
  final String german;
  final String english;
  var appColor;

  final void Function() clearCardsInputGerman;
  final void Function() clearCardsInputEnglish;
  final void Function() setVokabel;
  final void Function() confirmationHandlerStartTrainer;
  final void Function() confirmationHandlerStartCards;

  AddCard(
      this.german,
      this.english,
      this.textControllerCardsGerman,
      this.textControllerCardsEnglish,
      this.formKeyCards,
      this.clearCardsInputGerman,
      this.clearCardsInputEnglish,
      this.setVokabel,
      this.confirmationHandlerStartTrainer,
      this.confirmationHandlerStartCards,
      this.appColor);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKeyCards,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardsInput(
              this.textControllerCardsGerman,
              this.textControllerCardsEnglish,
              this.clearCardsInputGerman,
              this.clearCardsInputEnglish,
              this.setVokabel,
              this.german,
              this.english,
              this.appColor)
        ],
      ),
    );
  }
}
