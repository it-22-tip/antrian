import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrwriter extends StatefulWidget {
  _QrwriterState createState() => _QrwriterState();
}

class _QrwriterState extends State<Qrwriter> {
  String _qrData = '123456';

  _displayQr() {
    return QrImage(
        data: _qrData,
        size: 200.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _displayQr(),
      ),
    );
  }
}
