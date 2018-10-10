import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      <PageViewModel>[
        PageViewModel(
          pageColor: const Color(0xFF607D8B),
          iconImageAssetPath: 'assets/png/logo.png',
          iconColor: null,
          bubbleBackgroundColor: null,
          body: Text(
            'XFocus ERP',
          ),
          title: Text('XFocus'),
          mainImage: Image.asset(
            'assets/png/logo.png',
            height: 285.0,
            width: 285.0,
            alignment: Alignment.center,
          ),
          textStyle: TextStyle(color: Colors.white),
        ),
        PageViewModel(
          pageColor: const Color(0xFF607D8B),
          iconImageAssetPath: 'assets/png/logo.png',
          iconColor: null,
          bubbleBackgroundColor: null,
          body: Text(
            'XFocus ERP 2',
          ),
          title: Text('XFocus 2'),
          mainImage: Image.asset(
            'assets/png/logo.png',
            height: 285.0,
            width: 285.0,
            alignment: Alignment.center,
          ),
          textStyle: TextStyle(color: Colors.white),
        ),
        PageViewModel(
          pageColor: const Color(0xFF607D8B),
          iconImageAssetPath: 'assets/png/logo.png',
          iconColor: null,
          bubbleBackgroundColor: null,
          body: Text(
            'XFocus ERP 3',
          ),
          title: Text('XFocus 3'),
          mainImage: Image.asset(
            'assets/png/logo.png',
            height: 285.0,
            width: 285.0,
            alignment: Alignment.center,
          ),
          textStyle: TextStyle(color: Colors.white),
        ),
      ],
      onTapDoneButton: () => Navigator.pop(context),
      doneText: Text('Selesai'),
      showSkipButton: false,
      // onTapSkipButton: () => Navigator.pop(context),
    );
  }
}
