import 'package:flutter/material.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';
import 'package:xfocus_mobile/animations/slide_right_route.dart';
import 'package:xfocus_mobile/screen/intro/intro.dart';
import 'screen/deviceinfo/deviceinfo.dart';
import 'screen/localjson/localdata.dart';
import 'screen/markdown/markdown.dart';
import 'screen/notification/notification.dart';
// import 'screen/onesignal/onesignal.dart';
import 'screen/qr/qr.dart';
// import 'screen/animation/animation.dart';
import 'screen/preference/preference.dart';
import 'screen/socketio/socketio.dart';
import 'screen/sqflite/sqflite.dart';
import 'screen/websocket/websocket.dart';
import 'screen/badge/badge.dart';
import 'screen/calendar/calendar.dart';
import 'screen/rangeslider/rangeslider.dart';
import 'screen/googlesignin/googlesignin.dart';
import 'screen/firebasemessaging/firebasemessaging.dart';
// import 'screen/firebasesmsauth.dart';

class CheckScreenItem extends StatelessWidget {
  final String title;
  final onTap;
  final bool bottomBorder;
  final decoration = BoxDecoration(
    border: BorderDirectional(
      bottom: BorderSide(
        width: 0.5,
        color: Colors.grey.withOpacity(0.5),
      ),
    ),
  );
  CheckScreenItem({
    Key key,
    this.title,
    this.onTap,
    this.bottomBorder = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: bottomBorder ? decoration : null,
            height: 70.0,
            child: Center(
              child: Text(
                '$title',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CheckScreen extends StatefulWidget {
  _CheckScreenState createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  void _goToScreen(context, Widget screen) {
    Navigator.push(
      context,
      SlideRightRoute(
        widget: screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'Cek Fungsi',
      ),
      body: ListView(children: <Widget>[
        CheckScreenItem(
          title: 'Intro Screen',
          onTap: () => _goToScreen(context, IntroScreen()),
        ),
        CheckScreenItem(
          title: 'Websocket',
          onTap: () => _goToScreen(context, WebsocketScreen()),
        ),
        CheckScreenItem(
          title: 'Socket IO',
          onTap: () => _goToScreen(context, SocketioScreen()),
        ),
        CheckScreenItem(
          title: 'Local Json',
          onTap: () => _goToScreen(context, LocaldataScreen()),
        ),
        CheckScreenItem(
          title: 'Sqflite',
          onTap: () => _goToScreen(context, SqfliteScreen()),
        ),
        CheckScreenItem(
          title: 'Device Info',
          onTap: () => _goToScreen(context, DeviceinfoScreen()),
        ),
        CheckScreenItem(
          title: 'Preference',
          onTap: () => _goToScreen(context, PreferenceScreen()),
        ),
        CheckScreenItem(
          title: 'QR',
          onTap: () => _goToScreen(context, QrScreen()),
        ),
        CheckScreenItem(
          title: 'Badge',
          onTap: () => _goToScreen(context, BadgeScreen()),
        ),
        CheckScreenItem(
          title: 'Notification',
          onTap: () => _goToScreen(context, NotificationScreen()),
        ),
        CheckScreenItem(
          title: 'Markdown',
          onTap: () => _goToScreen(context, MarkdownScreen()),
        ),
        /* CheckScreenItem(
          title: 'Animation',
          onTap: () => _goToScreen(context, AnimationScreen()),
        ), */
        // CheckScreenItem(
        //   title: 'Google Sign in',
        //   onTap: () => _goToScreen(context, FirebasesmsauthScreen(
        //     title: 'Firebase Title',
        //   )),
        // ),
        CheckScreenItem(
          title: 'Simple Auth',
          onTap: () => {},
        ),
        CheckScreenItem(
          title: 'Firebase Auth',
          onTap: () => {},
        ),
        /* CheckScreenItem(
          title: 'One Signal',
          onTap: () => _goToScreen(context, OnesignalScreen()),
        ), */
        CheckScreenItem(
          title: 'Range Slider',
          onTap: () => _goToScreen(context, RangesliderScreen()),
        ),
        CheckScreenItem(
          title: 'Sign In',
          onTap: () => _goToScreen(context, GooglesigninScreen()),
        ),
        CheckScreenItem(
          title: 'Firebase Messagin',
          onTap: () => _goToScreen(context, FirebasemessagingScreen()),
        ),
        CheckScreenItem(
          title: 'Calendar',
          onTap: () => _goToScreen(context, CalendarScreen()),
          bottomBorder: false,
        ),
      ]),
    );
  }
}
