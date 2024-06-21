// To parse this JSON data, do
//
//     final registerWillModel = registerWillModelFromJson(jsonString);

import 'dart:convert';

RegisterWillModel registerWillModelFromJson(String str) =>
    RegisterWillModel.fromJson(json.decode(str));

String registerWillModelToJson(RegisterWillModel data) =>
    json.encode(data.toJson());

class RegisterWillModel {
  String message;

  RegisterWillModel({
    required this.message,
  });

  factory RegisterWillModel.fromJson(Map<String, dynamic> json) =>
      RegisterWillModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
