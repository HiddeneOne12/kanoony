// To parse this JSON data, do
//
//     final paidDocModel = paidDocModelFromJson(jsonString);

import 'dart:convert';

PaidDocModel paidDocModelFromJson(String str) =>
    PaidDocModel.fromJson(json.decode(str));

String paidDocModelToJson(PaidDocModel data) => json.encode(data.toJson());

class PaidDocModel {
  List<Category> categories;
  Parent parent;

  PaidDocModel({
    required this.categories,
    required this.parent,
  });

  factory PaidDocModel.fromJson(Map<String, dynamic> json) => PaidDocModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        parent: Parent.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "parent": parent.toJson(),
      };
}

class Category {
  String title;
  List<CategoryDatum> data;

  Category({
    required this.title,
    required this.data,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
        data: List<CategoryDatum>.from(
            json["data"].map((x) => CategoryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryDatum {
  String title;
  List<DatumDatum> data;

  CategoryDatum({
    required this.title,
    required this.data,
  });

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        title: json["title"],
        data: List<DatumDatum>.from(
            json["data"].map((x) => DatumDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumDatum {
  String documentId;
  String title;
  String slug;
  String documentPrice;
  dynamic editComplete;
  dynamic purchasedId;

  DatumDatum({
    required this.documentId,
    required this.title,
    required this.slug,
    required this.documentPrice,
    required this.editComplete,
    required this.purchasedId,
  });

  factory DatumDatum.fromJson(Map<String, dynamic> json) => DatumDatum(
        documentId: json["document_id"].toString(),
        title: json["title"].toString(),
        slug: json["slug"].toString(),
        documentPrice: json["document_price"].toString(),
        editComplete: json["edit_complete"].toString(),
        purchasedId: json["purchased_id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "document_id": documentId,
        "title": title,
        "slug": slug,
        "document_price": documentPrice,
        "edit_complete": editComplete,
        "purchased_id": purchasedId,
      };
}

class Parent {
  String categoryId;
  String title;
  String slug;
  String banner;

  Parent({
    required this.categoryId,
    required this.title,
    required this.slug,
    required this.banner,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        categoryId: json["category_id"].toString(),
        title: json["title"].toString(),
        slug: json["slug"].toString(),
        banner: json["banner"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "title": title,
        "slug": slug,
        "banner": banner,
      };
}
