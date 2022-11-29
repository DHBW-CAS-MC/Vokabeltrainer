import 'dart:ffi';
import 'package:flutter/material.dart';
import 'vocabularyTrainer.dart';
import 'result.dart';

class MainPage extends StatelessWidget {
  final int questionIndex;
  final int totalscore;
  final String evaluationText;
  final String userName;
  final bool answerCorrect;
  final List questions;
  var appColor;

  final GlobalKey<FormState> formKeyWord;
  final textController;

  final void Function() confirmationHandlerTrainer;
  final void Function() clearWordInput;
  final void Function() resetHandler;

  MainPage(
      this.appColor,
      this.questionIndex,
      this.questions,
      this.totalscore,
      this.evaluationText,
      this.userName,
      this.answerCorrect,
      this.formKeyWord,
      this.textController,
      this.confirmationHandlerTrainer,
      this.clearWordInput,
      this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKeyWord,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          this.questionIndex < this.questions.length
              ? vocabularyTrainer(
                  this.appColor,
                  this.questionIndex,
                  this.questions,
                  this.totalscore,
                  this.evaluationText,
                  this.answerCorrect,
                  this.textController,
                  this.formKeyWord,
                  this.confirmationHandlerTrainer,
                  this.clearWordInput)
              : Result(this.appColor, this.totalscore, this.userName,
                  this.questions, this.resetHandler)
        ],
      ),
    );
  }
}
