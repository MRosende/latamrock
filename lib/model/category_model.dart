// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  CategoriesModel({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.parent,
  });

  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  int? parent;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json["id"] == null ? null : json["id"],
        count: json["count"] == null ? null : json["count"],
        description: json["description"] == null ? null : json["description"],
        link: json["link"] == null ? null : json["link"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        parent: json["parent"] == null ? null : json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "count": count == null ? null : count,
        "description": description == null ? null : description,
        "link": link == null ? null : link,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "parent": parent == null ? null : parent,
      };
}
