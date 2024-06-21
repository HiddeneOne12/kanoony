// To parse this JSON data, do
//
//     final cancelSubscriptionModel = cancelSubscriptionModelFromJson(jsonString);

import 'dart:convert';

CancelSubscriptionModel cancelSubscriptionModelFromJson(String str) =>
    CancelSubscriptionModel.fromJson(json.decode(str));

String cancelSubscriptionModelToJson(CancelSubscriptionModel data) =>
    json.encode(data.toJson());

class CancelSubscriptionModel {
  String message;

  CancelSubscriptionModel({
    required this.message,
  });

  factory CancelSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      CancelSubscriptionModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
