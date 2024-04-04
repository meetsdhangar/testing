import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testing/Models/quotsmodel.dart';

class QuotesApi {
  final http.Client myhttp;
  QuotesApi(this.myhttp);

  Future<Quotessmodel> getquotsdata() async {
    var responce =
        await myhttp.get(Uri.parse('https://dummyjson.com/quotes/1'));
    if (responce.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(responce.body);
      return Quotessmodel.fromMap(body);
    } else {
      throw Exception(
          'Failed to fetch quotes. Status code: ${responce.statusCode}');
    }
  }
}
