

import 'package:dio/dio.dart';
import 'dart:ui' as ui;

import 'package:e_commerce_app/shared/component/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://162.240.24.203/~tohome/system/api/",
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static String sysLng = ui.window.locale.languageCode;

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    print(DioHelper.sysLng);
    dio.options.headers = {
      'lang': sysLng,
      'Content-Type': 'application/json',
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': sysLng,
      'Authorization': 'Bearer $userToken',
      'Accept': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
