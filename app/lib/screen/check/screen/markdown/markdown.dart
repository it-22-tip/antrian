import 'dart:io';
import 'package:flutter/material.dart';
import 'package:xfocus_mobile/components/app_bar/primary_app_bar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:path_provider/path_provider.dart';

class MarkdownScreen extends StatefulWidget {
  _MarkdownScreenState createState() => _MarkdownScreenState();
}

class _MarkdownScreenState extends State<MarkdownScreen> {
  Directory appDocDir;
  String appDocPath;

  @override
  initState() {
    _setAppDocDir();
    super.initState();
  }

  void _setAppDocDir() async {
    appDocDir = await getApplicationDocumentsDirectory();
    appDocPath = appDocDir.path;
    setState(() {});
  }

  // void _getMdFile() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(primaryAppBarTitle: 'MarkDown'),
      body: Container(
        child: Markdown(data: '''
# __Petunjuk Penggunaan__

## Secondary Title

### Tertiary Title

* List 1

  List 1 Content

* List 2

  List 2 Content

_Hellow_

__Hellow__



  $appDocPath

        '''),
      ),
    );
  }
}
