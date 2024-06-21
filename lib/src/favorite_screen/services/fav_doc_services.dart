import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kanoony/src/favorite_screen/model/my_fav_docs_model.dart';

import '../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../core/constants/api_constants/api_constants.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';
import '../../../core/helpers/logger.dart';
import '../model/add_fav_docs_model.dart';

class FavDocService {
  Future<Either<String, MyFovouritesModel>?> getFavDocRequest() async {
    try {
      String url = '';
      if (isArabic) {
        url = ApiConstants.getFavDocUrl + ApiConstants.arabicKey;
      } else {
        url = ApiConstants.getFavDocUrl;
      }

      Response? response = await dioApiHelper.get(url, true);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = MyFovouritesModel.fromJson(jsonResponse);

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

  Future<Either<String, AddFavoriteModel>?> postAddFavDocRequest(docId) async {
    try {
      var url = ApiConstants.postAddFavDocUrl;
      var body = FormData.fromMap({
        'document_id': docId,
      });

      Response? response = await dioApiHelper.post(url, body, true);

      var jsonResponse = response!.data;
      if (response.statusCode == 200) {
        dp(msg: "api response body", arg: response.data.toString());
        dp(msg: "api response", arg: jsonResponse.toString());

        var data = AddFavoriteModel.fromJson(jsonResponse);
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: jsonResponse['message'],
            backgroundColor: allColors.successColor);
        return Right(data);
      } else {
        showSnackBarMessage(
            contentColor: allColors.canvasColor,
            content: jsonResponse['error'],
            backgroundColor: allColors.errorColor);
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
