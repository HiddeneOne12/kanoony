import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kanoony/src/document_module/my_documents_screen/model/delete_document_model.dart';

import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../model/my_documents_model.dart';

class MyDocService {
  Future<Either<String, MyDocumentsModel>?> getMyDocRequest() async {
    try {
      String url = '';
      if (isArabic) {
        url = ApiConstants.getMyDocUrl + ApiConstants.arabicKey;
      } else {
        url = ApiConstants.getMyDocUrl;
      }

      Response? response = await dioApiHelper.get(url, true);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = MyDocumentsModel.fromJson(jsonResponse);

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

  Future<Either<String, DeleteDocModel>?> deleteMyDocRequest(int id) async {
    try {
      String base64 = base64Encode(utf8.encode(id.toString()));
      String url = '${ApiConstants.deleteMyDocUrl}/$base64';

      Response? response = await dioApiHelper.delete(url, true);

      var jsonResponse = response!.data;

      if (response.statusCode == 200) {
        var data = DeleteDocModel.fromJson(jsonResponse);
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        showSnackBarMessage(
            content: jsonResponse['msg'].toString(),
            backgroundColor: allColors.successColor,
            contentColor: allColors.canvasColor);
        return Right(data);
      } else {
        dp(msg: "status ", arg: response.statusCode.toString());
        showSnackBarMessage(
            content: jsonResponse['error'].toString(),
            backgroundColor: allColors.errorColor,
            contentColor: allColors.canvasColor);
        return left('Request failed with status: ${response.statusCode}');
      }
    } catch (e, s) {
      dp(msg: "Error", arg: s);
      logger.e("DELETE In Error $e");
      showSnackBarMessage(
          contentColor: allColors.canvasColor,
          content: "$e",
          backgroundColor: allColors.errorColor);
      return left('Failed to connect to the server: $e');
    }
  }
}
