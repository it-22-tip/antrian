import 'package:flutter/material.dart';

class DashboardCard extends StatefulWidget {
  final Widget widget;
  DashboardCard(this.widget);
  DashboardCardState createState() => DashboardCardState();
}

class DashboardCardState extends State<DashboardCard> {
  Choice _selectedChoice = choices[0];
  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      elevation: 1.0,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.orange,
              child: ListTile(
                dense: true,
                title: const Text('Kas'),
                trailing: PopupMenuButton<Choice>(
                    onSelected: _select,
                    itemBuilder: (BuildContext context) {
                      return choices.map((Choice choice) {
                        return PopupMenuItem<Choice>(
                          value: choice,
                          child: Text(choice.title),
                        );
                      }).toList();
                    }),
              ),
            ),
            Icon(_selectedChoice.icon),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
              child: widget.widget,
            )
          ]),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Dalam Jutaan', icon: Icons.directions_car),
  const Choice(title: 'Dalam Ribuan', icon: Icons.add_circle),
];
