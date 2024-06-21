// To parse this JSON data, do
//
//     final googleLoginModel = googleLoginModelFromJson(jsonString);

import 'dart:convert';

GoogleLoginModel googleLoginModelFromJson(String str) =>
    GoogleLoginModel.fromJson(json.decode(str));

String googleLoginModelToJson(GoogleLoginModel data) =>
    json.encode(data.toJson());

class GoogleLoginModel {
  String token;
  GoogleUser user;

  GoogleLoginModel({
    required this.token,
    required this.user,
  });

  factory GoogleLoginModel.fromJson(Map<String, dynamic> json) =>
      GoogleLoginModel(
        token: json["token"],
        user: GoogleUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class GoogleUser {
  String email;
  String name;
  String googleId;
  String updatedAt;
  String createdAt;
  String id;
  String profilePhotoUrl;

  GoogleUser({
    required this.email,
    required this.name,
    required this.googleId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.profilePhotoUrl,
  });

  factory GoogleUser.fromJson(Map<String, dynamic> json) => GoogleUser(
        email: json["email"].toString(),
        name: json["name"].toString(),
        googleId: json["google_id"].toString(),
        updatedAt: json["updated_at"].toString(),
        createdAt: json["created_at"].toString(),
        id: json["id"].toString(),
        profilePhotoUrl: json["profile_photo_url"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "google_id": googleId,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
        "profile_photo_url": profilePhotoUrl,
      };
}
