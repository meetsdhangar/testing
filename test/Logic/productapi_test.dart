import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing/Logic/productapi.dart';
import 'package:testing/Models/productmodel.dart';

class Myhttpclient extends Mock implements Client {}

void main() {
  late Myhttpclient myhttpclient;
  late Productapi productApi;

  setUp(() {
    myhttpclient = Myhttpclient();
    productApi = Productapi(myhttpclient);
  });
  group('Api services test -', () {
    test('check it return Product type data', () async {
      when(() =>
              myhttpclient.get(Uri.parse("https://dummyjson.com/products/1")))
          .thenAnswer((invocation) async {
        return Response(
            '''"id":1,"title":"iPhone 9","description":"An apple mobile which is nothing like apple","price":549,"discountPercentage":12.96,"rating":4.69,"stock":94,"brand":"Apple","category":"smartphones","thumbnail":"https://cdn.dummyjson.com/product-images/1/thumbnail.jpg","images":["https://cdn.dummyjson.com/product-images/1/1.jpg","https://cdn.dummyjson.com/product-images/1/2.jpg","https://cdn.dummyjson.com/product-images/1/3.jpg","https://cdn.dummyjson.com/product-images/1/4.jpg","https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"''',
            200);
      });
      final data = await productApi.getproduct();
      expect(data, isA<Productmodel>());
    });
  });
}
