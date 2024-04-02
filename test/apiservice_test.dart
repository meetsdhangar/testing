import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing/apiservice.dart';
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
        return Response(
            '''
             {
              "userId": 1,
              "id": 1,
              "title": "delectus aut autem",
              "completed": false
            }''',
            200);
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
}
