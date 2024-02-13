import 'package:vcnafacul/entitys/user/auth.dart';
import 'package:vcnafacul/entitys/user/user_entity.dart';
import 'package:vcnafacul/enum/gender_enum.dart';
import 'package:vcnafacul/utils/jwt_decoded.dart';

Auth decoderUser(String accessToken, String email) {
  Map<String, dynamic> decoded = jwtDecoded(accessToken);
  DateTime birthday =
      DateTime.parse(decoded['user']['birthday'].replaceAll('Z', ''));
  String monthBirthday =
      birthday.month < 10 ? '0${birthday.month}' : '${birthday.month}';
  String dayBirthday =
      birthday.day < 10 ? '0${birthday.day}' : '${birthday.day}';

  List<String> roles = decoded['roles'].cast<String>();
  Map<String, bool> permissao = {};
  for (String role in roles) {
    permissao[role] = true;
  }

  Auth payload = Auth(
    token: accessToken,
    user: UserEntity(
      id: decoded['user']['id'],
      firstName: decoded['user']['firstName'],
      lastName: decoded['user']['lastName'],
      gender: GenderEnum.values[decoded['user']['gender']],
      birthday: '$dayBirthday/$monthBirthday/${birthday.year}',
      phone: decoded['user']['phone'],
      state: Uri.decodeComponent(decoded['user']['state']),
      city: decoded['user']['city'],
      email: email,
      lgpd: true,
      collaborator: decoded['user']['collaborator'],
      collaboratorDescription: decoded['user']['collaboratorDescription'],
      collaboratorPhoto: decoded['user']['collaboratorPhoto'],
    ),
    permissao: permissao
  );
  return payload;
}
