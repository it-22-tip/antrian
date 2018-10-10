import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:xfocus_mobile/config/socket_urls.dart';

class WebsocketScreen extends StatefulWidget {
  WebsocketScreen({Key key}) : super(key: key);

  @override
  _WebsocketScreenState createState() => _WebsocketScreenState();
}

class _WebsocketScreenState extends State<WebsocketScreen> {
  dynamic rv;
  dynamic activeUrl = 1;
  bool connectionSwitch = false;
  bool connecting = false;
  WebSocketChannel channel;
  TextEditingController controller;
  List<String> messages = [];

  List<Widget> _psg() {
    List<Widget> a = [];
    socketUrls.forEach((id, url) {
      a.add(Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Radio(
                value: id,
                groupValue: activeUrl,
                onChanged: (value) {
                  setState(() {
                    activeUrl = value;
                    connectionSwitch = false;
                    _clearMessage();
                  });
                },
              ),
              Text(url),
            ],
          )
        ],
      ));
    });
    return a;
  }

  @override
  void initState() {
    super.initState();
    // channel = IOWebSocketChannel.connect(widget.url);
    // _connect();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Web Socket Echo')),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(socketUrls[activeUrl]),
              Column(
                children: _psg(),
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Switch(
                    value: connectionSwitch,
                    onChanged: (value) {
                      setState(() {
                        connectionSwitch = value;
                        if (value) {
                          _connect();
                        } else {
                          _disconnect();
                          _clearMessage();
                        }
                      });
                    },
                  ),
                  Text(connectionSwitch ? 'connected' : 'disconnected'),
                ],
              ),
              Form(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Send To Web Socket',
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: messages.map((message) => Text(message)).toList(),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _sendMesage();
        },
        tooltip: 'Send',
        child: Icon(
          Icons.send,
        ),
      ),
    );
  }

  void _clearMessage() {
    messages = [];
  }

  void _connect() {
    String url = socketUrls[activeUrl];
    channel = IOWebSocketChannel.connect(url);
    connecting = true;
    channel.stream.listen((data) => setState(() => messages.add(data)));
  }

  void _disconnect() {
    debugPrint('disconnect');
    channel.sink.close(1000);
    connecting = false;
    connectionSwitch = false;
  }

  void _sendMesage() {
    if (controller.text.isNotEmpty && connecting) {
      channel.sink.add(controller.text);
      controller.clear();
    }
  }

  @override
  void dispose() {
    if (connecting) _disconnect();
    super.dispose();
  }
}
