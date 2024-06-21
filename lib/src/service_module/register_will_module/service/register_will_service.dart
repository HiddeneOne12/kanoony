// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/src/service_module/register_will_module/model/register_will_model.dart';
import 'package:kanoony/src/service_module/register_will_module/register_will_screen/register_will_screen.dart';

import '../../../../core/constants/api_constants/api_constants.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/routing/routing_config.dart';

class RegisterWillService {
  Future<Either<String, RegisterWillModel?>?> postRegisterWillRequest(
      String selectedType,
      String name,
      String email,
      String mobile,
      String address,
      String status,
      String children,
      String exName,
      List<String> bNamesList,
      List<int> bPercentageList,
      String numOfB) async {
    try {
      var url = ApiConstants.registerWillUrl;

      var body = FormData.fromMap({
        'type': selectedType,
        'name': name,
        'email': email,
        'phone': mobile,
        'address': address,
        'marital_status': status,
        'minor_children': children,
        'number_of_beneficiaries': numOfB,
        'executor_name': exName,
        'will_registration_type': selectedType,
        'name_of_beneficiary[]': bNamesList,
        'percentage[]': bPercentageList
      });
      logger
          .i("name List : $bNamesList  and percentageList = $bPercentageList");
      Response? response = await dioApiHelper.post(url, body, false);

      var jsonResponse = response!.data;
      dp(msg: "api response body", arg: response.data.toString());
      dp(msg: "api response", arg: jsonResponse.toString());

      if (response.statusCode == 200) {
        logger.i(jsonResponse);
        var data = RegisterWillModel.fromJson(jsonResponse);

        RoutesUtils.context.pushReplacement(RegisterWillScreen.willRoute);

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
