import 'package:flutter/material.dart';
import 'info_box_item.dart';

class InfoBox extends StatefulWidget {
  InfoBoxState createState() => InfoBoxState();
}

class InfoBoxState extends State<InfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.5),
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.vertical,
        children: <Widget>[
          InfoBoxItem(
            title: 'Kas',
            percentage: 100.0,
            ammount: 100000.0,
            color: Colors.purple,
            isUp: false,
          ),
          InfoBoxItem(
            title: 'Sales',
            percentage: 100.0,
            ammount: 100000.0,
            color: Colors.blue,
          ),
          InfoBoxItem(
            title: 'Inventory',
            percentage: 100.0,
            ammount: 100000.0,
            color: Colors.pink,
          ),
          InfoBoxItem(
            title: 'A/R',
            percentage: 100.0,
            ammount: 100000.0,
            color: Colors.red,
            isUp: false,
          ),
          InfoBoxItem(
            title: 'A/P',
            percentage: 100.0,
            ammount: 100000.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
