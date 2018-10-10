import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:xfocus_mobile/config/assets_registry.dart';

class LocalJson {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> loadAsset() async {
    var data = await rootBundle.loadString(assetsRegistry['config']);
    return json.decode(data);
  }

  Future<String> loadCash() async {
    var data = await rootBundle.loadString('assets/json/cash.json');
    // rootBundle.load(key)
    return data; //json.decode(data);
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.json');
  }

  Future<File> get _cashFile async {
    final path = await _localPath;
    return File('$path/counter.json');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      // If we encounter an error, return 0
      return 0;
    }
  }

  Future<String> readCash() async {
    try {
      final file = await _cashFile;
      // Read the file
      String path = file.path;
      print(path);
      String contents = await file.readAsString();
      print(contents);
      return contents;
      // return int.parse(contents);
    } catch (e) {
      // If we encounter an error, return 0
      return 'No Data';
    }
  }

  Future<File> writeCash(String json) async {
    final file = await _cashFile;
    return file.writeAsString(json);
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$counter');
  }
}
