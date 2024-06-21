// To parse this JSON data, do
//
//     final forgotPaasswordModel = forgotPaasswordModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) =>
    ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) =>
    json.encode(data.toJson());

class ForgotPasswordModel {
  String status;
  String message;

  ForgotPasswordModel({
    required this.status,
    required this.message,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        status: json["status"].toString(),
        message: json["message"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
