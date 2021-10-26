// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    this.id,
    this.categoryId,
    this.postDate,
    this.title,
    this.categoryName,
    this.imageUrl,
  });

  int? id;
  int? categoryId;
  DateTime? postDate;
  String? title;
  String? categoryName;
  String? imageUrl;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"] == null ? null : json["id"],
        postDate: json["post_date"] == null
            ? null
            : DateTime.parse(json["post_date"]),
        title: json["title"] == null ? null : json["title"],
        categoryName:
            json["category_name"] == null ? null : json["category_name"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "post_date": postDate == null ? null : postDate.toString(),
        "title": title == null ? null : title,
        "category_name": categoryName == null ? null : categoryName,
        "image_url": imageUrl == null ? null : imageUrl,
      };
}
