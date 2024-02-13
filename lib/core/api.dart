import 'package:vcnafacul/enum/env_num.dart';
import 'package:vcnafacul/services/urls.dart';

class API {
  final EnvEnum env;
  Urls? urls;
  API({required this.env, this.urls});

  String get baseUrl {
    switch (env) {
      case EnvEnum.dev:
        return 'http://172.24.32.1:3333/';
      case EnvEnum.hml:
        return 'https://api.homol.vcnafacul.com.br/';
      case EnvEnum.prod:
        return 'https://api.vcnafacul.com.br/';
    }
  }
}
