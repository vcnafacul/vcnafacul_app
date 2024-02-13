import 'dart:convert';

import 'package:vcnafacul/core/http.dart';
import 'package:vcnafacul/entitys/user/decoder_user.dart';
import 'package:vcnafacul/repositories/login_repository.dart';
import 'package:vcnafacul/services/urls.dart';

class LoginService {
  final IHttp http;
  final LoginRepository repository;
  LoginService({required this.http, required this.repository});

  Future<void> login({required String email, required String password}) async {
    Map<String, dynamic> jsonData = {
      "email": email,
      "password": password,
    };
    try {
      final result = await http.post<Map<String, dynamic>>(
          path: Urls.login, body: jsonEncode(jsonData));
      await repository.saveAll(decoderUser(result['access_token']!, email));
    } on Exception {
      rethrow;
    }
  }
}
