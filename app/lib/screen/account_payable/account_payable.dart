import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class AccountPayableScreen extends StatefulWidget {
  _AccountPayableScreenState createState() => _AccountPayableScreenState();
}

class _AccountPayableScreenState extends State<AccountPayableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'Hutang',
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
          Text('Account Payable Screen'),
        ],
      ),
    );
  }
}
