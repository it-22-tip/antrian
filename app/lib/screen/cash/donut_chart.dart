import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final onSelected;

  DonutChart(this.seriesList, {this.animate, this.onSelected});

  factory DonutChart.withSampleData() {
    return new DonutChart(
      _createSampleData(),
      animate: false,
    );
  }

  /* factory DonutChart.fromData() {
    return new DonutChart(
      _createSampleData(),
      animate: false,
    );
  } */

  @override
  State<StatefulWidget> createState() => new _DonutChartState();

  static List<charts.Series<LinearSales, dynamic>> _createSampleData() {
    return sampleData();
  }
}

class _DonutChartState extends State<DonutChart> {
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    if (selectedDatum.isNotEmpty) {
      debugPrint(selectedDatum.first.datum.year.toString());
      if (widget.onSelected != null) {
        return widget.onSelected(selectedDatum.first.datum);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var chart = charts.PieChart(
      widget.seriesList,
      animate: widget.animate,
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          listener: _onSelectionChanged,
        ),
      ],
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: 50,
        arcRendererDecorators: [
          charts.ArcLabelDecorator(),
        ],
      ),
    );
    return chart;
  }
}

List<charts.Series<LinearSales, dynamic>> sampleData() {
  final data = [
    new LinearSales('Kas', 10000000),
    new LinearSales('Kas Kecil', 500000),
  ];

  return [
    charts.Series<LinearSales, dynamic>(
      id: 'Sales',
      domainFn: (LinearSales sales, _) => sales.year,
      measureFn: (LinearSales sales, _) => sales.sales,
      data: data,
    )
  ];
}

class LinearSales {
  final String year;
  final int sales;

  LinearSales(this.year, this.sales);
}
