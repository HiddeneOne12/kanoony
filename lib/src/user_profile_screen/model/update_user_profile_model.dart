// To parse this JSON data, do
//
//     final updateUserProfileModel = updateUserProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateUserProfileModel updateUserProfileModelFromJson(String str) =>
    UpdateUserProfileModel.fromJson(json.decode(str));

String updateUserProfileModelToJson(UpdateUserProfileModel data) =>
    json.encode(data.toJson());

class UpdateUserProfileModel {
  String message;

  UpdateUserProfileModel({
    required this.message,
  });

  factory UpdateUserProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileModel(
        message: json["message"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
