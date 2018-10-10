// dart import
import 'dart:async';

// package import
import 'package:flutter/material.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';
import 'package:onesignal/onesignal.dart';

// local import
import 'app_id.dart' as config;

class OnesignalScreen extends StatefulWidget {
  @override
  _OnesignalScreenState createState() => _OnesignalScreenState();
}

class _OnesignalScreenState extends State<OnesignalScreen> {
  String _debugLabelString = '';
  String _emailAddress;
  bool _enableConsentButton = false;

  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  bool _requireConsent = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared.setNotificationReceivedHandler((notification) {
      this.setState(() {
        _debugLabelString =
            'Received notification: \n${notification.jsonRepresentation().replaceAll('\\n', '\n')}';
      });
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      this.setState(() {
        _debugLabelString =
            'Opened notification: \n${result.notification.jsonRepresentation().replaceAll('\\n', '\n')}';
      });
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      print('SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}');
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      print('PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}');
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      print('EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}');
    });

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared.init(config.appId, iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    this.setState(() {
      _enableConsentButton = requiresConsent;
    });
  }

  void _handleGetTags() {
    OneSignal.shared.getTags().then((tags) {
      if (tags == null) return;

      setState((() {
        _debugLabelString = '$tags';
      }));
    }).catchError((error) {
      setState(() {
        _debugLabelString = '$error';
      });
    });
  }

  void _handleSendTags() {
    print('Sending tags');
    OneSignal.shared.sendTag('test2', 'val2').then((response) {
      print('Successfully sent tags with response: $response');
    }).catchError((error) {
      print('Encountered an error sending tags: $error');
    });
  }

  void _handlePromptForPushPermission() {
    print('Prompting for Permission');
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print('Accepted permission: $accepted');
    });
  }

  void _handleGetPermissionSubscriptionState() {
    print('Getting permissionSubscriptionState');
    OneSignal.shared.getPermissionSubscriptionState().then((status) {
      this.setState(() {
        _debugLabelString = status.jsonRepresentation();
      });
    });
  }

  void _handleSetEmail() {
    if (_emailAddress == null) return;

    print('Setting email');

    OneSignal.shared.setEmail(email: _emailAddress).whenComplete(() {
      print('Successfully set email');
    }).catchError((error) {
      print('Failed to set email with error: $error');
    });
  }

  void _handleLogoutEmail() {
    print('Logging out of email');
    OneSignal.shared.logoutEmail().then((v) {
      print('Successfully logged out of email');
    }).catchError((error) {
      print('Failed to log out of email: $error');
    });
  }

  void _handleConsent() {
    print('Setting consent to true');
    OneSignal.shared.consentGranted(true);

    print('Setting state');
    this.setState(() {
      _enableConsentButton = false;
    });
  }

  void _handleSetLocationShared() {
    print('Setting location shared to true');
    OneSignal.shared.setLocationShared(true);
  }

  void _handleDeleteTag() {
    print('Deleting tag');
    OneSignal.shared.deleteTag('test2').then((response) {
      print('Successfully deleted tags with response $response');
    }).catchError((error) {
      print('Encountered error deleting tag: $error');
    });
  }

  void _handleSendNotification() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();

    var playerId = status.subscriptionStatus.userId;

    var imgUrlString =
        'http://cdn1-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-2.jpg';

    var notification = OSCreateNotification(
        playerIds: [playerId],
        content: 'this is a test from OneSignal\'s Flutter SDK',
        heading: 'Test Notification',
        iosAttachments: {'id1': imgUrlString},
        bigPicture: imgUrlString,
        buttons: [
          OSActionButton(text: 'test1', id: 'id1'),
          OSActionButton(text: 'test2', id: 'id2')
        ]);

    var response = await OneSignal.shared.postNotification(notification);

    this.setState(() {
      _debugLabelString = 'Sent notification with response: $response';
    });
  }

  void _handleSendSilentNotification() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();

    var playerId = status.subscriptionStatus.userId;

    var notification = OSCreateNotification.silentNotification(
        playerIds: [playerId], additionalData: {'test': 'value'});

    var response = await OneSignal.shared.postNotification(notification);

    this.setState(() {
      _debugLabelString = 'Sent notification with response: $response';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'One Signal',
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Table(
            children: [
              TableRow(children: [
                OneSignalButton(
                    'Get Tags', _handleGetTags, !_enableConsentButton)
              ]),
              TableRow(children: [
                OneSignalButton(
                    'Send Tags', _handleSendTags, !_enableConsentButton)
              ]),
              TableRow(children: [
                OneSignalButton('Prompt for Push Permission',
                    _handlePromptForPushPermission, !_enableConsentButton)
              ]),
              TableRow(children: [
                OneSignalButton(
                    'Print Permission Subscription State',
                    _handleGetPermissionSubscriptionState,
                    !_enableConsentButton)
              ]),
              TableRow(children: [
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 212, 86, 83),
                      )),
                  onChanged: (text) {
                    this.setState(() {
                      _emailAddress = text == '' ? null : text;
                    });
                  },
                )
              ]),
              TableRow(children: [
                Container(
                  height: 8.0,
                )
              ]),
              TableRow(children: [
                OneSignalButton(
                    'Set Email', _handleSetEmail, !_enableConsentButton)
              ]),
              TableRow(children: [
                OneSignalButton(
                    'Logout Email', _handleLogoutEmail, !_enableConsentButton)
              ]),
              TableRow(children: [
                OneSignalButton('Provide GDPR Consent', _handleConsent,
                    _enableConsentButton)
              ]),
              TableRow(children: [
                OneSignalButton('Set Location Shared', _handleSetLocationShared,
                    !_enableConsentButton)
              ]),
              TableRow(children: [
                OneSignalButton(
                    'Delete Tag', _handleDeleteTag, !_enableConsentButton)
              ]),
              TableRow(children: [
                OneSignalButton('Post Notification', _handleSendNotification,
                    !_enableConsentButton)
              ]),
              TableRow(children: [
                OneSignalButton('Post Silent Notification',
                    _handleSendSilentNotification, !_enableConsentButton)
              ]),
              TableRow(children: [
                Container(
                  child: Text(_debugLabelString),
                  alignment: Alignment.center,
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}

typedef void OnButtonPressed();

class OneSignalButton extends StatefulWidget {
  final String title;
  final OnButtonPressed onPressed;
  final bool enabled;

  OneSignalButton(this.title, this.onPressed, this.enabled);

  State<StatefulWidget> createState() => OneSignalButtonState();
}

class OneSignalButtonState extends State<OneSignalButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Table(
      children: [
        TableRow(children: [
          FlatButton(
            disabledColor: Colors.grey.shade400,
            disabledTextColor: Colors.black.withOpacity(0.5),
            color: Color.fromARGB(255, 212, 86, 83),
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: Text(widget.title),
            onPressed: widget.enabled ? widget.onPressed : null,
          )
        ]),
        TableRow(children: [
          Container(
            height: 8.0,
          )
        ]),
      ],
    );
  }
}
