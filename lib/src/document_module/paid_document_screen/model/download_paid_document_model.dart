// To parse this JSON data, do
//
//     final paidDocModel = paidDocModelFromJson(jsonString);

import 'dart:convert';

DownloadPaidDocModel downloadPaidDocModelFromJson(String str) =>
    DownloadPaidDocModel.fromJson(json.decode(str));

String downloadPaidDocModelToJson(DownloadPaidDocModel data) =>
    json.encode(data.toJson());

class DownloadPaidDocModel {
  String purchaseId;
  User user;
  String token;
  String file;
  String message;

  DownloadPaidDocModel({
    required this.purchaseId,
    required this.user,
    required this.token,
    required this.file,
    required this.message,
  });

  factory DownloadPaidDocModel.fromJson(Map<String, dynamic> json) =>
      DownloadPaidDocModel(
        purchaseId: json["purchaseId"].toString(),
        user: User.fromJson(json["user"]),
        token: json["token"].toString(),
        file: json["file"].toString(),
        message: json["message"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "purchaseId": purchaseId,
        "user": user.toJson(),
        "token": token,
        "file": file,
        "message": message,
      };
}

class User {
  String id;
  String name;
  String email;
  String mobile;
  String emailVerifiedAt;
  String emailOtp;
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
  String webDeviceToken;
  String notificationSent;
  String mobileDeviceToken;
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
    required this.emailOtp,
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
    required this.webDeviceToken,
    required this.notificationSent,
    required this.mobileDeviceToken,
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
        emailOtp: json["email_otp"].toString(),
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
        webDeviceToken: json["web_device_token"].toString(),
        notificationSent: json["notification_sent"].toString(),
        mobileDeviceToken: json["mobile_device_token"].toString(),
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
        "email_otp": emailOtp,
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
        "web_device_token": webDeviceToken,
        "notification_sent": notificationSent,
        "mobile_device_token": mobileDeviceToken,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "type": type,
        "campaign_code": campaignCode,
        "last_login_at": lastLoginAt,
        "profile_photo_url": profilePhotoUrl,
      };
}
