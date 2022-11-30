import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarModel {
  final String text;
  final int value;

  BarModel(this.text, this.value);
}

class BarChart extends StatelessWidget {

  String answersCorrectText = "Richtige Antworten";
  String answerWrongText = "Falsche Antworten";
  final int numerCorrectAnswers;
  final int numerWrongAnswers;

  BarChart(this.numerCorrectAnswers, this.numerWrongAnswers);

  List<charts.Series<BarModel, String>> _createSampleData() {
    final data = [
      BarModel(this.answersCorrectText, this.numerCorrectAnswers),
      BarModel(this.answerWrongText, this.numerWrongAnswers),
    ];

    return [
      charts.Series<BarModel, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (BarModel barModel, _) => barModel.text,
        measureFn: (BarModel barModel, _) => barModel.value,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: charts.BarChart(
        _createSampleData(),
        animate: false,
      ),
    );
  }
}
