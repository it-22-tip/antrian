import 'package:flutter/material.dart';

class DashboardIcon extends StatelessWidget {
  final String title;
  final onTap;
  final IconData icon;
  final bool hasInfo;

  DashboardIcon({
    @required this.title,
    this.icon,
    this.onTap,
    this.hasInfo = false,
  }) : super();
  
  Widget _icon() {
    return SizedBox(
      height: 70.0,
      width: 70.0,
      child: Icon(
        (this.icon == null) ? Icons.access_alarms : this.icon,
        color: Colors.black.withOpacity(0.3),
        size: 70.0,
      ),
    );
  }

  _info() {
return Positioned(
  right: 0.0,
  top: 0.0,
  child: Container(
    height: 20.0,
    width: 20.0,
    child: DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.none,
          width: 0.0,
        ),
        color: Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
    ),
  ),
);  
  }

List<Widget> _wl() {
  List ret = <Widget>[
    _icon(),                    
  ];
  if(hasInfo != null && hasInfo == true) ret.add(_info());
  return ret;
}

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Container (
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: this.onTap,
                child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Stack(
                      overflow: Overflow.clip,
                      children: _wl(),
                    ),
                  ),
                ),
                Text(
                  this.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // package: ,
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      color: Colors.orange,
                  ),
                ),
              ],
            ),
              ),
            ),
          ),
        ),
        ),
    );
  }
}
