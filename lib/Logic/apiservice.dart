// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:testing/todomodel.dart';

class ApiService {
  final http.Client myhttp;
  ApiService(this.myhttp);
  Future<Todomodel> getData() async {
    var res = await myhttp
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      return Todomodel.fromMap(body);
    } else {
      throw Exception('something wrong');
    }
  }

  Future<List<Todomodel>> gettodoData() async {
    var res = await myhttp
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      List<Todomodel> todoList = body.map((m) => Todomodel.fromMap(m)).toList();
      return todoList;
    } else {
      throw Exception('something error in getting TodoList');
    }
  }
}
