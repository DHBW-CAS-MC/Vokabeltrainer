import 'package:flutter/material.dart';
import 'confirmation.dart';

class Welcome extends StatelessWidget
{
  String welcomeText = '';
  final void Function() confirmationHandlerStartTrainer;
  Welcome(String userName,this.confirmationHandlerStartTrainer)
  {
    this.welcomeText = 'Hey ' + userName + ', schön, dass du heute Vokabeln lernen möchtest. Bitte wähle einen Modus aus!';

  }

  @override
  //build-Methode
  Widget build(BuildContext context)
  {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.welcomeText,
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
                ),
            Text(""),
            Confirmation("Trainer starten", this.confirmationHandlerStartTrainer)
          ],
    ),
    );
  }
}

