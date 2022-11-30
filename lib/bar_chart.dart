import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarModel {
  final String text;
  final int value;
  BarModel(this.text, this.value);
}

class BarChart extends StatelessWidget {
  BarChart({super.key});

  static List<charts.Series<BarModel, String>> _createSampleData() {
    final data = [
      new BarModel('2014', 5),
      new BarModel('2015', 25),
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bar Chart"),
        ),
        body: Container(
          height: 300,
          child: charts.BarChart(
            _createSampleData(),
            animate: false,
          ),
        ),
      ),
    );
  }
}