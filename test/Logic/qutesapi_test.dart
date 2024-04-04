import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import 'package:testing/Logic/qutesapi.dart';
import 'package:testing/Models/quotsmodel.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient myhttpclient;
  late QuotesApi qutesapi;
  setUp(() {
    myhttpclient = MockHttpClient();
    qutesapi = QuotesApi(myhttpclient);
  });
  group('Api services test -', () {
    test('check it return Qutes type data', () async {
      //arrange

      when(() => myhttpclient.get(Uri.parse('https://dummyjson.com/quotes/1')))
          .thenAnswer((invocation) async {
        return Response('''
             {
              ""id":1,"quote":"Your heart is the size of an ocean. Go find yourself in its hidden depths.","author":"Rumi"
            }''', 200);
      });
      //act
      final data = await qutesapi.getquotsdata();
      //assert
      expect(data, isA<Quotessmodel>());
    });
  });
  test('status code not equal to 200', () async {
    when(() => myhttpclient.get(Uri.parse('https://dummyjson.com/quotes/1')))
        .thenAnswer((invocation) async => Response('{}', 500));

    final data =await qutesapi.getquotsdata();
    //assert
    //  await expectLater(data, throwsException);
    expect(data, throwsException);
  });
}
