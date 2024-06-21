// To parse this JSON data, do
//
//     final downloadDocWithPackageModel = downloadDocWithPackageModelFromJson(jsonString);

import 'dart:convert';

DownloadDocWithPackageModel downloadDocWithPackageModelFromJson(String str) =>
    DownloadDocWithPackageModel.fromJson(json.decode(str));

String downloadDocWithPackageModelToJson(DownloadDocWithPackageModel data) =>
    json.encode(data.toJson());

class DownloadDocWithPackageModel {
  int purchaseId;
  String message;

  DownloadDocWithPackageModel({
    required this.purchaseId,
    required this.message,
  });

  factory DownloadDocWithPackageModel.fromJson(Map<String, dynamic> json) =>
      DownloadDocWithPackageModel(
        purchaseId: json["purchaseId"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "purchaseId": purchaseId,
        "message": message,
      };
}
