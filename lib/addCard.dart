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

  final void Function() clearCardsInput;
  final void Function() setVokabel;
  final void Function() confirmationHandlerStartTrainer;
  final void Function() confirmationHandlerStartCards;
  final void Function(dynamic, dynamic) createCard;

  AddCard(
      this.german,
      this.english,
      this.textControllerCardsGerman,
      this.textControllerCardsEnglish,
      this.formKeyCards,
      this.clearCardsInput,
      this.setVokabel,
      this.confirmationHandlerStartTrainer,
      this.confirmationHandlerStartCards,
      this.createCard);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKeyCards,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          german == ""
              ? CardsInput(
                  this.textControllerCardsGerman,
                  this.textControllerCardsEnglish,
                  this.clearCardsInput,
                  this.setVokabel,
                  this.createCard,
                  this.german,
                  this.english)
              : Welcome(this.german, this.confirmationHandlerStartTrainer,
                  this.confirmationHandlerStartCards)
        ],
      ),
    );
  }
}
