import 'package:vcnafacul/types/card_dash/base_entity_card.dart';

class Prova implements BaseEntityCard {
  @override
  String id;
  String edicao;
  int aplicacao;
  int ano;
  String exame;
  String nome;
  int totalQuestao;
  int totalQuestaoCadastradas;
  int totalQuestaoValidadas;
  String createdAt;
  String filename;

  Prova({
    required this.id,
    required this.edicao,
    required this.aplicacao,
    required this.ano,
    required this.exame,
    required this.nome,
    required this.totalQuestao,
    required this.totalQuestaoCadastradas,
    required this.totalQuestaoValidadas,
    required this.createdAt,
    required this.filename,
  });

  factory Prova.fromJson(Map<String, dynamic> json) {
    return Prova(
        id: json['_id'] as String,
        edicao: json['edicao'],
        aplicacao: json['aplicacao'] as int,
        ano: json['ano'] as int,
        exame: json['exame'] as String,
        nome:json['nome'] as String,
        totalQuestao: json['totalQuestao'] as int,
        totalQuestaoCadastradas: json['totalQuestaoCadastradas'] as int,
        totalQuestaoValidadas: json['totalQuestaoValidadas'] as int,
        createdAt: json['createdAt'] as String,
        filename: json['filename'] as String,);
  }
}
