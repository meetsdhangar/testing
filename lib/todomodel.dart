// To parse this JSON data, do
//
//     final todomodel = todomodelFromMap(jsonString);

import 'dart:convert';

Todomodel todomodelFromMap(String str) => Todomodel.fromMap(json.decode(str));

String todomodelToMap(Todomodel data) => json.encode(data.toMap());

class Todomodel {
  int userId;
  int id;
  String title;
  bool completed;

  Todomodel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todomodel.fromMap(Map<String, dynamic> json) => Todomodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
