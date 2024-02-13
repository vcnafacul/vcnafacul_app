import 'package:dio/dio.dart';
import 'package:vcnafacul/enum/env_num.dart';
import 'package:vcnafacul/core/api.dart';

abstract class IHttp {
  late Dio dio;
  late API api;
  final EnvEnum env;
  final String contentType = "application/json";

  IHttp({required this.env});

  Future<T> get<T>({required String path, Map<String, dynamic>? headers});

  Future<T> post<T>(
      {required String path,
      required String body,
      Map<String, dynamic>? headers});

  Future<T> patch<T>(
      {required String path,
      required String body,
      Map<String, dynamic>? headers});
}
