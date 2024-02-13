import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/types/card_dash/base_entity_card.dart';

class Question implements BaseEntityCard {
  @override
  String id;
  final String title;
  final String? prova;
  final String enemArea;
  final String frente1;
  final String? frente2;
  final String? frente3;
  final String materia;
  final int numero;
  final String textoQuestao;
  final String textoAlternativaA;
  final String textoAlternativaB;
  final String textoAlternativaC;
  final String textoAlternativaD;
  final String textoAlternativaE;
  final String alternativa;
  final String imageId;
  final int acertos;
  final int quantidadeSimulado;
  final int quantidadeResposta;
  final StatusEnum status;
  final DateTime? updateAt;

  Question(
      {required this.id,
      required this.title,
      this.prova,
      required this.enemArea,
      required this.frente1,
      this.frente2,
      this.frente3,
      required this.materia,
      required this.numero,
      required this.textoQuestao,
      required this.textoAlternativaA,
      required this.textoAlternativaB,
      required this.textoAlternativaC,
      required this.textoAlternativaD,
      required this.textoAlternativaE,
      required this.alternativa,
      required this.imageId,
      required this.acertos,
      required this.quantidadeSimulado,
      required this.quantidadeResposta,
      required this.status,
      required this.updateAt});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'] as String,
      prova: json['prova'] as String?,
      enemArea: json['enemArea'] as String,
      frente1: json['frente1'] as String,
      frente2: json['frente2'] as String?,
      frente3: json['frente3'] as String?,
      materia: json['materia'] as String,
      numero: json['numero'] as int,
      title: '${json['_id'] as String} ${json['numero'] as int}',
      textoQuestao: json['textoQuestao'] as String,
      textoAlternativaA: json['textoAlternativaA'] as String,
      textoAlternativaB: json['textoAlternativaB'] as String,
      textoAlternativaC: json['textoAlternativaC'] as String,
      textoAlternativaD: json['textoAlternativaD'] as String,
      textoAlternativaE: json['textoAlternativaE'] as String,
      alternativa: json['alternativa'] as String,
      imageId: json['imageId'] as String,
      acertos: json['acertos'] as int? ?? 0,
      quantidadeSimulado: json['quantidadeSimulado'] as int? ?? 0,
      quantidadeResposta: json['quantidadeResposta'] as int? ?? 0,
      status: StatusEnum.values[json['status']],
      updateAt: json['updateAt'] != null
          ? DateTime.parse(json['updateAt'] as String)
          : null,
    );
  }
}
