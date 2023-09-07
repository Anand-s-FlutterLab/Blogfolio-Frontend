import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

class BlogModel {
  List<Datum> data;

  BlogModel({
    required this.data,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  Attributes attributes;

  Datum({
    required this.id,
    required this.attributes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  String title;
  String content;
  String author;
  String imageUrl;
  String authorId;
  int readMin;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;

  Attributes({
    required this.title,
    required this.content,
    required this.author,
    required this.imageUrl,
    required this.authorId,
    required this.readMin,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        title: json["title"],
        content: json["content"],
        author: json["author"],
        imageUrl: json["imageUrl"],
        authorId: json["authorID"],
        readMin: json["readMin"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "author": author,
        "imageUrl": imageUrl,
        "authorID": authorId,
        "readMin": readMin,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}
