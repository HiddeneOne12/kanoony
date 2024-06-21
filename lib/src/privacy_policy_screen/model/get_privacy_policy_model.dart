// To parse this JSON data, do
//
//     final privacyPolicyModel = privacyPolicyModelFromJson(jsonString);

import 'dart:convert';

PrivacyPolicyModel privacyPolicyModelFromJson(String str) =>
    PrivacyPolicyModel.fromJson(json.decode(str));

String privacyPolicyModelToJson(PrivacyPolicyModel data) =>
    json.encode(data.toJson());

class PrivacyPolicyModel {
  String id;
  String pageId;
  String langId;
  String title;
  String slug;
  String metaTitle;
  String metaDescription;
  dynamic shortDescription;
  String dynamicCanonicalTags;
  String detailsDescription;

  PrivacyPolicyModel({
    required this.id,
    required this.pageId,
    required this.langId,
    required this.title,
    required this.slug,
    required this.metaTitle,
    required this.metaDescription,
    required this.shortDescription,
    required this.dynamicCanonicalTags,
    required this.detailsDescription,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      PrivacyPolicyModel(
        id: json["id"].toString(),
        pageId: json["page_id"].toString(),
        langId: json["lang_id"].toString(),
        title: json["title"].toString(),
        slug: json["slug"].toString(),
        metaTitle: json["metaTitle"].toString(),
        metaDescription: json["metaDescription"].toString(),
        shortDescription: json["shortDescription"].toString(),
        dynamicCanonicalTags: json["dynamic_canonical_tags"].toString(),
        detailsDescription: json["detailsDescription"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "page_id": pageId,
        "lang_id": langId,
        "title": title,
        "slug": slug,
        "metaTitle": metaTitle,
        "metaDescription": metaDescription,
        "shortDescription": shortDescription,
        "dynamic_canonical_tags": dynamicCanonicalTags,
        "detailsDescription": detailsDescription,
      };
}
