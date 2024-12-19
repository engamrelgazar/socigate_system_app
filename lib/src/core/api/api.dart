import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:socigate_system/src/core/config/config.dart';
import 'package:socigate_system/src/core/storage/hive_storage.dart';

class Api {
  late Dio _dio;
   String? apiKey;
  Api() {
    String? storedData = HiveStorage.getValue('userBox', 'user_data');
    if (storedData != null) {
      try {
        Map<String, dynamic> userData = jsonDecode(storedData);
        apiKey = userData['api_key'];
      } catch (e) {
        apiKey = null;
      }
    }

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiBaseUrl.apiBaseUrl,
        validateStatus: (status) => true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['api_key'] = apiKey;
          return handler.next(options);
        },
      ),
    );
  }

  Future<Response> getRequest(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteRequest(String endpoint) async {
    try {
      return await _dio.delete(endpoint);
    } catch (e) {
      rethrow;
    }
  }
}
