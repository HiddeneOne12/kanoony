// To parse this JSON data, do
//
//     final resetPasswordModel = resetPasswordModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) =>
    ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) =>
    json.encode(data.toJson());

class ResetPasswordModel {
  User user;
  String token;

  ResetPasswordModel({
    required this.user,
    required this.token,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
        user: User.fromJson(json["user"]),
        token: json["token"].toString(),
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
  String type;
  String emailVerified;
  String numDays;
  String profilePhotoUrl;
  String dummyProfile;
  String campaignCode;
  String signature;
  String status;
  String hasPackage;
  String isPackageOnTrail;
  String packageName;
  String packageDetailEn;
  String packageDetailAr;
  String packageId;
  String packagePrice;
  String remainingDocument;
  String packageExpiry;
  String subscriptionStatus;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.type,
    required this.emailVerified,
    required this.numDays,
    required this.profilePhotoUrl,
    required this.dummyProfile,
    required this.campaignCode,
    required this.signature,
    required this.status,
    required this.hasPackage,
    required this.isPackageOnTrail,
    required this.packageName,
    required this.packageDetailEn,
    required this.packageDetailAr,
    required this.packageId,
    required this.packagePrice,
    required this.remainingDocument,
    required this.packageExpiry,
    required this.subscriptionStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"].toString(),
        name: json["name".toString()],
        email: json["email"].toString(),
        mobile: json["mobile"].toString(),
        type: json["type"].toString(),
        emailVerified: json["emailVerified"].toString(),
        numDays: json["numDays"].toString(),
        profilePhotoUrl: json["profilePhotoUrl"].toString(),
        dummyProfile: json["dummyProfile"].toString(),
        campaignCode: json["campaignCode"].toString(),
        signature: json["signature"].toString(),
        status: json["status"].toString(),
        hasPackage: json["hasPackage"].toString(),
        isPackageOnTrail: json["isPackageOnTrail"].toString(),
        packageName: json["packageName"].toString(),
        packageDetailEn: json["packageDetailEn"].toString(),
        packageDetailAr: json["packageDetailAr"].toString(),
        packageId: json["packageId"].toString(),
        packagePrice: json["packagePrice"].toString(),
        remainingDocument: json["remainingDocument"].toString(),
        packageExpiry: json["packageExpiry"].toString(),
        subscriptionStatus: json["subscriptionStatus"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "type": type,
        "emailVerified": emailVerified,
        "numDays": numDays,
        "profilePhotoUrl": profilePhotoUrl,
        "dummyProfile": dummyProfile,
        "campaignCode": campaignCode,
        "signature": signature,
        "status": status,
        "hasPackage": hasPackage,
        "isPackageOnTrail": isPackageOnTrail,
        "packageName": packageName,
        "packageDetailEn": packageDetailEn,
        "packageDetailAr": packageDetailAr,
        "packageId": packageId,
        "packagePrice": packagePrice,
        "remainingDocument": remainingDocument,
        "packageExpiry": packageExpiry,
        "subscriptionStatus": subscriptionStatus,
      };
}
