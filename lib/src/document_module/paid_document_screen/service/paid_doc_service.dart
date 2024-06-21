// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/document_module/my_documents_screen/my_document_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../model/download_paid_document_model.dart';
import '../model/download_with_package_model.dart';
import '../model/get_paid_doc_model.dart';

class PaidDocService {
  Future<Either<String, PaidDocModel>?> getPaidDocRequest(String slug) async {
    try {
      String url = '';
      if (isArabic) {
        url =
            "${ApiConstants.getPaidDocumentsUrl}/$slug${ApiConstants.arabicKey}";
      } else {
        url = "${ApiConstants.getPaidDocumentsUrl}/$slug";
      }

      Response? response = await dioApiHelper.get(url, false);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = PaidDocModel.fromJson(jsonResponse);

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

  Future<Either<String, DownloadDocWithPackageModel>?>
      downloadPaidDocByPackageRequest(
    int id,
    String type,
  ) async {
    try {
      var url = "${ApiConstants.downloadDocWithPackageUrl}/$id";

      var body = FormData.fromMap({
        'edit_online': 'no',
        'type': type,
      });
      logger.i("API BODY :    'type': $type,  ");
      Response? response = await dioApiHelper.post(url, body, true);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        RoutesUtils.context.pop();
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = DownloadDocWithPackageModel.fromJson(jsonResponse);

        index = 0;
        RoutesUtils.context.push(MyDocumentScreen.myDocumentRoute);
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

  Future<Either<String, DownloadPaidDocModel>?> downloadPaidDocRequest(int id,
      String email, String name, String type, String token, String code) async {
    try {
      var url = "${ApiConstants.downloadDocUrl}/$id";

      var body = FormData.fromMap({
        'email': email,
        'name': name,
        'type': type,
        'token': token,
        if (code.isNotEmpty) 'promo_code': code
      });
      logger.i(
          "API BODY :   'email': $email,        'name': $name,       'type': $type,       'token': $token,        if (code.isNotEmpty) 'promo_code': $code $id ");
      Response? response = await dioApiHelper.post(url, body, false);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        RoutesUtils.context.pop();
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = DownloadPaidDocModel.fromJson(jsonResponse);
        final localStorage = await SharedPreferences.getInstance();
        localStorage.setString("token_key", jsonResponse['token'].toString());
        index = 0;
        RoutesUtils.context.push(MyDocumentScreen.myDocumentRoute);
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
}
