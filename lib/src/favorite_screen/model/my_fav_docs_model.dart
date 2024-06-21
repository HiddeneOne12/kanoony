// To parse this JSON data, do
//
//     final myFovouritesModel = myFovouritesModelFromJson(jsonString);

import 'dart:convert';

MyFovouritesModel myFovouritesModelFromJson(String str) =>
    MyFovouritesModel.fromJson(json.decode(str));

String myFovouritesModelToJson(MyFovouritesModel data) =>
    json.encode(data.toJson());

class MyFovouritesModel {
  String currentPage;
  List<FavDocs> data;
  String firstPageUrl;
  String from;
  String lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  String perPage;
  dynamic prevPageUrl;
  String to;
  String total;

  MyFovouritesModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory MyFovouritesModel.fromJson(Map<String, dynamic> json) =>
      MyFovouritesModel(
        currentPage: json["current_page"].toString(),
        data: List<FavDocs>.from(json["data"].map((x) => FavDocs.fromJson(x))),
        firstPageUrl: json["first_page_url"].toString(),
        from: json["from"].toString(),
        lastPage: json["last_page"].toString(),
        lastPageUrl: json["last_page_url"].toString(),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"].toString(),
        path: json["path"].toString(),
        perPage: json["per_page"].toString(),
        prevPageUrl: json["prev_page_url"].toString(),
        to: json["to"].toString(),
        total: json["total"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class FavDocs {
  int id;
  int documentId;
  DateTime createdAt;
  DateTime updatedAt;
  Documents documents;
  DocumentsLang documentsLang;

  FavDocs({
    required this.id,
    required this.documentId,
    required this.createdAt,
    required this.updatedAt,
    required this.documents,
    required this.documentsLang,
  });

  factory FavDocs.fromJson(Map<String, dynamic> json) => FavDocs(
        id: json["id"],
        documentId: json["document_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        documents: Documents.fromJson(json["documents"]),
        documentsLang: DocumentsLang.fromJson(json["documents_lang"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "document_id": documentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "documents": documents.toJson(),
        "documents_lang": documentsLang.toJson(),
      };
}

class Documents {
  int id;
  int documentPrice;

  Documents({
    required this.id,
    required this.documentPrice,
  });

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
        id: json["id"],
        documentPrice: json["document_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "document_price": documentPrice,
      };
}

class DocumentsLang {
  String id;
  String documentId;
  String title;
  String slug;
  String version;

  DocumentsLang({
    required this.id,
    required this.documentId,
    required this.title,
    required this.slug,
    required this.version,
  });

  factory DocumentsLang.fromJson(Map<String, dynamic> json) => DocumentsLang(
        id: json["id"].toString(),
        documentId: json["document_id"].toString(),
        title: json["title"].toString(),
        slug: json["slug"].toString(),
        version: json["version"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "document_id": documentId,
        "title": title,
        "slug": slug,
        "version": versionValues.reverse[version],
      };
}

enum Version { V_10 }

final versionValues = EnumValues({"V 1.0": Version.V_10});

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
