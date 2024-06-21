// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  User user;
  String token;

  LoginModel({
    required this.user,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  String id;
  String name;
  String email;
  String mobile;
  String emailVerifiedAt;
  String twoFactorConfirmedAt;
  String currentTeamId;
  String profilePhotoPath;
  String googleId;
  String packageId;
  String subscriptionId;
  String numDays;
  String packageStartDate;
  String packageEndDate;
  String quota;
  String availedQuota;
  String signature;
  String status;
  String packageType;
  String createdAt;
  String updatedAt;
  String type;
  String campaignCode;
  String lastLoginAt;
  String profilePhotoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.emailVerifiedAt,
    required this.twoFactorConfirmedAt,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.googleId,
    required this.packageId,
    required this.subscriptionId,
    required this.numDays,
    required this.packageStartDate,
    required this.packageEndDate,
    required this.quota,
    required this.availedQuota,
    required this.signature,
    required this.status,
    required this.packageType,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
    required this.campaignCode,
    required this.lastLoginAt,
    required this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"].toString(),
        name: json["name"].toString(),
        email: json["email"].toString(),
        mobile: json["mobile"].toString(),
        emailVerifiedAt: json["email_verified_at"].toString(),
        twoFactorConfirmedAt: json["two_factor_confirmed_at"].toString(),
        currentTeamId: json["current_team_id"].toString(),
        profilePhotoPath: json["profile_photo_path"].toString(),
        googleId: json["google_id"].toString(),
        packageId: json["package_id"].toString(),
        subscriptionId: json["subscription_id"].toString(),
        numDays: json["num_days"].toString(),
        packageStartDate: json["package_start_date"].toString(),
        packageEndDate: json["package_end_date"].toString(),
        quota: json["quota"].toString(),
        availedQuota: json["availed_quota"].toString(),
        signature: json["signature"].toString(),
        status: json["status"].toString(),
        packageType: json["package_type"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        type: json["type"].toString(),
        campaignCode: json["campaign_code"].toString(),
        lastLoginAt: json["last_login_at"].toString(),
        profilePhotoUrl: json["profile_photo_url"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "email_verified_at": emailVerifiedAt,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "google_id": googleId,
        "package_id": packageId,
        "subscription_id": subscriptionId,
        "num_days": numDays,
        "package_start_date": packageStartDate,
        "package_end_date": packageEndDate,
        "quota": quota,
        "availed_quota": availedQuota,
        "signature": signature,
        "status": status,
        "package_type": packageType,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "type": type,
        "campaign_code": campaignCode,
        "last_login_at": lastLoginAt,
        "profile_photo_url": profilePhotoUrl,
      };
}
