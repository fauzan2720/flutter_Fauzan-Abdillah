import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: const Duration(milliseconds: 6000),
        receiveTimeout: const Duration(milliseconds: 6000),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    return await _dio.get(
      path,
      queryParameters: params,
    );
  }

  Future<Response> post(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? params,
  }) async {
    return await _dio.post(
      path,
      data: data,
      queryParameters: params,
    );
  }

  Future<Response> put(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? params,
  }) async {
    return await _dio.put(
      path,
      data: data,
      queryParameters: params,
    );
  }

  Future<Response> delete(String path) async {
    return await _dio.delete(path);
  }
}
