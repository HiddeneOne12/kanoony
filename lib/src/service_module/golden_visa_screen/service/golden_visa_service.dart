// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/routing/routing_config.dart';
import '../../register_will_module/model/register_will_model.dart';

class GoldenVisaService {
  Future<Either<String, RegisterWillModel?>?> postGoldenVisaRequest(
      String name,
      String email,
      String mobile,
      String note,
      String occupation,
      String category) async {
    try {
      var url = ApiConstants.goldenVisaUrl;

      var body = FormData.fromMap({
        'name': name,
        'email': email,
        'phone': mobile,
        'note': note,
        'occupation': occupation,
        'category': category
      });
      logger.i("form  : $body");
      Response? response = await dioApiHelper.post(url, body, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = RegisterWillModel.fromJson(jsonResponse);

        RoutesUtils.context.pop();

        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: jsonResponse["message"].toString(),
            backgroundColor: allColors.successColor);
        return Right(data);
      } else {
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: jsonResponse["message"].toString(),
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
  }
}
