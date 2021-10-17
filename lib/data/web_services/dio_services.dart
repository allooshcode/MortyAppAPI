import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:morty_app/shared/constants.dart';

class DioService {
  static late Dio _dio;

  static void initDio() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        receiveTimeout: 20000,
        connectTimeout: 20000);

    _dio = Dio(options);
  }

  Future<Map<String, dynamic>> getCharacters() async {
    try {
      final Response result = await _dio.get(
        characterUrl,
      );

      return result.data;
    } catch (err) {
      // ignore: avoid_print
      print(err.toString());

      throw err.toString();
    }
  }
}
