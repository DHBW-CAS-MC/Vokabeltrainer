import 'dart:ffi';
import 'package:flutter/material.dart';
import 'question.dart';
import 'evaluation.dart';
import 'wordInput.dart';
import 'confirmation.dart';

class vocabularyTrainer extends StatelessWidget {
  var appColor;
  final int questionIndex;
  final List questions;
  final String evaluationText;
  final bool answerCorrect;

  final GlobalKey<FormState> formKey;
  final textController;
  final String hinttext = 'Bitte gib die Antwort ein';
  final String labelText = 'Antwort';
  final String errorText = 'Bitte gib ein korrektes Wort ein';

  final void Function() confirmationHandlerTrainer;
  final void Function() clearWordInput;
  final void Function() confirmationStartCards;

  vocabularyTrainer(
      this.appColor,
      this.questionIndex,
      this.questions,
      this.evaluationText,
      this.answerCorrect,
      this.textController,
      this.formKey,
      this.confirmationHandlerTrainer,
      this.clearWordInput,
      this.confirmationStartCards);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Evaluation(this.evaluationText, this.answerCorrect),
          if (this.questions[0]['question'] ==
              'Bitte neue Vokabel hinzufügen') ...[
            Text('Bitte trage zuerst diene Vokabeln in den Karteikarten ein'),
            Confirmation("Zu den Karteikarten", this.appColor,
                this.confirmationStartCards),
          ],
          if ((this.questionIndex <= (this.questions.length - 1)) &&
              this.questions[0]['question'] !=
                  'Bitte neue Vokabel hinzufügen') ...[
            Question(this.questions[this.questionIndex]['question'] as String)
          ],
          if ((this.questionIndex <= (this.questions.length - 1)) &&
              this.questions[0]['question'] !=
                  'Bitte neue Vokabel hinzufügen') ...[
            WordInput(this.appColor, this.hinttext, this.labelText,
                this.errorText, this.textController, this.clearWordInput)
          ],
          if (this.questions[0]['question'] !=
              'Bitte neue Vokabel hinzufügen') ...[
            this.questionIndex < (this.questions.length - 1)
                ? Confirmation("Bestätigung", this.appColor,
                    this.confirmationHandlerTrainer)
                : Confirmation("Zur Auswertung", this.appColor,
                    this.confirmationHandlerTrainer)
          ]
        ],
      ),
    );
  }
}
