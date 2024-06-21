// To parse this JSON data, do
//
//     final addFavoriteModel = addFavoriteModelFromJson(jsonString);

import 'dart:convert';

AddFavoriteModel addFavoriteModelFromJson(String str) => AddFavoriteModel.fromJson(json.decode(str));

String addFavoriteModelToJson(AddFavoriteModel data) => json.encode(data.toJson());

class AddFavoriteModel {
    String message;

    AddFavoriteModel({
        required this.message,
    });

    factory AddFavoriteModel.fromJson(Map<String, dynamic> json) => AddFavoriteModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
