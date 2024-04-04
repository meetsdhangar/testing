import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing/Models/productmodel.dart';

class Productapi {
  final http.Client myhttp;

  Productapi(this.myhttp);
  Future<List<Productmodel>> getproduct() async {
    var responce =
        await http.get(Uri.parse("https://dummyjson.com/products/1"));
    if (responce.statusCode == 200) {
      var body = jsonDecode(responce.body);
      List<Productmodel> prdList = body.map((e) => Product.fromMap(e)).toList();
      return prdList;
    } else {
      throw Exception("Something went wrong in productapi");
    }
  }

  
}
