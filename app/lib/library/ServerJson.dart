import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:xfocus_mobile/model/Post.dart';

Future<PostList> fetchPost() async {
  final response = await http.get(
    'http://10.0.2.2:9080/dummy',
    headers: {HttpHeaders.acceptEncodingHeader: 'gzip'},
  );
  final String data = utf8.decode(response.bodyBytes).toString();

  if (response.statusCode == 200) {
    var x = PostList.fromJson(json.decode(data));
    // var x = json.decode(data).map((i)=>Post.fromJson(i)).toList();
    // debugPrint(x.post.displayTitle);
    return x;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
