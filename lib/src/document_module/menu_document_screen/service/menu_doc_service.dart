import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../model/get_menu_documents_model.dart';

class MenuDocService {
  Future<Either<String, MenuDocumentsModel>?> getMenuDocRequest(
      String slug) async {
    try {
      String url = '';
      if (isArabic) {
        url = "${ApiConstants.getMenuDocsUrl}/$slug${ApiConstants.arabicKey}";
      } else {
        url = "${ApiConstants.getMenuDocsUrl}/$slug";
      }

      Response? response = await dioApiHelper.get(url, false);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = MenuDocumentsModel.fromJson(jsonResponse);

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
}
