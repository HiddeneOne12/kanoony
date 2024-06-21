// To parse this JSON data, do
//
//     final deviceTokenModel = deviceTokenModelFromJson(jsonString);

import 'dart:convert';

DeviceTokenModel deviceTokenModelFromJson(String str) => DeviceTokenModel.fromJson(json.decode(str));

String deviceTokenModelToJson(DeviceTokenModel data) => json.encode(data.toJson());

class DeviceTokenModel {
    String message;

    DeviceTokenModel({
        required this.message,
    });

    factory DeviceTokenModel.fromJson(Map<String, dynamic> json) => DeviceTokenModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
