import 'package:flutter/material.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class FirebaseauthScreen extends StatefulWidget {
  _FirebaseauthScreenState createState() => _FirebaseauthScreenState();
}

class _FirebaseauthScreenState extends State<FirebaseauthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(primaryAppBarTitle: 'Firebase Auth'),
      body: Container(
        child: Text('Firebase Auth'),
      ),
    );
  }
}
