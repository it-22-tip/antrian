import 'package:flutter/material.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'Demo',
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}