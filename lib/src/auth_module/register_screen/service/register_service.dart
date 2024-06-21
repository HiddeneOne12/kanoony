// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/src/dashboard_screen/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/routing/routing_config.dart';
import '../../../document_module/document_details_screen/document_details_screen.dart';
import '../model/register_model.dart';

class RegisterService {
  Future<Either<String, RegisterModel?>?> postRegisterRequest(
      email, name, number, password, confirmPassword) async {
    try {
      var url = ApiConstants.registerUrl;
      var body = FormData.fromMap({
        'email': email,
        'name': name,
        'mobile': number,
        'password': password,
        'password_confirmation': confirmPassword
      });

      Response? response = await dioApiHelper.post(url, body, true);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());
      var data = RegisterModel.fromJson(jsonResponse);
      if (response.statusCode == 201) {
        logger.i(jsonResponse);
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
            content: translation.registeredSuccess,
            backgroundColor: allColors.successColor);
        return Right(data);
      } else if (response.statusCode == 422) {
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: translation.userExists,
            backgroundColor: allColors.errorColor);
        dp(msg: "status ", arg: response.statusCode.toString());
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Register In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "Server Failure",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
    return null;
  }
}
