import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class YearLine extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  YearLine(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory YearLine.withSampleData() {
    return new YearLine(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Configure the default renderer as a line renderer. This will be used
      // for any series that does not define a rendererIdKey.
      //
      // This is the default configuration, but is shown here for  illustration.
      defaultRenderer: new charts.LineRendererConfig(),
      // Custom renderer configuration for the point series.
      customSeriesRenderers: [
        new charts.PointRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'customPoint')
      ],
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      // dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, String>> _createSampleData() {
    final desktopSalesData = [
      new TimeSeriesSales('a', 5),
      new TimeSeriesSales('b', 25),
      new TimeSeriesSales('c', 100),
      new TimeSeriesSales('d', 75),
    ];

    final tableSalesData = [
      new TimeSeriesSales('a', 10),
      new TimeSeriesSales('b', 50),
      new TimeSeriesSales('c', 200),
      new TimeSeriesSales('d', 150),
    ];

    final mobileSalesData = [
      new TimeSeriesSales('a', 10),
      new TimeSeriesSales('b', 50),
      new TimeSeriesSales('c', 200),
      new TimeSeriesSales('d', 150),
    ];

    return [
      new charts.Series<TimeSeriesSales, String>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<TimeSeriesSales, String>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<TimeSeriesSales, String>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (TimeSeriesSales sales, _) => sales.time,
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          data: mobileSalesData)
        // Configure our custom point renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customPoint'),
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final String time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
