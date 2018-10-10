import 'package:flutter/material.dart';

class SelectorButton extends StatelessWidget {
  final String title;
  final onTap;
  final active;

  SelectorButton({
    Key key,
    this.title,
    this.onTap,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Container(
          child: Material(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            color: active ? Colors.orange : Colors.transparent,
            child: InkWell(
              onTap: () {
                onTap();
              },
              child: Container(
                height: 30.0,
                child: Center(
                    child: Text(
                      '$title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Selector extends StatefulWidget {
  final List data;
  Selector({ Key key, this.data }) : super();

  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {

  // List<Widget> _widgetChildren;
  dynamic _active;

  void _setActive(title, onTap) {
    onTap();
    setState(() {
      _active = title;
    });
    print(_active);
  }

  @override
  initState() {
    _active = widget.data.first['title'];
    super.initState();
  }

  _createButton() {
    var widgetChildren = widget.data.map(    
      (button) {
        var title = button['title'];
        var onTap = button['onTap'];
        return SelectorButton(
          title: title,
          onTap: () => _setActive(title, onTap,),
          active: _active == title
        );
      }
    ).toList();
    return widgetChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            child: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5),
                border: Border.all(
                  width: 0.0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _createButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}