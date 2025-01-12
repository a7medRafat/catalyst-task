import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? _dio;

  static void init(
      {String baseUrl = 'https://test.catalystegy.com/public/api/'}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static void _setHeaders() {
    final headers = {
      "Content-Type": "application/json",
    };

    _dio?.options.headers = headers;
  }

  static Future<Response> request({
    required String method,
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    try {
      _setHeaders();

      return await _dio!.request(
        url,
        options: Options(method: method),
        queryParameters: query,
        data: data,
      );
    } on DioException catch (e) {
      debugPrint('DioError: ${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('Unexpected Error: $e');
      rethrow;
    }
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    dynamic date,
  }) async {
    return await request(
      method: 'GET',
      url: url,
      query: query,
      data: date,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await request(
      method: 'POST',
      url: url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    return await request(
      method: 'PUT',
      url: url,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    return await request(
      method: 'DELETE',
      url: url,
      query: query,
      data: data,
    );
  }
}
