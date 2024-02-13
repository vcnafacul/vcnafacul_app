import 'package:vcnafacul/enum/gender_enum.dart';

class UserUpdate {
  final int id;
  final String firstName;
  final String lastName;
  final GenderEnum gender;
  final String birthday;
  final String phone;
  final String state;
  final String city;
  final String? about;

  UserUpdate(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.birthday,
      required this.phone,
      required this.state,
      required this.city,
      this.about});
}
