import 'package:flutter/material.dart';
import 'package:vcnafacul/components/molecules/custom_drawer_header.dart';
import 'package:vcnafacul/components/molecules/drawer_item.dart';
import 'package:vcnafacul/core/routes.dart';
import 'package:vcnafacul/entitys/user/auth.dart';

String iconLocaliza = 'assets/icons/home-subjects-historia.svg';
String iconUser = 'assets/icons/home-subjects-quimica.svg';
String iconQuestions = 'assets/icons/home-subjects-gramatica.svg';
String iconNews = 'assets/icons/home-subjects-espanhol.svg';
String iconProva = 'assets/icons/home-subjects-fisica.svg';
String iconContent = 'assets/icons/home-subjects-leitura-prod-textos.svg';
String iconTest = 'assets/icons/home-subjects-matematica.svg';

ListView getListViewDrawer(Auth auth) {
  return ListView(
    children: [
      DrawerHeader(
          child: CustomDrawerHeader(
        user: auth.user,
      )),
      DrawerItem(
          text: 'Validação LC',
          svgString: iconLocaliza,
          disable: auth.permissao['validarCursinho'] == null,
          handleNavigator: (context) {
            Navigator.pop(context);
            Navigator.of(context).pushNamed(Routers.validateLC.name);
          }),
      DrawerItem(
          text: 'Usuários',
          svgString: iconUser,
          disable: auth.permissao['alterarPermissao'] == null,
          handleNavigator: (context) {
            Navigator.pop(context);
            Navigator.of(context).pushNamed(Routers.user.name);
          }),
      DrawerItem(
        text: 'Banco de Questões',
        svgString: iconQuestions,
        disable: auth.permissao['visualizarQuestao'] == null,
        handleNavigator: (context) =>
            Navigator.of(context).pushNamed(Routers.question.name),
      ),
      // DrawerItem(
      //   text: 'Novidades',
      //   svgString: iconNews,
      //   handleNavigator: (context) =>
      //       Navigator.of(context).pushNamed(Routers.validateLC.name),
      // ),
      DrawerItem(
          text: 'Provas',
          svgString: iconProva,
          disable: auth.permissao['visualizarProvas'] == null,
          handleNavigator: (context) {
            Navigator.pop(context);
            Navigator.of(context).pushNamed(Routers.prova.name);
          }),
      // DrawerItem(
      //   text: 'Conteúdos',
      //   svgString: iconContent,
      //   handleNavigator: (context) =>
      //       Navigator.of(context).pushNamed(Routers.validateLC.name),
      // ),
      // DrawerItem(
      //   text: 'Simulado',
      //   svgString: iconTest,
      //   handleNavigator: (context) =>
      //       Navigator.of(context).pushNamed(Routers.validateLC.name),
      // ),
      DrawerItem(
          text: 'Meu Perfil',
          icons: Icons.account_circle_rounded,
          handleNavigator: (context) {
            Navigator.pop(context);
            Navigator.of(context).pushNamed(Routers.profile.name);
          }),
    ],
  );
}
