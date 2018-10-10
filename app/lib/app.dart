import 'package:flutter/material.dart';
import 'package:xfocus_mobile/config/app_routes.dart';

class App extends StatelessWidget {
  final String title = 'XFocus Mobile';
  final themeData = ThemeData(
    primaryColor: Colors.orange,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: themeData,
      initialRoute: '/',
      routes: appRoutes,
      debugShowCheckedModeBanner:
          false, // package:xfocus_mobile/config/app_routes.dart
    );
  }
}
