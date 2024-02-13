import 'package:get_it/get_it.dart';
import 'package:vcnafacul/core/api.dart';
import 'package:vcnafacul/core/http.dart';
import 'package:vcnafacul/core/http_service.dart';
import 'package:vcnafacul/entitys/prova/prova.dart';
import 'package:vcnafacul/entitys/question/question.dart';
import 'package:vcnafacul/enum/env_num.dart';
import 'package:vcnafacul/repositories/login_repository.dart';
import 'package:vcnafacul/services/dash_card_template_service.dart';
import 'package:vcnafacul/services/login_service.dart';
import 'package:vcnafacul/services/prova_service.dart';
import 'package:vcnafacul/services/question_serice.dart';
import 'package:vcnafacul/services/user_service.dart';
import 'package:vcnafacul/services/validate_lc_service.dart';
import 'package:vcnafacul/entitys/geolocation/geolocation.dart';
import 'package:vcnafacul/entitys/userrole/user_role.dart';

var getIt = GetIt.I;

void confifDependencies(EnvEnum env) {
  getIt.registerSingleton<API>(API(env: env));
  getIt.registerSingleton<IHttp>(HttpService(env: env));

  getIt.registerSingleton<LoginRepository>(LoginRepository());

  getIt.registerSingleton<LoginService>(
      LoginService(http: getIt(), repository: getIt()));

  getIt.registerSingleton<DashCardTemplateService<Geolocation>>(
      ValidateLCService(http: getIt(), loginRepository: getIt()));

  getIt.registerSingleton<DashCardTemplateService<UserRole>>(
      UserService(http: getIt(), loginRepository: getIt()));

  getIt.registerSingleton<DashCardTemplateService<Prova>>(
      ProvaService(http: getIt(), loginRepository: getIt()));

  getIt.registerSingleton<DashCardTemplateService<Question>>(
      QuestionService(http: getIt(), loginRepository: getIt()));
}
