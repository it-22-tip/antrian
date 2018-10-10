import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class SocketioScreen extends StatefulWidget {
  SocketioScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SocketioScreenState createState() => _SocketioScreenState();
}

class _SocketioScreenState extends State<SocketioScreen> {
  var mTextMessageController = TextEditingController();
  SocketIO socketIO;
  SocketIO socketIO02;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // if (connecting) _disconnect();
    super.dispose();
  }

  _connectSocket01() {
    socketIO = SocketIOManager().createSocketIO(
        'http://127.0.0.1:3000', '/chat',
        query: 'userId=21031', socketStatusCallback: _socketStatus);

    //call init socket before doing anything
    socketIO.init();

    //subscribe event
    socketIO.subscribe('socket_info', _onSocketInfo);

    //connect socket
    socketIO.connect();
  }

  _connectSocket02() {
    socketIO02 = SocketIOManager().createSocketIO(
        'http://127.0.0.1:3000', '/map',
        query: 'userId=21031', socketStatusCallback: _socketStatus02);

    //call init socket before doing anything
    socketIO02.init();

    //subscribe event
    socketIO02.subscribe('socket_info', _onSocketInfo02);

    //connect socket
    socketIO02.connect();
  }

  _onSocketInfo(dynamic data) {
    print('Socket info: ' + data);
  }

  _socketStatus(dynamic data) {
    print('Socket status: ' + data);
  }

  _onSocketInfo02(dynamic data) {
    print('Socket 02 info: ' + data);
  }

  _socketStatus02(dynamic data) {
    print('Socket 02 status: ' + data);
  }

  _subscribes() {
    if (socketIO != null) {
      socketIO.subscribe('chat_direct', _onReceiveChatMessage);
    }
  }

  _unSubscribes() {
    if (socketIO != null) {
      socketIO.unSubscribe('chat_direct', _onReceiveChatMessage);
    }
  }

  _reconnectSocket() {
    if (socketIO == null) {
      _connectSocket01();
    } else {
      socketIO.connect();
    }
  }

  _disconnectSocket() {
    if (socketIO != null) {
      socketIO.disconnect();
    }
  }

  _destroySocket() {
    if (socketIO != null) {
      SocketIOManager().destroySocket(socketIO);
    }
  }

  void _sendChatMessage(String msg) async {
    if (socketIO != null) {
      String jsonData = '''
    {
      'message': {
        'type': 'Text',
        'content': '${(msg != null && msg.isNotEmpty) ? '$msg' : 'hello'}',
        'owner': '589f10b9bbcd694aa570988d',
        'avatar': 'img/avatar-default.png'
      },
      'sender': {
        'userId': '589f10b9bbcd694aa570988d',
        'first': 'Ha',
        'last': 'Test 2',
        'location': {
          'lat': 10.792273999999999,
          'long': 106.6430356,
          'accuracy': 38,
          'regionId': null,
          'vendor': 'gps',
          'verticalAccuracy': null
        },
        'name': 'Ha Test 2'
      },
      'receivers': [
        '587e1147744c6260e2d3a4af'
      ],
      'conversationId': '589f116612aa254aa4fef79f',
      'name': null,
      'isAnonymous': null
    }
''';
      socketIO.sendMessage('chat_direct', jsonData, _onReceiveChatMessage);
    }
  }

  void socketInfo(dynamic message) {
    print('Socket Info: ' + message);
  }

  void _onReceiveChatMessage(dynamic message) {
    print('Message from UFO: ' + message);
  }

  void _showToast() {
    _sendChatMessage(mTextMessageController.text);
  }

  Widget _button(text, onPressed) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white)
      ),
      color: Theme.of(context).accentColor,
      elevation: 0.0,
      splashColor: Colors.blueGrey,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        primaryAppBarTitle: 'Socket.IO',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _button('Connect Socket 01', _connectSocket01),
            _button('Connect Socket 02', _connectSocket02),
            _button('Send Message', _showToast),
            _button('Subscribe', _subscribes),
            RaisedButton(
              child: const Text('UNSUBSCRIBES',
                  style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _unSubscribes();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
            RaisedButton(
              child: const Text('RECONNECT',
                  style: TextStyle(color: Colors.white)),
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                _reconnectSocket();
//                _sendChatMessage(mTextMessageController.text);
              },
            ),
            _button('Disconnect', _disconnectSocket),
            _button('Destroy', _destroySocket),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
