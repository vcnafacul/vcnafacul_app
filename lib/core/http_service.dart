import 'package:dio/dio.dart';
import 'package:vcnafacul/core/http.dart';
import 'package:vcnafacul/core/api.dart';

class HttpService extends IHttp {
  HttpService({required super.env}) {
    api = API(env: env);
    dio = Dio(BaseOptions(baseUrl: api.baseUrl, contentType: contentType));
  }

  @override
  Future<T> get<T>(
      {required String path, Map<String, dynamic>? headers}) async {
    try {
      final Response<T> response =
          await dio.get(path, options: Options(headers: headers));
      return response.data as T;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<T> post<T>(
      {required String path,
      required dynamic body,
      Map<String, dynamic>? headers}) async {
    try {
      final Response<T> response =
          await dio.post(path, data: body, options: Options(headers: headers));
      return response.data as T;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<T> patch<T>(
      {required String path,
      required dynamic body,
      Map<String, dynamic>? headers}) async {
    try {
      final Response<T> response =
          await dio.patch(path, data: body, options: Options(headers: headers));
      return response.data as T;
    } on Exception {
      rethrow;
    }
  }
}
