import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../core/constants/api_constants/api_constants.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';
import '../../../core/helpers/logger.dart';
import '../model/get_faq_listing.dart';

class FaqService {
  Future<Either<String, List<FaqsUseModel>?>?> getFaqsContentRequest() async {
    try {
      String url = '';
      if (isArabic) {
        url = ApiConstants.getFaqsContentUrl + ApiConstants.arabicKey;
      } else {
        url = ApiConstants.getFaqsContentUrl;
      }

      Response? response = await dioApiHelper.get(url, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = (jsonResponse as List)
            .map((e) => FaqsUseModel.fromJson(e))
            .toList();

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
