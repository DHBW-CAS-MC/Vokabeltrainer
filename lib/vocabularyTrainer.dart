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

  final void Function() confirmationHandler;
  final void Function() pressedHandler;

  vocabularyTrainer(this.questionIndex,this.questions,this.totalscore, this.evaluationText, this.textController,this.formKey, this.confirmationHandler, this.pressedHandler);

  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: this.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //display text
          Evaluation(this.evaluationText),
          Question(this.questions[this.questionIndex]['word'] as String),
          this.questionIndex < (this.questions.length -1)?
          WordInput(this.textController,this.pressedHandler)
          :Text(""),
          this.questionIndex < (this.questions.length -1)?
          Confirmation("Bestätigung", this.confirmationHandler)
              : Confirmation("Zur Auswertung", this.confirmationHandler)
        ],
      ),
    );
  }

}