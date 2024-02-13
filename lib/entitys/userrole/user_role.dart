import 'package:vcnafacul/entitys/user/user_entity.dart';
import 'package:vcnafacul/enum/gender_enum.dart';
import 'package:vcnafacul/types/card_dash/base_entity_card.dart';

class UserRole extends BaseEntityCard {
  final UserEntity user;
  final int roleId;
  final String roleName;

  UserRole(
      {required super.id,
      required this.user,
      required this.roleId,
      required this.roleName});

  factory UserRole.fromJson(Map<String, dynamic> json) {
    UserEntity user = UserEntity(
        id: json['user']['id'] as int,
        firstName: json['user']['firstName'] as String,
        lastName: json['user']['lastName'] as String,
        gender: GenderEnum.values[json['user']['gender']],
        birthday: json['user']['birthday'] as String,
        phone: json['user']['phone'] as String,
        state: json['user']['state'] as String,
        city: json['user']['city'] as String,
        email: json['user']['email'] as String,
        lgpd: json['user']['lgpd'] as bool,
        collaborator: json['user']['collaborator'] as bool);
    return UserRole(
        id: user.id.toString(),
        user: user,
        roleId: json['roleId'] as int,
        roleName: json['roleName'] as String);
  }
}
