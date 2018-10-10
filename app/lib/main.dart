import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xfocus_mobile/app.dart';

final application = App();

void main() {
  runZoned(() {
    runApp(application);
  }, onError: (dynamic error, dynamic stack) {
    print(error);
    print(stack);
  });
}
