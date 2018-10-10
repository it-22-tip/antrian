import 'package:flutter/material.dart';
import 'package:xfocus_mobile/components/chart/line-chart.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      elevation: 0.0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          MyLineChart.withSampleData(),
        ],
      ),
    );
  }
}
