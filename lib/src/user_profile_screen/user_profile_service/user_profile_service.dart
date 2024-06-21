// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/constants/api_constants/api_constants.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/dashboard_screen/dashboard_screen.dart';
import 'package:kanoony/src/user_profile_screen/model/get_user_detail_model.dart';
import 'package:kanoony/src/user_profile_screen/model/update_user_profile_model.dart';

class UserProfileService {
  Future<Either<String, UserDetailModel?>?>
      getUserProfileDetailRequest() async {
    try {
      var url = ApiConstants.getUserProfileDetailUrl;

      Response? response = await dioApiHelper.get(url, true);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());
      var data = UserDetailModel.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        logger.i(jsonResponse);

        return Right(data);
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Profile In Error $e");

      return left('Failed to connect to the server: $e');
    }
    return null;
  }

  Future<Either<String, UpdateUserProfileModel?>?> postUpdateUserProfileRequest(
      name, File? image, phone) async {
    try {
      var url = ApiConstants.updateProfileUrl;
      String fileName = '';
      if (image != null) fileName = image.path.split('/').last;
      var body = FormData.fromMap({
        'name': name,
        'mobile': phone,
        'profile_photo': image == null
            ? null
            : await MultipartFile.fromFile(image.path, filename: fileName)
      });

      Response? response = await dioApiHelper.post(url, body, true);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());
      var data = UpdateUserProfileModel.fromJson(jsonResponse);
      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        RoutesUtils.context.pushReplacement(DashBoardScreen.dashboardRoute);
        showSnackBarMessage(
            content: jsonResponse["message"].toString(),
            backgroundColor: allColors.successColor,
            contentColor: allColors.canvasColor);
        return Right(data);
      } else {
        final Map<String, dynamic> errorMap = jsonResponse['error'];
        final List<dynamic> mobileErrors = errorMap['mobile'];
        for (var error in mobileErrors) {
          showSnackBarMessage(
              content: error.toString(),
              backgroundColor: allColors.errorColor,
              contentColor: allColors.canvasColor);
        }

        return left("Failed with status code ${response.statusCode}");
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Profile  Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "server failure",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
    return null;
  }
}
