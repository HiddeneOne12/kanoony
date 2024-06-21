// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/constants/api_constants/api_constants.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/helpers/logger.dart';
import '../model/home_contents_model.dart';
import '../model/menu_content_model.dart';
import '../model/post_notification_token.dart';
import '../model/quick_link_model.dart';
import '../model/search_home_docs_model.dart';
import '../model/static_content_model.dart';

class DashboardService {
  Future<Either<String, StaticContentModel?>?>
      getAllStaticContentRequest() async {
    try {
      String url = '';
      if (isArabic) {
        url = ApiConstants.getStaticContentUrl + ApiConstants.arabicKey;
      } else {
        url = ApiConstants.getStaticContentUrl;
      }

      Response? response = await dioApiHelper.get(url, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = StaticContentModel.fromJson(jsonResponse);

        return Right(data);
      } else {
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Get In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Server Failure",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }

  Future<Either<String, List<DrawerContentModel>?>?>
      getAllStaticMenuContentRequest() async {
    try {
      String url = '';
      if (isArabic) {
        url = ApiConstants.getMenuContentUrl + ApiConstants.arabicKey;
      } else {
        url = ApiConstants.getMenuContentUrl;
      }

      Response? response = await dioApiHelper.get(url, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);

        var data = (jsonResponse as List)
            .map((e) => DrawerContentModel.fromJson(e))
            .toList();
        return Right(data);
      } else {
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Get In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Server Failure",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }

  Future<Either<String, HomeSearchModel?>?> getHomeSearchRequest(
      String input) async {
    try {
      var url;
      if (input.isNotEmpty) {
        url = '${ApiConstants.getHomeSearchUrl}/$input';
      } else {
        url = '${ApiConstants.getHomeSearchUrl}/';
      }

      Response? response = await dioApiHelper.get(url, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = HomeSearchModel.fromJson(jsonResponse);

        return Right(data);
      } else {
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Get In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Server Failure",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }

  Future<Either<String, HomeContentsModel?>?> getAllHomeContentRequest() async {
    try {
      String url = '';
      if (isArabic) {
        url = ApiConstants.getHomeContentUrl + ApiConstants.arabicKey;
      } else {
        url = ApiConstants.getHomeContentUrl;
      }

      Response? response = await dioApiHelper.get(url, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = HomeContentsModel.fromJson(jsonResponse);

        return Right(data);
      } else {
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Get In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Server Failure",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }

  Future<Either<String, List<QuickLinkModel>>?>
      getDocCategoriesRequest() async {
    try {
      String url = '';
      if (isArabic) {
        url = ApiConstants.getDocumentsCategoriesUrl + ApiConstants.arabicKey;
      } else {
        url = ApiConstants.getDocumentsCategoriesUrl;
      }

      Response? response = await dioApiHelper.get(url, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = (jsonResponse as List)
            .map((e) => QuickLinkModel.fromJson(e))
            .toList();

        return Right(data);
      } else {
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Get In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Server Failure",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }

  Future<Either<String, DeviceTokenModel?>?> postNotificationRequest() async {
    try {
      var url = ApiConstants.postDeviceTokenUrl;
      var body;
      Response? response;
      // FirebaseMessaging.instance.subscribeToTopic("Users");
      await FirebaseMessaging.instance.getToken().then((value) async {
        body = {'device_token': value, 'type': 'mobile'};
        logger.i(body);
        FormData data = FormData.fromMap(body);
        response = await dioApiHelper.post(url, data, true);
        logger.i(response);
      });

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response!.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response!.statusCode == 200) {
        logger.i(jsonResponse);
        var data = DeviceTokenModel.fromJson(jsonResponse);

        return Right(data);
      } else {
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: "Something Went Wrong!",
            backgroundColor: allColors.errorColor);
        dp(msg: "status ", arg: response!.statusCode.toString());
        return left('Request failed with status: ${response!.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Notification Error $e");

      return left('Failed to connect to the server: $e');
    }
  }
}
