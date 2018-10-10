import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'exp_test_page.dart';
import 'deprecated_test_page.dart';
import 'model/main_item.dart';
import 'open_test_page.dart';
import 'exception_test_page.dart';
import 'raw_test_page.dart';
import 'slow_test_page.dart';
import 'src/main_item_widget.dart';
import 'type_test_page.dart';
import 'todo_test_page.dart';

// import 'package:xfocus_mobile/animations/slide_right_route.dart';
// import 'package:xfocus_mobile/screen/check/check.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';

class SqfliteScreen extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _SqfliteScreenState createState() => _SqfliteScreenState();
}

const String testRawRoute = "/test/simple";
const String testOpenRoute = "/test/open";
const String testSlowRoute = "/test/slow";
const String testThreadRoute = "/test/thread";
const String testTodoRoute = "/test/todo";
const String testExceptionRoute = "/test/exception";
const String testExpRoute = "/test/exp";
const String testDeprecatedRoute = "/test/deprecated";

class _SqfliteScreenState extends State<SqfliteScreen> {
  var routes = <String, WidgetBuilder>{
    '/test': (BuildContext context) => MyHomePage(),
    testRawRoute: (BuildContext context) => SimpleTestPage(),
    testOpenRoute: (BuildContext context) => OpenTestPage(),
    testSlowRoute: (BuildContext context) => SlowTestPage(),
    testTodoRoute: (BuildContext context) => TodoTestPage(),
    testThreadRoute: (BuildContext context) => TypeTestPage(),
    testExceptionRoute: (BuildContext context) => ExceptionTestPage(),
    testExpRoute: (BuildContext context) => ExpTestPage(),
    testDeprecatedRoute: (BuildContext context) => DeprecatedTestPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqflite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Sqflite Demo Home Page',
      ),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<MainItem> items = [];

  MyHomePage({Key key, this.title}) : super(key: key) {
    items.add(
        MainItem("Raw tests", "Raw SQLite operations", route: testRawRoute));
    items.add(MainItem("Open tests", "Open onCreate/onUpgrade/onDowngrade",
        route: testOpenRoute));
    items.add(
        MainItem("Type tests", "Test value types", route: testThreadRoute));
    items.add(
        MainItem("Slow tests", "Lengthy operations", route: testSlowRoute));
    items.add(MainItem(
        "Todo database example", "Simple Todo-like database usage example",
        route: testTodoRoute));
    items.add(MainItem("Exp tests", "Experimental and various tests",
        route: testExpRoute));
    items.add(MainItem("Exception tests", "Tests that trigger exceptions",
        route: testExceptionRoute));
    items.add(MainItem("Deprecated test",
        "Keeping some old tests for deprecated functionalities",
        route: testDeprecatedRoute));

    // Uncomment to view all logs
    //Sqflite.devSetDebugModeOn(true);
  }

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _platformVersion = 'Unknown';

  int get _itemCount => widget.items.length;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Sqflite.platformVersion;
    } on PlatformException {
      platformVersion = "Failed to get platform version";
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });

    print("running on: " + _platformVersion);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBar(
          primaryAppBarTitle: 'SQFLite',
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body:
            ListView.builder(itemBuilder: _itemBuilder, itemCount: _itemCount));
  }

  //Center(child: Text('Running on: $_platformVersion\n')),

  Widget _itemBuilder(BuildContext context, int index) {
    return MainItemWidget(widget.items[index], (MainItem item) {
      Navigator.of(context).pushNamed(item.route);
    });
  }
}
