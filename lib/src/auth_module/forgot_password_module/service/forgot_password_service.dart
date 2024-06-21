// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/email_verification_screen/email_verification_screen.dart';
import 'package:kanoony/src/auth_module/forgot_password_module/reset_password_screen/reset_password_screen.dart';
import 'package:kanoony/src/dashboard_screen/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/routing/routing_config.dart';
import '../model/forgot_password_model.dart';
import '../model/reset_password_model.dart';
import '../reset_password_screen/layout/widgets/reset_password_popup.dart';

class ForgotPasswordService {
  Future<Either<String, ForgotPasswordModel?>?> postForgotRequest(email) async {
    try {
      var url = ApiConstants.forgotPasswordUrl;
      var body = FormData.fromMap({'email': email});

      Response? response = await dioApiHelper.post(url, body, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = ForgotPasswordModel.fromJson(jsonResponse);
        RoutesUtils.context.go(
          EmailVerificationScreen.emailVerificationRoute,
          extra: {TextUtils.email: email.toString()},
        );

        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: jsonResponse['message'].toString(),
            backgroundColor: allColors.successColor);
        return Right(data);
      } else {
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: jsonResponse['message'].toString(),
            backgroundColor: allColors.errorColor);
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Password In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Check Internet Connection!",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }

  Future<Either<String, ForgotPasswordModel?>?> postVerifyRequest(
      email, otp) async {
    try {
      var url = ApiConstants.verifyOtpUrl;
      var body = FormData.fromMap({'email': email, 'code': otp});

      Response? response = await dioApiHelper.post(url, body, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = ForgotPasswordModel.fromJson(jsonResponse);

        RoutesUtils.context.go(
          ResetPasswordScreen.resetPasswordPasswordRoute,
          extra: {TextUtils.email: email.toString()},
        );

        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: jsonResponse['message'].toString(),
            backgroundColor: allColors.successColor);
        return Right(data);
      } else {
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: jsonResponse['message'].toString(),
            backgroundColor: allColors.errorColor);
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Password In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Check Internet Connection!",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }

  Future<Either<String, ResetPasswordModel?>?> postResetPasswordRequest(
      email, password, confirmPassword) async {
    try {
      var url = ApiConstants.resetPasswordUrl;
      var body = FormData.fromMap({
        'email': email,
        'password': password,
        'password_confirmation': password
      });

      Response? response = await dioApiHelper.post(url, body, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = ResetPasswordModel.fromJson(jsonResponse);
        final localStorage = await SharedPreferences.getInstance();
        localStorage.setString("login_value", "loginSuccessfully");
        RoutesUtils.context.go(DashBoardScreen.dashboardRoute);

        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: translation.loginSuccess,
            backgroundColor: allColors.successColor);
        await responsePopUp(RoutesUtils.context);
        return Right(data);
      } else {
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: 'Failed to reset!',
            backgroundColor: allColors.errorColor);
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Password In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Check Internet Connection!",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }
}
