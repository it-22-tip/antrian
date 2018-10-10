import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrolling Detection'),
      ),
      body: ScrollDetection(),
    );
  }
}

class ScrollDetection extends StatefulWidget {
  @override
  createState() => _ScrollDetectionState();
}

class _ScrollDetectionState extends State<ScrollDetection> {
  String scrollingMessage = 'I am a scroll detector';

  bool _scrollingStarted() {
    setState(() => scrollingMessage = 'Wheeeeeeee!');
    return false;
  }

  bool _scrollingEnded() {
    setState(() => scrollingMessage = 'Snore ...');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(scrollingMessage),
        ),
        NotificationListener<ScrollStartNotification>(
          onNotification: (_) => _scrollingStarted(),
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (_) => _scrollingEnded(),
            child: Expanded(
              child: ListView(
                  children: List<ListTile>.generate(
                100,
                (i) => ListTile(title: Text('$i')),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
