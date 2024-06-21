import 'dart:convert';

import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../src/user_profile_screen/model/get_user_detail_model.dart';

class UserProfileHelper {
  String empty = '{}';
  UserDetailModel userData = UserDetailModel(
      id: '',
      name: '',
      email: '',
      mobile: '',
      emailVerified: '',
      dummyProfile: '',
      packageDetailAr: '',
      remainingDocument: '',
      packageDetailEn: '',
      subscriptionStatus: '',
      packageExpiry: '',
      packageName: '',
      packagePrice: '',
      hasPackage: '',
      isPackageOnTrail: '',
      packageId: '',
      numDays: '',
      signature: '',
      status: '',
      type: '',
      campaignCode: '',
      profilePhotoUrl: '');
  void saveUserData(UserDetailModel userData) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('userData', jsonEncode(userData));
  }

  Future<UserDetailModel> getUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = localStorage.getString('userData') ?? empty;
    Map<String, dynamic> map = jsonDecode(data.toString());
    logger.i("User Parsed Fetched : ${userData.id}");
    if (map.isNotEmpty) {
      userData = UserDetailModel(
        id: map["id"].toString(),
        name: map["name"].toString(),
        email: map["email"].toString(),
        mobile: map["mobile"].toString(),
        type: map["type"].toString(),
        emailVerified: map["emailVerified"].toString(),
        numDays: map["numDays"].toString(),
        profilePhotoUrl: map["profilePhotoUrl"].toString(),
        dummyProfile: map["dummyProfile"].toString(),
        campaignCode: map["campaignCode"].toString(),
        signature: map["signature"].toString(),
        status: map["status"].toString(),
        hasPackage: map["hasPackage"].toString(),
        isPackageOnTrail: map["isPackageOnTrail"].toString(),
        packageName: map["packageName"].toString(),
        packageDetailEn: map["packageDetailEn"].toString(),
        packageDetailAr: map["packageDetailAr"].toString(),
        packageId: map["packageId"].toString(),
        packagePrice: map["packagePrice"].toString(),
        remainingDocument: map["remainingDocument"].toString(),
        packageExpiry: map["packageExpiry"].toString(),
        subscriptionStatus: map["subscriptionStatus"].toString(),
      );
      logger.i("User Parsed With Success : ${userData.profilePhotoUrl}");
    }

    return userData;
  }
}
