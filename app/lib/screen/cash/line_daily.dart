/// Example of an ordinal combo chart with two series rendered as bars, and a
/// third rendered as a line.
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineDaily extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  LineDaily(this.seriesList, {this.animate});

  factory LineDaily.withSampleData() {
    return LineDaily(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.OrdinalComboChart(
      seriesList,
      animate: animate,
      // Configure the default renderer as a bar renderer.
      defaultRenderer: charts.LineRendererConfig(),
      // Custom renderer configuration for the line series. This will be used for
      // any series that does not define a rendererIdKey.
      behaviors: [
        charts.SeriesLegend(),
        charts.LinePointHighlighter(
            showHorizontalFollowLine:
                charts.LinePointHighlighterFollowLineType.none,
            showVerticalFollowLine:
                charts.LinePointHighlighterFollowLineType.nearest),
      ],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final tableSalesData = [
      OrdinalSales('1', 5),
      OrdinalSales('2', 25),
      OrdinalSales('3', 100),
      OrdinalSales('4', 75),
      OrdinalSales('5', 75),
      OrdinalSales('6', 85),
      OrdinalSales('7', 75),
      OrdinalSales('8', 65),
      OrdinalSales('9', 75),
      OrdinalSales('10', 85),
      OrdinalSales('11', 45),
      OrdinalSales('12', 35),
      OrdinalSales('13', 100),
      OrdinalSales('14', 75),
      OrdinalSales('15', 75),
      OrdinalSales('16', 85),
      OrdinalSales('17', 75),
      OrdinalSales('18', 65),
      OrdinalSales('19', 75),
      OrdinalSales('20', 85),
      OrdinalSales('21', 45),
      OrdinalSales('22', 35),
    ];

    final mobileSalesData = [
      OrdinalSales('1', 15),
      OrdinalSales('2', 25),
      OrdinalSales('3', 80),
      OrdinalSales('4', 70),
      OrdinalSales('5', -5),
      OrdinalSales('6', 95),
      OrdinalSales('7', 65),
      OrdinalSales('8', 65),
      OrdinalSales('9', 85),
      OrdinalSales('10', 85),
      OrdinalSales('11', 55),
      OrdinalSales('12', 55),
      OrdinalSales('13', 80),
      OrdinalSales('14', 70),
      OrdinalSales('15', -5),
      OrdinalSales('16', 95),
      OrdinalSales('17', 65),
      OrdinalSales('18', 65),
      OrdinalSales('19', 85),
      OrdinalSales('20', 85),
      OrdinalSales('21', 55),
      OrdinalSales('22', 55),
    ];

    return [
      charts.Series<OrdinalSales, String>(
          id: '2016-2017',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tableSalesData),
      charts.Series<OrdinalSales, String>(
          id: '2017-2018 ',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: mobileSalesData),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
