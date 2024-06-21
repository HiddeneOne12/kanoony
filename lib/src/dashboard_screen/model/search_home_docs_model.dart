// To parse this JSON data, do
//
//     final homeSearchModel = homeSearchModelFromJson(jsonString);

import 'dart:convert';

HomeSearchModel homeSearchModelFromJson(String str) =>
    HomeSearchModel.fromJson(json.decode(str));

String homeSearchModelToJson(HomeSearchModel data) =>
    json.encode(data.toJson());

class HomeSearchModel {
  List<Category> categories;

  HomeSearchModel({
    required this.categories,
  });

  factory HomeSearchModel.fromJson(Map<String, dynamic> json) =>
      HomeSearchModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  String title;
  List<HomeSearchDoc> data;

  Category({
    required this.title,
    required this.data,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"] ?? '',
        data: List<HomeSearchDoc>.from(
            json["data"].map((x) => HomeSearchDoc.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HomeSearchDoc {
  String title;
  String slug;

  HomeSearchDoc({
    required this.title,
    required this.slug,
  });

  factory HomeSearchDoc.fromJson(Map<String, dynamic> json) => HomeSearchDoc(
        title: json["title"].toString(),
        slug: json["slug"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
      };
}
