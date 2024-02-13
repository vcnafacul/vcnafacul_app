import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template_cubit.dart';
import 'package:vcnafacul/core/inject.dart';
import 'package:vcnafacul/entitys/prova/prova.dart';
import 'package:vcnafacul/entitys/question/question.dart';
import 'package:vcnafacul/screens/home/home_screen.dart';
import 'package:vcnafacul/screens/login/login_cubit.dart';
import 'package:vcnafacul/screens/login/login_screen.dart';
import 'package:vcnafacul/screens/profile/profile_screen.dart';
import 'package:vcnafacul/screens/prova/prova_screen.dart';
import 'package:vcnafacul/screens/question_bank/question_bank_screen.dart';
import 'package:vcnafacul/screens/splash/splash_sreen.dart';
import 'package:vcnafacul/screens/user/user_screen.dart';
import 'package:vcnafacul/screens/validate_lc/validate_lc_screen.dart';
import 'package:vcnafacul/services/dash_card_template_service.dart';
import 'package:vcnafacul/entitys/geolocation/geolocation.dart';
import 'package:vcnafacul/entitys/userrole/user_role.dart';

enum Routers {
  splash(name: 'splash'),
  login(name: 'login'),
  home(name: 'home'),
  validateLC(name: 'validateLC'),
  user(name: 'user'),
  prova(name: 'prova'),
  question(name: 'question'),
  profile(name: 'profile');

  const Routers({required this.name});
  final String name;

  static Map<String, Widget Function(BuildContext)> routers = {
    Routers.splash.name: (context) => const SplashSreen(),
    Routers.login.name: (context) => BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(service: getIt()),
        child: const LoginScreen()),
    Routers.home.name: (context) => HomeScreen(
          repository: getIt(),
        ),
    Routers.validateLC.name: (context) =>
        BlocProvider<DashCardTemplateCubit<Geolocation>>(
          create: (context) => DashCardTemplateCubit<Geolocation>(
              service: getIt<DashCardTemplateService<Geolocation>>()),
          child: const ValidateLCScreen(),
        ),
    Routers.user.name: (context) =>
        BlocProvider<DashCardTemplateCubit<UserRole>>(
          create: (context) => DashCardTemplateCubit<UserRole>(
              service: getIt<DashCardTemplateService<UserRole>>()),
          child: const UserScreen(),
        ),
    Routers.prova.name: (context) => BlocProvider<DashCardTemplateCubit<Prova>>(
          create: (context) => DashCardTemplateCubit<Prova>(
              service: getIt<DashCardTemplateService<Prova>>()),
          child: const ProvaScreen(),
        ),
    Routers.question.name: (context) => BlocProvider<DashCardTemplateCubit<Question>>(
          create: (context) => DashCardTemplateCubit<Question>(
              service: getIt<DashCardTemplateService<Question>>()),
          child: const QuestionBankScreen(),
        ),
    Routers.profile.name: (context) => ProfileScreen(
          repository: getIt(),
        )
  };
}
