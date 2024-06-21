// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/constants/api_constants/api_constants.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/dashboard_screen/dashboard_screen.dart';
import 'package:kanoony/src/auth_module/login_screen/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../document_module/document_details_screen/document_details_screen.dart';
import '../model/google_login_model.dart';

class LoginService {
  Future<Either<String, LoginModel?>?> postLoginRequest(email, password) async {
    try {
      var url = ApiConstants.loginUrl;
      var body = FormData.fromMap({'email': email, 'password': password});

      Response? response = await dioApiHelper.post(url, body, true);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = LoginModel.fromJson(jsonResponse);
        final localStorage = await SharedPreferences.getInstance();
        localStorage.setString("login_value", "loginSuccessfully");
        var slug = localStorage.getString("doc_detail");
        if (slug != null) {
          RoutesUtils.context.go(
            DocumentDetailScreen.documentDetailRoute,
            extra: {TextUtils.slug: slug.toString()},
          );
        } else {
          RoutesUtils.context.pushReplacement(DashBoardScreen.dashboardRoute);
        }
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: translation.loginSuccess,
            backgroundColor: allColors.successColor);
        return Right(data);
      } else if (response.statusCode == 401) {
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: translation.invalidCred,
            backgroundColor: allColors.errorColor);
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Login In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Check Internet Connection!",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
    return null;
  }

  Future<Either<String, GoogleLoginModel?>?> postGoogleLoginRequest(
      email, name, googleId) async {
    try {
      var url = ApiConstants.googleLoginUrl;
      var body = FormData.fromMap(
          {'email': email, 'name': name, 'login_token': googleId});

      Response? response = await dioApiHelper.post(url, body, true);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 201) {
        logger.i(jsonResponse);
        var data = GoogleLoginModel.fromJson(jsonResponse);
        final localStorage = await SharedPreferences.getInstance();
        localStorage.setString("login_value", "loginSuccessfully");
        localStorage.setString("is_google", "true");
        var slug = localStorage.getString("doc_detail");
        if (slug != null) {
          RoutesUtils.context.go(
            DocumentDetailScreen.documentDetailRoute,
            extra: {TextUtils.slug: slug.toString()},
          );
        } else {
          RoutesUtils.context.pushReplacement(DashBoardScreen.dashboardRoute);
        }

        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: translation.loginSuccess,
            backgroundColor: allColors.successColor);
        return Right(data);
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Google Login In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Server Failure",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
    return null;
  }
}
