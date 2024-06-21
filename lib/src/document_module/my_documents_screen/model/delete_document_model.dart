import 'dart:convert';

DeleteDocModel deleteDocModelFromJson(String str) =>
    DeleteDocModel.fromJson(json.decode(str));

String deleteDocModelToJson(DeleteDocModel data) => json.encode(data.toJson());

class DeleteDocModel {
  String message;

  DeleteDocModel({
    required this.message,
  });

  factory DeleteDocModel.fromJson(Map<String, dynamic> json) => DeleteDocModel(
        message: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "msg": message,
      };
}
