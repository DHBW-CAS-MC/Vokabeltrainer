import 'dart:ffi';
import 'package:flutter/material.dart';
import 'question.dart';
import 'evaluation.dart';
import 'wordInput.dart';
import 'confirmation.dart';

class vocabularyTrainer extends StatelessWidget
{
  final int questionIndex;
  final List <Map<String, String>> questions;
  final int totalscore;
  final String evaluationText;

  final GlobalKey<FormState> formKey;
  final textController;
  final String hinttext = 'Bitte gib die Antwort ein';
  final String labelText = 'Antwort';
  final String errorText = 'Bitte gib ein korrektes Wort ein';

  final void Function() confirmationHandlerTrainer;
  final void Function() clearWordInput;

  vocabularyTrainer(this.questionIndex,this.questions,this.totalscore, this.evaluationText, this.textController,this.formKey, this.confirmationHandlerTrainer, this.clearWordInput);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Evaluation(this.evaluationText),
          if(this.questionIndex < (this.questions.length -1))
          ...[Question(this.questions[this.questionIndex]['word'] as String)],
          if(this.questionIndex < (this.questions.length -1))
            ...[WordInput(this.hinttext,this.labelText,this.errorText, this.textController,this.clearWordInput)],
          this.questionIndex < (this.questions.length -1)?
          Confirmation("Bestätigung", this.confirmationHandlerTrainer)
              : Confirmation("Zur Auswertung", this.confirmationHandlerTrainer)
        ],
      ),
    );
  }

}