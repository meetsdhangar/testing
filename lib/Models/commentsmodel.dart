// To parse this JSON data, do
//
//     final commentsmodel = commentsmodelFromMap(jsonString);

import 'dart:convert';

List<Commentsmodel> commentsmodelFromMap(String str) =>
    List<Commentsmodel>.from(
        json.decode(str).map((x) => Commentsmodel.fromMap(x)));

String commentsmodelToMap(List<Commentsmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Commentsmodel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Commentsmodel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Commentsmodel.fromMap(Map<String, dynamic> json) => Commentsmodel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
