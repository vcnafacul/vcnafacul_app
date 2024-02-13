import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/core/routes.dart';
import 'package:vcnafacul/style/colors.dart';

class VcNaFaculApp extends StatelessWidget {
  const VcNaFaculApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: Routers.routers,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              primary: CustomColors.marine,
              seedColor: CustomColors.white,
              background: CustomColors.white),
          useMaterial3: false,
          textTheme: TextTheme(
              titleLarge: GoogleFonts.raleway(color: CustomColors.marine),
              bodyLarge: GoogleFonts.raleway(color: CustomColors.marine))),
      initialRoute: Routers.splash.name,
    );
  }
}
