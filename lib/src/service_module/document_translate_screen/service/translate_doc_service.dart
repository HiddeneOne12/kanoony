// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/routing/routing_config.dart';
import '../../register_will_module/model/register_will_model.dart';

class TranslateDocService {
  Future<Either<String, RegisterWillModel?>?> posDocTranslateRequest(
      String selectedLanguage,
      String name,
      String email,
      String mobile,
      String notes,
      List<File> filesList) async {
    try {
      var url = ApiConstants.translateDocUrl;
      // Create FormData object
      FormData formData = FormData();
      Map<String, dynamic> map = {
        'target_language': selectedLanguage,
        'name': name,
        'email': email,
        'phone': mobile,
        'notes': notes,
      };

      Iterable<MapEntry<String, String>> iterableMapEntries = map.entries.map(
          (entry) =>
              MapEntry<String, String>(entry.key, entry.value.toString()));

// Now iterableMapEntries is of type Iterable<MapEntry<String, String>>
      formData.fields.addAll(iterableMapEntries);

      // Add files to FormData
      for (int i = 0; i < filesList.length; i++) {
        File file = filesList[i];
        String fileName = file.path.split('/').last;

        // Create MultipartFile
        formData.files.add(MapEntry(
          'attached_files$i',
          await MultipartFile.fromFile(
            file.path,
            filename: fileName,
            contentType: MediaType('application', 'octet-stream'),
          ),
        ));
      }
      logger.i("form Data : $formData");
      Response? response = await dioApiHelper.post(url, formData, false);

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
