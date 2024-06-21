// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/document_module/my_documents_screen/my_document_screen.dart';

import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../model/download_free_doc_model.dart';
import '../model/get_free_documents_model.dart';

class FreeDocumentService {
  Future<Either<String, FreeDocumentsUseModel?>?> getFreeDocRequest() async {
    try {
      String url = '';
      if (isArabic) {
        url = ApiConstants.getFreeDocumentsUrl + ApiConstants.arabicKey;
      } else {
        url = ApiConstants.getFreeDocumentsUrl;
      }

      Response? response = await dioApiHelper.get(url, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = FreeDocumentsUseModel.fromJson(jsonResponse);

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

  Future<Either<String, DownloadFreeDocModel>?> downloadFreeDocRequest(
      int id, String email, String name, String type) async {
    try {
      var url = "${ApiConstants.downloadDocUrl}/$id";

      var body = FormData.fromMap({'email': email, 'name': name, 'type': type});
      Response? response = await dioApiHelper.post(url, body, false);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = DownloadFreeDocModel.fromJson(jsonResponse);
        RoutesUtils.context.push(MyDocumentScreen.myDocumentRoute);
        showSnackBarMessage(
            content: jsonResponse['message'].toString(),
            backgroundColor: allColors.successColor,
            contentColor: allColors.canvasColor);
        return Right(data);
      } else {
        dp(msg: "status ", arg: response.statusCode.toString());
        RoutesUtils.context.pop();
        showSnackBarMessage(
            content: jsonResponse['message'].toString(),
            backgroundColor: allColors.errorColor,
            contentColor: allColors.canvasColor);
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("Get In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "$e",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }
}
