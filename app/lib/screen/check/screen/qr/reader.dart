import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/qr_reader.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class QrreaderScreen extends StatefulWidget {
  QrreaderScreen({Key key, this.title}) : super(key: key);

  final String title;

  final Map<String, dynamic> pluginParameters = {};

  @override
  _QrreaderScreenState createState() => _QrreaderScreenState();
}

class _QrreaderScreenState extends State<QrreaderScreen> {
  Future<String> _barcodeString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'QR Reader',
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _barcodeString,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Text(snapshot.data != null ? snapshot.data : '');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _barcodeString = QRCodeReader()
                .setAutoFocusIntervalInMs(200)
                .setForceAutoFocus(true)
                .setTorchEnabled(true)
                .setHandlePermissions(true)
                .setExecuteAfterPermissionGranted(true)
                .scan();
          });
        },
        tooltip: 'Reader the QRCode',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
