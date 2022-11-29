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
  final int language;
  bool changeOrder;
  var appColor;

  final GlobalKey<FormState> formKeyWord;
  final textController;

  final void Function() confirmationHandlerTrainer;
  final void Function() clearWordInput;
  final void Function() resetHandler;
  final void Function() confirmationStartCards;
  final void Function(bool) setChangeOrder;

  MainPage(
      this.language,
      this.changeOrder,
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
      this.resetHandler,
      this.confirmationStartCards,
      this.setChangeOrder);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKeyWord,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          this.questionIndex < this.questions.length
              ? vocabularyTrainer(
                  this.language,
                  this.changeOrder,
                  this.appColor,
                  this.questionIndex,
                  this.questions,
                  this.evaluationText,
                  this.answerCorrect,
                  this.textController,
                  this.formKeyWord,
                  this.confirmationHandlerTrainer,
                  this.clearWordInput,
                  this.confirmationStartCards,
                  this.setChangeOrder)
              : Result(this.appColor, this.totalscore, this.userName,
                  this.questions, this.resetHandler)
        ],
      ),
    );
  }
}
