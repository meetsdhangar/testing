// To parse this JSON data, do
//
//     final quotessmodel = quotessmodelFromMap(jsonString);

import 'dart:convert';

Quotessmodel quotessmodelFromMap(String str) => Quotessmodel.fromMap(json.decode(str));

String quotessmodelToMap(Quotessmodel data) => json.encode(data.toMap());

class Quotessmodel {
    List<Quote> quotes;
    int total;
    int skip;
    int limit;

    Quotessmodel({
        required this.quotes,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory Quotessmodel.fromMap(Map<String, dynamic> json) => Quotessmodel(
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromMap(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toMap() => {
        "quotes": List<dynamic>.from(quotes.map((x) => x.toMap())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Quote {
    int id;
    String quote;
    String author;

    Quote({
        required this.id,
        required this.quote,
        required this.author,
    });

    factory Quote.fromMap(Map<String, dynamic> json) => Quote(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "quote": quote,
        "author": author,
    };
}
