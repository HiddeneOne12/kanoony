// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_exceptions.dart';
import 'logger.dart';

class DioApiHelper {
  Dio dio = Dio();

  Future<Response?> get(String url, bool isToken) async {
    final localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString("token_key").toString();

    var headers = {
      'Accept': 'application/json',
      'api-key': apiHeaderKey,
      if (isToken) 'Authorization': 'Bearer $token',
    };
    try {
      final Response response =
          await dio.get(url, options: Options(headers: headers));
      dp(msg: "get response", arg: response.data.toString());
      if (response.statusCode == 200) {
        dp(msg: "response", arg: response.data.toString());
        return response;
      }
      return response;
    } on SocketException catch (e) {
      dp(msg: "No Internet Connection", arg: e.toString());
      throw FetchDataException('No Internet connection');
    } catch (e) {
      dp(msg: "catch ", arg: e.toString());
      rethrow;
    }
  }

  Future<Response?> delete(String url, bool isToken) async {
    final localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString("token_key").toString();

    var headers = {
      'Accept': 'application/json',
      'api-key': apiHeaderKey,
      if (isToken) 'Authorization': 'Bearer $token',
    };
    try {
      final Response response =
          await dio.delete(url, options: Options(headers: headers));
      dp(msg: "get response", arg: response.data.toString());

      if (response.statusCode == 200) {
        dp(msg: "response", arg: response.data.toString());
        return response;
      }
      return response;
    } on DioError catch (e) {
      dp(msg: "$e", arg: e.toString());
      return e.response;
    } catch (e) {
      dp(msg: "catch ", arg: e.toString());
      rethrow;
    }
  }

  Future<Response?> post(String url, Object? body, bool isToken) async {
    final localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString("token_key").toString();
    var headers = {
      'Accept': 'application/json',
      'api-key': apiHeaderKey,
      'Authorization': 'Bearer $token',
    };
    try {
      final Response response =
          await dio.post(url, data: body, options: Options(headers: headers));
      dp(msg: "get response", arg: response.data.toString());

      if (response.statusCode == 200) {
        dp(msg: "response", arg: response.data.toString());
        return response;
      }
      return response;
    } on DioError catch (e) {
      dp(msg: "$e", arg: e.toString());
      return e.response;
    } catch (e) {
      dp(msg: "catch ", arg: e.toString());
      rethrow;
    }
  }
}
