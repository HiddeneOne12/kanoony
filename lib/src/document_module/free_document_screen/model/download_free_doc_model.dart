// To parse this JSON data, do
//
//     final downloadFreeDocModel = downloadFreeDocModelFromJson(jsonString);

import 'dart:convert';

DownloadFreeDocModel downloadFreeDocModelFromJson(String str) =>
    DownloadFreeDocModel.fromJson(json.decode(str));

String downloadFreeDocModelToJson(DownloadFreeDocModel data) =>
    json.encode(data.toJson());

class DownloadFreeDocModel {
  String message;

  DownloadFreeDocModel({
    required this.message,
  });

  factory DownloadFreeDocModel.fromJson(Map<String, dynamic> json) =>
      DownloadFreeDocModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
