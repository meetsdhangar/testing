import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing/Models/commentsmodel.dart';

class CommentsApi {
  final http.Client myhttp;

  CommentsApi(this.myhttp);
  Future<Commentsmodel> getCommentData() async {
    var responce = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments/1'));
    if (responce.statusCode == 200) {
      var body = jsonDecode(responce.body);
      return Commentsmodel.fromMap(body);
    } else {
      throw Exception('something wrong');
    }
  }

  Future<List<Commentsmodel>> getCommentList() async {
    var responce = await myhttp
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (responce.statusCode == 200) {
      List body = jsonDecode(responce.body);
      List<Commentsmodel> cmtList =
          body.map((e) => Commentsmodel.fromMap(e)).toList();
      return cmtList;
    } else {
      throw Exception('Some error in getting commentList');
    }
  }
}
