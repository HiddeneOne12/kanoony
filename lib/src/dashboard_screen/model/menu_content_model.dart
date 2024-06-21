// To parse this JSON data, do
//
//     final drawerContentModel = drawerContentModelFromJson(jsonString);

import 'dart:convert';

List<DrawerContentModel> drawerContentModelFromJson(String str) =>
    List<DrawerContentModel>.from(
        json.decode(str).map((x) => DrawerContentModel.fromJson(x)));

String drawerContentModelToJson(List<DrawerContentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DrawerContentModel {
  String menuTitle;
  String? menuSlug;
  List<Category> categories;

  DrawerContentModel({
    required this.menuTitle,
    required this.menuSlug,
    required this.categories,
  });

  factory DrawerContentModel.fromJson(Map<String, dynamic> json) =>
      DrawerContentModel(
        menuTitle: json["menu_title"].toString(),
        menuSlug: json["menu_slug"].toString(),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu_title": menuTitle,
        "menu_slug": menuSlug,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  String categoryName;
  List<Menu> menus;

  Category({
    required this.categoryName,
    required this.menus,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"].toString(),
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
      };
}

class Menu {
  String menuId;
  String menuTitle;
  String? order;
  String menuSlug;
  String linkedDocument;

  Menu({
    required this.menuId,
    required this.menuTitle,
    required this.order,
    required this.menuSlug,
    required this.linkedDocument,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menuId: json["menu_id"].toString(),
        menuTitle: json["menu_title"].toString(),
        order: json["order"].toString(),
        menuSlug: json["menu_slug"].toString(),
        linkedDocument: json["linked_document"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "menu_id": menuId,
        "menu_title": menuTitle,
        "order": order,
        "menu_slug": menuSlug,
        "linked_document": linkedDocument,
      };
}
