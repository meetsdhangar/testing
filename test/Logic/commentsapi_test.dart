import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing/Logic/commentsapi.dart';
import 'package:testing/Models/commentsmodel.dart';

import '../apiservice_test.dart';

class MockhttpClient extends Mock implements Client {}

void main() {
  late Myhttpclient myhttpclient;
  late CommentsApi commentsService;

  setUp(() {
    myhttpclient = Myhttpclient();
    commentsService = CommentsApi(myhttpclient);
  });
  group('Api services test -', () {
    test('check it return comments type data', () async {
      //arrange

      when(() => myhttpclient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/comments/1')))
          .thenAnswer((invocation) async {
        return Response(
            '''
              {
    "postId": 1,
    "id": 1,
    "name": "id labore ex et quam laborum",
    "email": "Eliseo@gardner.biz",
    "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
  }''',
            200);
      });
      //act
      final data = await commentsService.getCommentData();
      //assert
      expect(data, isA<Commentsmodel>());
    });
  });

  group('Get Comment List function Test - ', () {
    test('get status code 200 and return comment list', () async {
      //arrange
      final List<dynamic> commentsreslist = [
        {
          "postId": 1,
          "id": 1,
          "name": "id labore ex et quam laborum",
          "email": "Eliseo@gardner.biz",
          "body":
              "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
        },
        {
          "postId": 2,
          "id": 7,
          "name":
              "repellat consequatur praesentium vel minus molestias voluptatum",
          "email": "Dallas@ole.me",
          "body":
              "maiores sed dolores similique labore et inventore et\nquasi temporibus esse sunt id et\neos voluptatem aliquam\naliquid ratione corporis molestiae mollitia quia et magnam dolor"
        },
      ];

      when(() => myhttpclient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/comments')))
          .thenAnswer((invocation) async =>
              Response(json.encode(commentsreslist), 200));

      //action
      final commentlist = await commentsService.getCommentList();
      //asset
      expect(commentlist, isA<List<Commentsmodel>>());
      expect(commentlist.length, commentsreslist.length);

      for (var i = 0; i < commentlist.length; i++) {
        expect(commentlist[i], isA<Commentsmodel>());
      }
    });

    test('get status code 200 and get empty list', () async {
      //arrange
      when(() => myhttpclient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/comments')))
          .thenAnswer((invocation) async => Response('[]', 200));
      //action
      final cmtlist = await commentsService.getCommentList();

      //assets
      expect(cmtlist, isA<List<Commentsmodel>>());
      expect(cmtlist.isEmpty, true);
    });
  });
}
