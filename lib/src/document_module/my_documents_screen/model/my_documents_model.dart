// To parse this JSON data, do
//
//     final myDocumentsModel = myDocumentsModelFromJson(jsonString);

import 'dart:convert';

MyDocumentsModel myDocumentsModelFromJson(String str) =>
    MyDocumentsModel.fromJson(json.decode(str));

String myDocumentsModelToJson(MyDocumentsModel data) =>
    json.encode(data.toJson());

class MyDocumentsModel {
  String currentPage;
  List<MyDoc> data;
  String firstPageUrl;
  String from;
  String lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  String perPage;
  String prevPageUrl;
  String to;
  String total;

  MyDocumentsModel({
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

  factory MyDocumentsModel.fromJson(Map<String, dynamic> json) =>
      MyDocumentsModel(
        currentPage: json["current_page"].toString(),
        data: List<MyDoc>.from(json["data"].map((x) => MyDoc.fromJson(x))),
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

class MyDoc {
  String id;
  String documentId;
  String purchasedType;
  String isFinished;
  String editComplete;
  String attachmentType;
  String isReviewed;
  String thankYou;
  String createdAt;
  String updatedAt;
  String pdfFilePath;
  String wordFilePath;
  Documents documents;
  DocumentsLang documentsLang;

  MyDoc({
    required this.id,
    required this.documentId,
    required this.purchasedType,
    required this.isFinished,
    required this.editComplete,
    required this.attachmentType,
    required this.isReviewed,
    required this.thankYou,
    required this.createdAt,
    required this.updatedAt,
    required this.pdfFilePath,
    required this.wordFilePath,
    required this.documents,
    required this.documentsLang,
  });

  factory MyDoc.fromJson(Map<String, dynamic> json) => MyDoc(
        id: json["id"].toString(),
        documentId: json["document_id"].toString(),
        purchasedType: json["purchased_type"].toString(),
        isFinished: json["is_finished"].toString(),
        editComplete: json["edit_complete"].toString(),
        attachmentType: json["attachment_type"].toString(),
        isReviewed: json["is_reviewed"].toString(),
        thankYou: json["thank_you"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        pdfFilePath: json["pdf_file_path"].toString(),
        wordFilePath: json["word_file_path"].toString(),
        documents: Documents.fromJson(json["documents"]),
        documentsLang: DocumentsLang.fromJson(json["documents_lang"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "document_id": documentId,
        "purchased_type": purchasedType,
        "is_finished": isFinished,
        "edit_complete": editComplete,
        "attachment_type": attachmentType,
        "is_reviewed": isReviewed,
        "thank_you": thankYou,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pdf_file_path": pdfFilePath,
        "word_file_path": wordFilePath,
        "documents": documents.toJson(),
        "documents_lang": documentsLang.toJson(),
      };
}

class Documents {
  String id;
  String documentPrice;
  String englishattachment;
  String arabicattachment;
  String combineattacment;

  Documents({
    required this.id,
    required this.documentPrice,
    required this.englishattachment,
    required this.arabicattachment,
    required this.combineattacment,
  });

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
        id: json["id"].toString(),
        documentPrice: json["document_price"].toString(),
        englishattachment: json["englishattachment"].toString(),
        arabicattachment: json["arabicattachment"].toString(),
        combineattacment: json["combineattacment"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "document_price": documentPrice,
        "englishattachment": englishattachment,
        "arabicattachment": arabicattachment,
        "combineattacment": combineattacment,
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
        "version": version,
      };
}

class Link {
  String? url;
  String label;
  String active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"].toString(),
        label: json["label"].toString(),
        active: json["active"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
