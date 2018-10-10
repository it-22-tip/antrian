import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class AccountReceivableScreen extends StatefulWidget {
  _AccountReceivableScreenState createState() =>
      _AccountReceivableScreenState();
}

class _AccountReceivableScreenState extends State<AccountReceivableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'Piutang',
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.bell,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Text('Account Receivable Screen'),
        ],
      ),
    );
  }
}
