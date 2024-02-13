import 'package:flutter/material.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template.dart';
import 'package:vcnafacul/entitys/prova/prova.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/types/card_dash/card_cash.dart';
import 'package:vcnafacul/utils/lanched_url.dart';

class ProvaScreen extends StatefulWidget {
  const ProvaScreen({Key? key}) : super(key: key);

  @override
  _ProvaScreenState createState() => _ProvaScreenState();
}

class _ProvaScreenState extends State<ProvaScreen> {
  CardDashType convert<T extends Prova>(T prova) {
    InfoCard infoQuestion = InfoCard(
        field: 'Total de Questões', value: prova.totalQuestao.toString());
    InfoCard infoQuestionRegistered = InfoCard(
        field: 'Cadastradas', value: prova.totalQuestaoCadastradas.toString());
    InfoCard infoValidated = InfoCard(
        field: 'Validadas', value: prova.totalQuestaoValidadas.toString());
    InfoCard infoRegistered =
        InfoCard(field: 'Ultima Atualização', value: prova.createdAt);

    return CardDashType(
        id: prova.id,
        title: prova.nome,
        status: prova.totalQuestao == prova.totalQuestaoValidadas
            ? StatusEnum.approved
            : StatusEnum.rejected,
        infos: [
          infoQuestion,
          infoQuestionRegistered,
          infoValidated,
          infoRegistered
        ]);
  }

  void openCardHandle(Prova prova) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: Text(prova.nome),
            content: ElevatedButton(
                onPressed: () {
                  launchURL(
                      'https://vcnafacul.com.br/Files/Homol/${prova.filename}',
                      context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.picture_as_pdf),
                    ),
                    Text('Download'),
                  ],
                )),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Fechar'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DashCardTemplate<Prova>(
      title: 'Banco de Provas',
      convert: convert,
      openCardHandle: openCardHandle,
    );
  }
}
