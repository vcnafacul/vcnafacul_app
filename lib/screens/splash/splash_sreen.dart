import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:vcnafacul/components/atoms/logo.dart';
import 'package:vcnafacul/core/routes.dart';
import 'package:vcnafacul/screens/login/login_screen.dart';

class SplashSreen extends StatelessWidget {
  const SplashSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const SizedBox(
          child: Logo(
        size: 10,
      )),
      nextRoute: Routers.login.name,
      nextScreen: const LoginScreen(),
      animationDuration: Durations.extralong4,
    );
  }
}
