import 'dart:convert';

Map<String, dynamic> jwtDecoded(String jwt) {
  List<String> parts = jwt.split('.');
  String base64Url = parts[1];
  // Adicione os caracteres de preenchimento '=' se necessário
  while (base64Url.length % 4 != 0) {
    base64Url += '=';
  }
  String base64 = base64Url.replaceAll('-', '+').replaceAll('_', '/');
  List<int> decodedBytes = base64Decode(base64);
  String decodedString = utf8.decode(decodedBytes);
  return jsonDecode(decodedString);
}