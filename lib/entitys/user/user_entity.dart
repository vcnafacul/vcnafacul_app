import 'dart:convert';
import 'package:vcnafacul/entitys/user/user_update.dart';
import 'package:vcnafacul/enum/gender_enum.dart';

class UserEntity extends UserUpdate {
  final String email;
  final bool lgpd;
  final bool collaborator;
  final String? collaboratorDescription;
  final String? collaboratorPhoto;

  UserEntity({
    required int id,
    required String firstName,
    required String lastName,
    required GenderEnum gender,
    required String birthday,
    required String phone,
    required String state,
    required String city,
    String? about,
    required this.email,
    required this.lgpd,
    required this.collaborator,
    this.collaboratorDescription,
    this.collaboratorPhoto,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          birthday: birthday,
          phone: phone,
          state: state,
          city: city,
          about: about,
        );

  factory UserEntity.fromString(String? jsonString) {
    // ignore: cast_from_null_always_fails
    if (jsonString == null) return null as UserEntity;
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return UserEntity(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: GenderEnum.values[json['gender']],
      birthday: json['birthday'],
      phone: json['phone'],
      state: json['state'],
      city: json['city'],
      about: json['about'],
      email: json['email'],
      lgpd: json['lgpd'],
      collaborator: json['collaborator'],
      collaboratorDescription: json['collaboratorDescription'],
      collaboratorPhoto: json['collaboratorPhoto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender.index,
      'birthday': birthday,
      'phone': phone,
      'state': state,
      'city': city,
      'about': about,
      'email': email,
      'lgpd': lgpd,
      'collaborator': collaborator,
      'collaboratorDescription': collaboratorDescription,
      'collaboratorPhoto': collaboratorPhoto,
    };
  }
}
