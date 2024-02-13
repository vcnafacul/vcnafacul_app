import 'dart:convert';

import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/repositories/login_repository.dart';
import 'package:vcnafacul/services/dash_card_template_service.dart';
import 'package:vcnafacul/services/urls.dart';
import 'package:vcnafacul/entitys/geolocation/geolocation.dart';

class ValidateLCService extends DashCardTemplateService<Geolocation> {
  final LoginRepository loginRepository;
  ValidateLCService({required super.http, required this.loginRepository});

  @override
  Future<List<Geolocation>> getCardsInfo({ StatusEnum? status }) async {
    int statusNumber = status!.index;
    String path = '${Urls.geolocation}?offset=0&limit=40&status=$statusNumber';
    final response = await http.get<List<dynamic>>(path: path);
    return response.map((item) {
      return Geolocation.fromJson(item);
    }).toList();
  }

  Future<void> changeStatus({ required StatusEnum status, required int id, String? reason}) async {
    String? token = await loginRepository.readItem("token");
    Map<String, dynamic> jsonData = {
      "geoId": id,
      "status": status.index,
      "refuseReason": reason
    };
    await http.patch(
        path: Urls.geolocation,
        body: jsonEncode(jsonData),
        headers: {"Authorization": "Bearer $token"});
  }
}
