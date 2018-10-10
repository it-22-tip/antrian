import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';
// import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'selector.dart';
// import 'data.dart';
// import 'cash_model.dart';
// import 'cash_data.dart';
import 'donut_chart.dart';
import 'line_chart.dart';
import 'line_daily.dart';
import 'line_yearly_sales.dart';

class CashScreen extends StatefulWidget {
  _CashScreenState createState() => _CashScreenState();
}

Widget _bottomColumn = Container(
  color: Color(0xFFb74093),
  height: 200.0,
  child: Column(children: <Widget>[
    Text(
      '',
      style: TextStyle(
        height: 1.5,
        fontSize: 30.0,
      ),
    ),
  ]),
);

class _CashScreenState extends State<CashScreen> {
  String _chartType = 'monthly';

  void _setChart(String type) {
    _chartType = type;
    setState(() {});
  }

  _buildMenu(BuildContext context) {
    return <PopupMenuItem>[
      PopupMenuItem(
        child: Text('satu')
      ),
      PopupMenuItem(
        child: Text('satu')
      ),
      PopupMenuItem(
        child: Text('satu')
      ),
      PopupMenuItem(
        child: Text('satu')
      ),
      PopupMenuItem(
        child: Text('satu')
      ),
      PopupMenuItem(
        child: Text('satu')
      ),
      PopupMenuItem(
        child: Text('satu')
      ),
      PopupMenuItem(
        child: Text('satu')
      ),
      PopupMenuItem(
        child: Text('satu')
      ),
    ];
  }

  void _select(dynamic val) {
    print(val);
  }

  List<Widget> _act() {
    return <Widget>[
          PopupMenuButton(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem>[
                PopupMenuItem(
                  value: 1,
                  child: Text('satu')
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('dua')
                ),
              ];
            },
            icon: Icon(
              Icons.android
            ),

          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bell,
            ),
            onPressed: () => {},
          ),
        ];
  }

  Widget _selector() { 
    return Selector(
      data: [
        {
          'title': 'Mingguan',
          'onTap': () => _setChart('weekly')
        },
        {
          'title': 'Bulanan',
          'onTap': () => _setChart('monthly')
        },
        {
          'title': 'Tahunan',
          'onTap': () => _setChart('yearly')
        },
      ],
    );
  }

  Widget _donutChart () {
    return AnimatedCircularChart(
                // ey: _chartKey,
                size: Size(300.0, 300.0),
                initialChartData: <CircularStackEntry>[
                  CircularStackEntry(
                    <CircularSegmentEntry>[
                      CircularSegmentEntry(
                        45.00,
                        Colors.blue[400],
                        rankKey: 'completed',
                      ),
                      CircularSegmentEntry(
                        35.00,
                        Colors.blueGrey[600],
                        rankKey: 'remaining',
                      ),
                      CircularSegmentEntry(
                        20.00,
                        Colors.red[600],
                        rankKey: 'undefined',
                      ),
                    ],
                    rankKey: 'progress',
                  ),
                ],
                chartType: CircularChartType.Radial,
                percentageValues: true,
                holeLabel: _chartType,
                holeRadius: 80.0,
                labelStyle: TextStyle(
                  color: Colors.blueGrey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              );
  }

  Widget _donutChart2 () {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        child: Center(
          child: Container(
            child: Stack(
              children: <Widget>[
                DonutChart.withSampleData(),
              ]
            ),
          )
        ),
      ),
    );
  }

  Widget _linechart() {
    return DateTimeComboLinePointChart.withSampleData();
  }

  Widget _linechart2() {
    return LineYearlySales.withSampleData();
  }

  Widget _linechart3() {
    return LineDaily.withSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey, // Color.fromRGBO(9, 28, 79, 1.0),
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'Kas Bank',
        actions: _act(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _selector(),
          Expanded(
            child: Container(
              color: Colors.orange,
              child: _linechart3(),
            ),
          ),
          _bottomColumn,
        ],
      ),
    );
  }
}
