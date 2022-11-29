import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:lernapp/flashcard.dart';
import 'package:lernapp/flashcardView.dart';
import 'package:lernapp/main.dart';
import 'vocabularyTrainer.dart';
import 'result.dart';
import 'package:flip_card/flip_card.dart';
import 'database.dart';

class Cards extends StatelessWidget {
  var appColor;
  int cardIndex;
  List input;

  final GlobalKey<FormState> formKeyCards;
  final textControllerCards;

  final void Function() showNextCard;
  final void Function() showPrevCard;
  final void Function() confirmationStartAddCard;
  final void Function() clearCardsInput;
  final void Function() resetHandler;
  final void Function(dynamic) deleteCard;
  final void Function() goBackfromCardMenu;

  Cards(
      this.appColor,
      this.cardIndex,
      this.input,
      this.formKeyCards,
      this.textControllerCards,
      this.showNextCard,
      this.showPrevCard,
      this.confirmationStartAddCard,
      this.clearCardsInput,
      this.resetHandler,
      this.deleteCard,
      this.goBackfromCardMenu);

  Flashcard cardInput(index) {
    String german = input[index]["question"];
    String english = input[index]["answer"];
    return Flashcard(german: german, english: english);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            height: 150,
            child: FlipCard(
                front: FlashcardView(
                  appColor: this.appColor,
                  text: cardInput(cardIndex).german,
                ),
                back: FlashcardView(
                  appColor: this.appColor,
                  text: cardInput(cardIndex).english,
                )),
          ),
          Text(""),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                  backgroundColor: appColor,
                  onPressed: showPrevCard,
                  child: Icon(Icons.chevron_left, color: Colors.white)),
              FloatingActionButton(
                  backgroundColor: appColor,
                  onPressed: confirmationStartAddCard,
                  child: Icon(Icons.add)),
              FloatingActionButton(
                  backgroundColor: appColor,
                  onPressed: (() => deleteCard(cardIndex)),
                  child: Icon(Icons.delete_forever, color: Colors.white)),
              FloatingActionButton(
                  backgroundColor: appColor,
                  onPressed: showNextCard,
                  child: Icon(Icons.chevron_right, color: Colors.white)),
            ],
          ),
          Text(""),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  backgroundColor: appColor,
                  onPressed: this.goBackfromCardMenu,
                  child: Icon(Icons.arrow_back, color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }
}
