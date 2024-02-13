import 'package:flutter/material.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/types/card_dash/card_cash.dart';
import 'package:vcnafacul/entitys/userrole/user_role.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserScreenState createState() => _UserScreenState();
}

CardDashType convert<T extends UserRole>(T auth) {
  InfoCard infoEmail = InfoCard(field: 'Email', value: auth.user.email);
  InfoCard infoPhone = InfoCard(field: 'Telefone', value: auth.user.phone);
  InfoCard infoRole = InfoCard(field: 'Permissão', value: auth.roleName);

  return CardDashType(
      id: auth.user.id,
      title: auth.user.firstName,
      status: StatusEnum.approved,
      infos: [infoEmail, infoPhone, infoRole]);
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return DashCardTemplate<UserRole>(title: 'Usuários', convert: convert);
  }
}
