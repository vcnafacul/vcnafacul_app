import 'package:vcnafacul/entitys/question/question.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/repositories/login_repository.dart';
import 'package:vcnafacul/services/dash_card_template_service.dart';
import 'package:vcnafacul/services/urls.dart';

class QuestionService extends DashCardTemplateService<Question> {
  final LoginRepository loginRepository;
  QuestionService({required super.http, required this.loginRepository});

  @override
  Future<List<Question>> getCardsInfo({StatusEnum? status}) async {
    String? token = await loginRepository.readItem("token");
    int statusNumber = status!.index;
    String path = '${Urls.question}/$statusNumber';
    final response = await http.get<List<dynamic>>(
        path: path, headers: {"Authorization": "Bearer $token"});
    return response.map((item) {
      return Question.fromJson(item);
    }).toList();
  }
}
