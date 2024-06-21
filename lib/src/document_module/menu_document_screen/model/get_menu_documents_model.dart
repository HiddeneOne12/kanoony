// To parse this JSON data, do
//
//     final menuDocumentsModel = menuDocumentsModelFromJson(jsonString);

import 'dart:convert';

MenuDocumentsModel menuDocumentsModelFromJson(String str) =>
    MenuDocumentsModel.fromJson(json.decode(str));

String menuDocumentsModelToJson(MenuDocumentsModel data) =>
    json.encode(data.toJson());

class MenuDocumentsModel {
  List<Document> documents;

  MenuDocumentsModel({
    required this.documents,
  });

  factory MenuDocumentsModel.fromJson(Map<String, dynamic> json) =>
      MenuDocumentsModel(
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class Document {
  String title;
  String summary;
  List<MenuDoc> data;

  Document({
    required this.title,
    required this.summary,
    required this.data,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        title: json["title"].toString(),
        summary: json["summary"].toString(),
        data: List<MenuDoc>.from(json["data"].map((x) => MenuDoc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "summary": summary,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MenuDoc {
  String documentId;
  String title;
  String slug;
  String documentPrice;
  String editComplete;
  String purchasedId;

  MenuDoc({
    required this.documentId,
    required this.title,
    required this.slug,
    required this.documentPrice,
    required this.editComplete,
    required this.purchasedId,
  });

  factory MenuDoc.fromJson(Map<String, dynamic> json) => MenuDoc(
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
