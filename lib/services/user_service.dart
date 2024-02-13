import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/repositories/login_repository.dart';
import 'package:vcnafacul/services/dash_card_template_service.dart';
import 'package:vcnafacul/services/urls.dart';
import 'package:vcnafacul/entitys/userrole/user_role.dart';

class UserService extends DashCardTemplateService<UserRole> {
  final LoginRepository loginRepository;
  UserService({required super.http, required this.loginRepository});

  @override
  Future<List<UserRole>?> getCardsInfo({ StatusEnum? status }) async {
    String? token = await loginRepository.readItem("token");
    final response = await http.get<List<dynamic>>(
        path: Urls.useRole, headers: {"Authorization": "Bearer $token"});
    return response.map((item) {
      return UserRole.fromJson(item);
    }).toList();
  }
}
