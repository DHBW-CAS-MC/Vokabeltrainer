import 'package:flutter/material.dart';
import 'confirmation.dart';
import 'wordInput.dart';

class CardsInput extends StatelessWidget {
  final String hinttextDeutsch = 'deutsche Vokabel';
  final String hinttextEnglsich = 'englische Vokabel';
  final String labelText = 'Bitte gib eine neue Vokabel ein';
  final String errorText = 'Bitte gib eine korrekte Vokabel ein!';
  final String german;
  final String english;

  final textControllerDeutschInput;
  final textControllerEnglischInput;

  final void Function() clearCardsInput;
  final void Function() setVokabel;
  final void Function(dynamic, dynamic) createCard;

  CardsInput(
      this.textControllerDeutschInput,
      this.textControllerEnglischInput,
      this.clearCardsInput,
      this.setVokabel,
      this.createCard,
      this.german,
      this.english);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WordInput(this.hinttextDeutsch, this.labelText, this.errorText,
              this.textControllerDeutschInput, this.clearCardsInput),
          WordInput(this.hinttextEnglsich, this.labelText, this.errorText,
              this.textControllerEnglischInput, this.clearCardsInput),
          ConfirmationCard("Speichern", setVokabel, createCard, german, english)
        ],
      ),
    );
  }
}
