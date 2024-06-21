// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/trademark_screen.dart';

import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/routing/routing_config.dart';
import '../model/register_trademark_model.dart';

class TrademarkService {
  Future<Either<String, RegisterTradeMarkModel?>?> postRegisterTradeMarkRequest(
      String selectedType,
      File? attachment,
      String name,
      String email,
      String mobile,
      String message,
      String trademarkName,
      String country,
      String prodOrSer,
      String trademarkType,
      String owner) async {
    try {
      var url = ApiConstants.registerTrademarkUrl;
      String fileName = '';
      if (attachment != null) fileName = attachment.path.split('/').last;
      var body = FormData.fromMap({
        'type': selectedType,
        'name': name,
        'email': email,
        'mobile': mobile,
        'trademark_owner': owner,
        'trademark_name': trademarkName,
        'message': message,
        'country': country,
        'product_or_service': prodOrSer,
        'trademark_type': trademarkType,
        'attach_file': attachment == null
            ? null
            : await MultipartFile.fromFile(attachment.path, filename: fileName)
      });

      Response? response = await dioApiHelper.post(url, body, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = RegisterTradeMarkModel.fromJson(jsonResponse);

        RoutesUtils.context.pushReplacement(TradeMarkScreen.trademarkRoute);

        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: jsonResponse["message"].toString(),
            backgroundColor: allColors.successColor);
        return Right(data);
      } else if (response.statusCode == 401) {
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
    return null;
  }
}
