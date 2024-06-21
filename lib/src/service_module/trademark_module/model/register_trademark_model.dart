// To parse this JSON data, do
//
//     final registerTradeMarkModel = registerTradeMarkModelFromJson(jsonString);

import 'dart:convert';

RegisterTradeMarkModel registerTradeMarkModelFromJson(String str) =>
    RegisterTradeMarkModel.fromJson(json.decode(str));

String registerTradeMarkModelToJson(RegisterTradeMarkModel data) =>
    json.encode(data.toJson());

class RegisterTradeMarkModel {
  String message;

  RegisterTradeMarkModel({
    required this.message,
  });

  factory RegisterTradeMarkModel.fromJson(Map<String, dynamic> json) =>
      RegisterTradeMarkModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
