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

  Cards(
      this.cardIndex,
      this.input,
      this.formKeyCards,
      this.textControllerCards,
      this.showNextCard,
      this.showPrevCard,
      this.confirmationStartAddCard,
      this.clearCardsInput,
      this.resetHandler,
      this.deleteCard);

  Flashcard cardInput(index) {
    String german = input[index]["question"];
    String english = input[index]["answer"];
    return Flashcard(german: german, english: english);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    front: FlashcardView(
                      text: cardInput(cardIndex).german,
                    ),
                    back: FlashcardView(
                      text: cardInput(cardIndex).english,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPrevCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev'),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: confirmationStartAddCard,
                    icon: Icon(Icons.plus_one_rounded),
                    label: Text('neue Karteikarte'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: (() => deleteCard(cardIndex)),
                    icon: Icon(Icons.delete_forever),
                    label: Text('Löschen'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
