// To parse this JSON data, do
//
//     final freeDocumentsUseModel = freeDocumentsUseModelFromJson(jsonString);

import 'dart:convert';

FreeDocumentsUseModel freeDocumentsUseModelFromJson(String str) =>
    FreeDocumentsUseModel.fromJson(json.decode(str));

String freeDocumentsUseModelToJson(FreeDocumentsUseModel data) =>
    json.encode(data.toJson());

class FreeDocumentsUseModel {
  List<Category> categories;

  FreeDocumentsUseModel({
    required this.categories,
  });

  factory FreeDocumentsUseModel.fromJson(Map<String, dynamic> json) =>
      FreeDocumentsUseModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  String title;
  List<FreeDoc> data;

  Category({
    required this.title,
    required this.data,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
        data: List<FreeDoc>.from(json["data"].map((x) => FreeDoc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FreeDoc {
  String documentId;
  String title;
  String slug;
  String documentPrice;

  FreeDoc({
    required this.documentId,
    required this.title,
    required this.slug,
    required this.documentPrice,
  });

  factory FreeDoc.fromJson(Map<String, dynamic> json) => FreeDoc(
        documentId: json["document_id"].toString(),
        title: json["title"].toString(),
        slug: json["slug"].toString(),
        documentPrice: json["document_price"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "document_id": documentId,
        "title": title,
        "slug": slug,
        "document_price": documentPrice,
      };
}
