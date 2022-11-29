import 'package:flutter/material.dart';
import 'confirmation.dart';

class Welcome extends StatelessWidget {
  String welcomeText = '';
  final void Function() confirmationHandlerStartTrainer;
  final void Function() confirmationHandlerStartCards;

  Welcome(String userName, this.confirmationHandlerStartTrainer, this.confirmationHandlerStartCards) {
    this.welcomeText = 'Hey ' +
        userName +
        ', schön, dass du heute Vokabeln lernen möchtest. Bitte wähle einen Modus aus!';
  }

  @override
  //build-Methode
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: <Widget>[
              Text(
                this.welcomeText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontStyle: FontStyle.italic,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.indigo,
                ),
              ),
              // Solid text as fill.
              Text(
                this.welcomeText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(""),
          Confirmation("Trainer starten", this.confirmationHandlerStartTrainer),
          Text(""),
          Confirmation("Karteikarten bearbeiten", this.confirmationHandlerStartCards)
        ],
      ),
    );
  }
}
