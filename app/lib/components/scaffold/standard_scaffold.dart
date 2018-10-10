import 'package:flutter/material.dart';
import '../app_bar/primary_app_bar.dart';

class CustomScaffold extends Scaffold {
  final Key key;
  final PreferredSizeWidget appBar;

  CustomScaffold({this.key, this.appBar}) : super(key: key);
  factory CustomScaffold.versionOne() {
    return CustomScaffold(
      appBar: PrimaryAppBar(),
    );
  }
}
