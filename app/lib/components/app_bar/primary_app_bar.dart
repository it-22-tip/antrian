import 'package:flutter/material.dart';

class PrimaryAppBar extends AppBar {
  final List<Widget> actions;
  final bool primaryAppBarAutomaticallyImplyLeading;
  final String primaryAppBarTitle;
  final Widget leading;
  final Color backgroundColor;
  PrimaryAppBar({
    Key key,
    this.actions,
    this.primaryAppBarTitle,
    this.leading,
    this.backgroundColor,
    this.primaryAppBarAutomaticallyImplyLeading
  }) : super(
          key: key,
          automaticallyImplyLeading: primaryAppBarAutomaticallyImplyLeading != null ? primaryAppBarAutomaticallyImplyLeading : true,
          leading: leading,
          actions: actions,
          elevation: 0.0,
          title: Text(
            primaryAppBarTitle != null ? primaryAppBarTitle : '',
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          backgroundColor: Colors.orange,
          centerTitle: true,
        );
}
