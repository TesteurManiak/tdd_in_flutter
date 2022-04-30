import 'package:dio/dio.dart';

abstract class MyHttpClient {
  Future<T?> get<T>(String url);
}

class DioClientImpl implements MyHttpClient {
  final Dio _dio;

  DioClientImpl({required Dio dio}) : _dio = dio;

  @override
  Future<T?> get<T>(String url) async {
    final response = await _dio.get<T>(url);
    return response.data;
  }
}
