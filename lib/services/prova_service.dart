import 'package:vcnafacul/entitys/prova/prova.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/repositories/login_repository.dart';
import 'package:vcnafacul/services/dash_card_template_service.dart';
import 'package:vcnafacul/services/urls.dart';

class ProvaService extends DashCardTemplateService<Prova> {
  final LoginRepository loginRepository;
  ProvaService({required super.http, required this.loginRepository});

  @override
  Future<List<Prova>?> getCardsInfo({ StatusEnum? status }) async {
    String? token = await loginRepository.readItem("token");
    final response = await http.get<List<dynamic>>(
        path: Urls.prova, headers: {"Authorization": "Bearer $token"});
    return response.map((item) {
      return Prova.fromJson(item);
    }).toList();
  }
}
