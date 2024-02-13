import 'package:vcnafacul/core/http.dart';
import 'package:vcnafacul/enum/status_enum.dart';

abstract class DashCardTemplateService<T> {
  Future<List<T>?> getCardsInfo({ StatusEnum? status });
  final IHttp http;

  DashCardTemplateService({ required this.http});
}
