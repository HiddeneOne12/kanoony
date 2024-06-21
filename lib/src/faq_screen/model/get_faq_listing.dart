// To parse this JSON data, do
//
//     final faqsUseModel = faqsUseModelFromJson(jsonString);

import 'dart:convert';

List<FaqsUseModel> faqsUseModelFromJson(String str) => List<FaqsUseModel>.from(
    json.decode(str).map((x) => FaqsUseModel.fromJson(x)));

String faqsUseModelToJson(List<FaqsUseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaqsUseModel {
  String questions;
  String answers;

  FaqsUseModel({
    required this.questions,
    required this.answers,
  });

  factory FaqsUseModel.fromJson(Map<String, dynamic> json) => FaqsUseModel(
        questions: json["questions"],
        answers: json["answers"],
      );

  Map<String, dynamic> toJson() => {
        "questions": questions,
        "answers": answers,
      };
}
