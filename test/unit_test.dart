// @dart=2.9
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lernapp/cards.dart';

List _contentDb = [
  {'question': "Test de", 'answer': "test en"}
];

void main() {
  test('Test new Card', () {
    var appColor = Colors.green;
    int cardIndex = 0;
    List input = _contentDb;
    int language = 1;

    final GlobalKey<FormState> formKeyCards = GlobalKey<FormState>();
    final textControllerCards = TextEditingController();

    void showNextCard() {}
    void showPrevCard() {}
    void confirmationStartAddCard() {}
    void clearCardsInput() {}
    void resetHandler() {}
    void deleteCard(dynamic) {}
    void goBackfromCardMenu() {}

    Cards card = Cards(
        language,
        appColor,
        cardIndex,
        input,
        formKeyCards,
        textControllerCards,
        showNextCard,
        showPrevCard,
        confirmationStartAddCard,
        clearCardsInput,
        resetHandler,
        deleteCard,
        goBackfromCardMenu);

    String german = card.cardInput(0).german;
    String english = card.cardInput(0).english;

    expect(german, "Test de");
    expect(english, "test en");
  });
}
