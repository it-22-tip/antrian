import 'package:flutter/material.dart';

class InfoBoxItem extends StatefulWidget {
  InfoBoxItem({
    Key key,
    this.title,
    this.percentage = 0.0,
    this.ammount = 0.0,
    this.color = Colors.white,
    this.isUp = true,
  }) : super(key: key);

  final String title;
  final double percentage;
  final double ammount;
  final Color color;
  final bool isUp;
  @override
  _InfoBoxItemState createState() => _InfoBoxItemState();
}

class _InfoBoxItemState extends State<InfoBoxItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: widget.color.withOpacity(0.5),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(widget.title.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text(widget.percentage.toString() + ' %',
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
              Icon(
                widget.isUp ? Icons.trending_up : Icons.trending_down,
                color: widget.isUp ? Colors.green : Colors.red,
              ),
            ]),
      ),
    );
  }
}
