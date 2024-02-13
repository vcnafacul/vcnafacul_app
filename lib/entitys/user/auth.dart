import 'dart:convert';

import 'package:vcnafacul/entitys/user/user_entity.dart';
import 'package:vcnafacul/storage/secure_data.dart';

class Auth extends SecureData {
  static const String _keyuser = 'user';
  static const String _keyToken = 'token';
  static const String _keyPermission = 'permission';
  
  late UserEntity user;
  late String token;
  late Map<String, bool> permissao;

  Auth({required this.user, required this.token, required this.permissao});

  @override
  Auth.fromRead(Map<String, String> items) 
     : token = items[_keyToken] ?? '',
        user = UserEntity.fromString(items[_keyuser]),
        permissao = Map<String, bool>.from(
          (items[_keyPermission] ?? '{}').isEmpty
              ? {}
              : jsonDecode(items[_keyPermission]!),
        );
  
  @override
  Map<String, String> toWrite() {
    return {
      // ignore: unnecessary_null_comparison
      _keyuser: user != null ? jsonEncode(user.toJson()) : '',
      _keyToken: token,
      _keyPermission: jsonEncode(permissao),
    };
  }
}
