// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../core/constants/api_constants/api_constants.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';
import '../../../core/helpers/logger.dart';
import '../../../core/routing/routing_config.dart';
import '../../dashboard_screen/dashboard_screen.dart';
import '../model/cancel_subscription_model.dart';
import '../model/subscribe_package_model.dart';

class PackageService {
  Future<Either<String, SubscribePackageModel>?> subscribePackageRequest(
      int id, String email, String name, String token) async {
    try {
      var url = "${ApiConstants.subscribePackageUrl}/$id";

      var body = FormData.fromMap({
        'email': email,
        'card_name': name,
        'token': token,
      });
      logger.i(
          "API BODY :   'email': $email,        'name': $name,             'token': $token,  ");
      Response? response = await dioApiHelper.post(url, body, false);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        RoutesUtils.context.pop();
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = SubscribePackageModel.fromJson(jsonResponse);
        final localStorage = await SharedPreferences.getInstance();
        localStorage.setString("token_key", jsonResponse['token'].toString());
        index = 0;
        RoutesUtils.context.push(DashBoardScreen.dashboardRoute);
        showSnackBarMessage(
            content: jsonResponse['message'].toString(),
            backgroundColor: allColors.successColor,
            contentColor: allColors.canvasColor);
        return Right(data);
      } else {
        RoutesUtils.context.pop();
        dp(msg: "status ", arg: response.statusCode.toString());
        showSnackBarMessage(
            content: jsonResponse['message'].toString(),
            backgroundColor: allColors.errorColor,
            contentColor: allColors.canvasColor);
        return left('Error ');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("POST In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "$e",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }

  Future<Either<String, CancelSubscriptionModel>?>
      cancelSubscribeRequest() async {
    try {
      var url = ApiConstants.cancelSubscriptionUrl;

      Response? response = await dioApiHelper.post(url, {}, true);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        RoutesUtils.context.pop();
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = CancelSubscriptionModel.fromJson(jsonResponse);

        index = 0;
        RoutesUtils.context.push(DashBoardScreen.dashboardRoute);
        showSnackBarMessage(
            content: jsonResponse['message'].toString(),
            backgroundColor: allColors.successColor,
            contentColor: allColors.canvasColor);
        return Right(data);
      } else {
        dp(msg: "status ", arg: response.statusCode.toString());
        showSnackBarMessage(
            content: jsonResponse['error'].toString(),
            backgroundColor: allColors.errorColor,
            contentColor: allColors.canvasColor);
        return left('Error ');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("POST In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "$e",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }
}
