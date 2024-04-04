import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing/Logic/apiservice.dart';
import 'package:testing/todomodel.dart';

class Myhttpclient extends Mock implements Client {}

void main() {
  late Myhttpclient myhttpclient;
  late ApiService apiService;
  setUp(() {
    myhttpclient = Myhttpclient();
    apiService = ApiService(myhttpclient);
  });
  group('Api services test -', () {
    test('check it return todo type data', () async {
      //arrange

      when(() => myhttpclient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')))
          .thenAnswer((invocation) async {
        return Response('''
             {
              "userId": 1,
              "id": 1,
              "title": "delectus aut autem",
              "completed": false
            }''', 200);
      });
      //act
      final data = await apiService.getData();
      //assert
      expect(data, isA<Todomodel>());
    });
  });

  test('status code not equal to 200', () async {
    when(() => myhttpclient
            .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')))
        .thenAnswer((invocation) async => Response('{}', 500));

    final data = apiService.getData();
    //assert
    //  await expectLater(data, throwsException);
    expect(data, throwsException);
  });

  // group('Get Todo List function Test -', ()  {
  //   test('get status code 200 and return comment list', () async {
  //     final List<dynamic> todolist = [
  //       {
  //         "userId": 1,
  //         "id": 1,
  //         "title": "delectus aut autem",
  //         "completed": false
  //       },
  //       {
  //         "userId": 2,
  //         "id": 29,
  //         "title": "laborum aut in quam",
  //         "completed": false
  //       },
  //     ];
  //     when(() => myhttpclient
  //             .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/')))
  //         .thenAnswer(
  //             (invocation) async => Response(jsonEncode(todolist), 200));
  //   });
  //   final tlist = await apiService.gettodoData();
  //   expect(tlist, isA<List<Todomodel>>());
  //   expect(tlist.length, todolist.length);

  // });

  group('Get Todo List function Test - ', () {
    test('get status code 200 and return todo list', () async {
      //arrange
      final List<dynamic> todolist = [
        {
          "userId": 1,
          "id": 1,
          "title": "delectus aut autem",
          "completed": false
        },
        {
          "userId": 2,
          "id": 26,
          "title": "aliquam aut quasi",
          "completed": true
        },
      ];

      when(() => myhttpclient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/')))
          .thenAnswer(
              (invocation) async => Response(json.encode(todolist), 200));

      //action
      final tlist = await apiService.gettodoData();
      //asset
      expect(tlist, isA<List<Todomodel>>());
      expect(tlist.length, todolist.length);

      for (var i = 0; i < tlist.length; i++) {
        expect(tlist[i], isA<Todomodel>());
      }
    });

  });
}
