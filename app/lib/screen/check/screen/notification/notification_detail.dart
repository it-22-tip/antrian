import 'package:flutter/material.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class NotificationdetailScreen extends StatefulWidget {
  final String payload;
  NotificationdetailScreen(this.payload);
  @override
  State<StatefulWidget> createState() => _NotificationdetailScreenState();
}

class _NotificationdetailScreenState extends State<NotificationdetailScreen> {
  // String _payload;
  @override
  void initState() {
    super.initState();
    // _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(primaryAppBarTitle: 'Notification'),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
