// To parse this JSON data, do
//
//     final commentsResponseModel = commentsResponseModelFromJson(jsonString);

import 'dart:convert';

List<CommentsResponseModel> commentsResponseModelFromJson(String str) =>
    List<CommentsResponseModel>.from(
        json.decode(str).map((x) => CommentsResponseModel.fromJson(x)));

String commentsResponseModelToJson(List<CommentsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentsResponseModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsResponseModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory CommentsResponseModel.fromJson(Map<String, dynamic> json) =>
      CommentsResponseModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
