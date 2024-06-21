// To parse this JSON data, do
//
//     final quickLinkModel = quickLinkModelFromJson(jsonString);

import 'dart:convert';

List<QuickLinkModel> quickLinkModelFromJson(String str) =>
    List<QuickLinkModel>.from(
        json.decode(str).map((x) => QuickLinkModel.fromJson(x)));

String quickLinkModelToJson(List<QuickLinkModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuickLinkModel {
  String shortTitle;
  String title;
  String slug;
  String icon;
  String banner;

  QuickLinkModel({
    required this.shortTitle,
    required this.title,
    required this.slug,
    required this.icon,
    required this.banner,
  });

  factory QuickLinkModel.fromJson(Map<String, dynamic> json) => QuickLinkModel(
        shortTitle: json["short_title"].toString(),
        title: json["title"].toString(),
        slug: json["slug"].toString(),
        icon: json["icon"].toString(),
        banner: json["banner"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "short_title": shortTitle,
        "title": title,
        "slug": slug,
        "icon": icon,
        "banner": banner,
      };
}
