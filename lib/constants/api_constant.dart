import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.mocklets.com';
  static const int connectTimeout = 5000; // 5 seconds
  static const int receiveTimeout = 3000; // 3 seconds
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        // connectTimeout: Duration(milliseconds: ApiConstants.connectTimeout),
        // receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
        headers: ApiConstants.defaultHeaders,
      ),
    );

    // Add interceptors if needed
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Log request data
          if (kDebugMode) {
            print('Request: ${options.method} ${options.path}');
            print('Headers: ${options.headers}');
            print('Body: ${options.data}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Log response data
          if (kDebugMode) {
            print('Response: ${response.statusCode} ${response.data}');
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Log error
          if (kDebugMode) {
            print('Error: ${e.response?.statusCode} ${e.message}');
          }
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
