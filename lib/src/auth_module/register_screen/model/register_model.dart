// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  User user;
  String token;

  RegisterModel({
    required this.user,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        user: User.fromJson(json["user"] ?? {} ) ,
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  String name;
  String email;
  String mobile;
  String updatedAt;
  String createdAt;
  String id;
  String profilePhotoUrl;

  User({
    required this.name,
    required this.email,
    required this.mobile,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"].toString(),
        email: json["email"].toString(),
        mobile: json["mobile"].toString(),
        updatedAt: json["updated_at"].toString(),
        createdAt: json["created_at"].toString(),
        id: json["id"].toString(),
        profilePhotoUrl: json["profile_photo_url"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
        "profile_photo_url": profilePhotoUrl,
      };
}
