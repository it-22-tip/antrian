/// Example of an ordinal combo chart with two series rendered as bars, and a
/// third rendered as a line.
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MonthlySales extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  MonthlySales(this.seriesList, {this.animate});

  factory MonthlySales.withSampleData() {
    return new MonthlySales(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.OrdinalComboChart(
      seriesList,
      animate: animate,
      // Configure the default renderer as a bar renderer.
      defaultRenderer: new charts.LineRendererConfig(),
      // Custom renderer configuration for the line series. This will be used for
      // any series that does not define a rendererIdKey.
      behaviors: [
        new charts.SeriesLegend(),
        new charts.LinePointHighlighter(
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
      new OrdinalSales('Jan', 5),
      new OrdinalSales('Feb', 25),
      new OrdinalSales('Mar', 100),
      new OrdinalSales('Apr', 75),
      new OrdinalSales('May', 75),
      new OrdinalSales('Jun', 85),
      new OrdinalSales('Jul', 75),
      new OrdinalSales('Ags', 65),
      new OrdinalSales('Sep', 75),
      new OrdinalSales('Okt', 85),
      new OrdinalSales('Nov', 45),
      new OrdinalSales('Des', 35),
    ];

    final mobileSalesData = [
      new OrdinalSales('Jan', 15),
      new OrdinalSales('Feb', 25),
      new OrdinalSales('Mar', 80),
      new OrdinalSales('Apr', 70),
      new OrdinalSales('May', 55),
      new OrdinalSales('Jun', 95),
      new OrdinalSales('Jul', 65),
      new OrdinalSales('Ags', 65),
      new OrdinalSales('Sep', 85),
      new OrdinalSales('Okt', 85),
      new OrdinalSales('Nov', 55),
      new OrdinalSales('Des', 55),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: '2016-2017',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tableSalesData),
      new charts.Series<OrdinalSales, String>(
          id: 'Mobile ',
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
