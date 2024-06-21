// To parse this JSON data, do
//
//     final documentDetailModel = documentDetailModelFromJson(jsonString);

import 'dart:convert';

DocumentDetailModel documentDetailModelFromJson(String str) =>
    DocumentDetailModel.fromJson(json.decode(str));

String documentDetailModelToJson(DocumentDetailModel data) =>
    json.encode(data.toJson());

class DocumentDetailModel {
  DocDetail data;

  DocumentDetailModel({
    required this.data,
  });

  factory DocumentDetailModel.fromJson(Map<String, dynamic> json) =>
      DocumentDetailModel(
        data: DocDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DocDetail {
  String id;
  String langId;
  String documentNo;
  String slug;
  String title;
  String summary;
  String content;
  String region;
  String rating;
  String metaTitle;
  String tags;
  String metaDescription;
  String dynamicCanonicalTags;
  String version;
  String documentStatus;
  String documentPrice;
  String documentCreatedAt;
  String documentUpdatedAt;
  String editComplete;
  String purchasedId;
  List<RelatedDocument> relatedDocuments;
  String englishattachment;
  String arabicattachment;
  String combineattacment;

  DocDetail({
    required this.id,
    required this.langId,
    required this.documentNo,
    required this.slug,
    required this.title,
    required this.summary,
    required this.content,
    required this.region,
    required this.rating,
    required this.metaTitle,
    required this.tags,
    required this.metaDescription,
    required this.dynamicCanonicalTags,
    required this.version,
    required this.documentStatus,
    required this.documentPrice,
    required this.documentCreatedAt,
    required this.documentUpdatedAt,
    required this.editComplete,
    required this.purchasedId,
    required this.relatedDocuments,
    required this.englishattachment,
    required this.arabicattachment,
    required this.combineattacment,
  });

  factory DocDetail.fromJson(Map<String, dynamic> json) => DocDetail(
        id: json["id"].toString(),
        langId: json["lang_id"].toString(),
        documentNo: json["document_no"].toString(),
        slug: json["slug"].toString(),
        title: json["title"].toString(),
        summary: json["summary"].toString(),
        content: json["content"].toString(),
        region: json["region"].toString(),
        rating: json["rating"].toString(),
        metaTitle: json["meta_title"].toString(),
        tags: json["tags"].toString(),
        metaDescription: json["meta_description"].toString(),
        dynamicCanonicalTags: json["dynamic_canonical_tags"].toString(),
        version: json["version"],
        documentStatus: json["document_status"].toString(),
        documentPrice: json["document_price"].toString(),
        documentCreatedAt: json["document_created_at"].toString(),
        documentUpdatedAt: json["document_updated_at"].toString(),
        editComplete: json["edit_complete"].toString(),
        purchasedId: json["purchased_id"].toString(),
        relatedDocuments: List<RelatedDocument>.from(
            json["related_documents"].map((x) => RelatedDocument.fromJson(x))),
        englishattachment: json["englishattachment"].toString(),
        arabicattachment: json["arabicattachment"].toString(),
        combineattacment: json["combineattacment"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lang_id": langId,
        "document_no": documentNo,
        "slug": slug,
        "title": title,
        "summary": summary,
        "content": content,
        "region": region,
        "rating": rating,
        "meta_title": metaTitle,
        "tags": tags,
        "meta_description": metaDescription,
        "dynamic_canonical_tags": dynamicCanonicalTags,
        "version": version,
        "document_status": documentStatus,
        "document_price": documentPrice,
        "document_created_at": documentCreatedAt,
        "document_updated_at": documentUpdatedAt,
        "edit_complete": editComplete,
        "purchased_id": purchasedId,
        "related_documents":
            List<dynamic>.from(relatedDocuments.map((x) => x.toJson())),
        "englishattachment": englishattachment,
        "arabicattachment": arabicattachment,
        "combineattacment": combineattacment,
      };
}

class RelatedDocument {
  String slug;
  String title;

  RelatedDocument({
    required this.slug,
    required this.title,
  });

  factory RelatedDocument.fromJson(Map<String, dynamic> json) =>
      RelatedDocument(
        slug: json["slug"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
      };
}
