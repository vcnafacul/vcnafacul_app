import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcnafacul/components/molecules/dash_card_filter_status.dart';
import 'package:vcnafacul/components/organism/dash_card_filter.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template_cubit.dart';
import 'package:vcnafacul/entitys/question/question.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/screens/question_bank/show_qt.dart';
import 'package:vcnafacul/types/card_dash/card_cash.dart';

class QuestionBankScreen extends StatefulWidget {
  const QuestionBankScreen({Key? key}) : super(key: key);

  @override
  _QuestionBankScreenState createState() => _QuestionBankScreenState();
}

class _QuestionBankScreenState extends State<QuestionBankScreen> {
  StatusEnum selectedValue = StatusEnum.pending;
  late TextEditingController controllerFilter;

  @override
  void initState() {
    controllerFilter = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerFilter.dispose();
    super.dispose();
  }

  CardDashType convert<T extends Question>(T question) {
    InfoCard infoId = InfoCard(field: 'Id', value: question.id);
    InfoCard infoProva = InfoCard(field: 'Prova', value: question.prova ?? '');
    InfoCard infoArea = InfoCard(field: 'Area', value: question.enemArea);
    InfoCard infoSubject =
        InfoCard(field: 'Disciplina', value: question.materia);
    InfoCard infoUpdated = InfoCard(
        field: 'Ultima Atualização', value: question.updateAt.toString());

    return CardDashType(
        id: question.id,
        title: question.title,
        status: question.status,
        infos: [infoId, infoProva, infoArea, infoSubject, infoUpdated]);
  }

  void onChangedHandle(StatusEnum? status) {
    setState(() {
      selectedValue = status!;
    });
  }


  bool filterCard(Question question) {
    return question.title
        .toLowerCase()
        .contains(controllerFilter.text.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashCardTemplateCubit<Question>>();

    controllerFilter.addListener(() => {
          if (controllerFilter.text.isNotEmpty)
            {cubit.filterCard(filterCard)}
          else
            {cubit.filterCard(null)}
        });
        
  Future<void> openCardHandle(Question card) async {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowQt(
                question: card,
                cubit: cubit),
          ));
    }

    return DashCardTemplate<Question>(
        title: 'Banco de Questões',
        convert: convert,
        selectedStatus: selectedValue,
        openCardHandle: openCardHandle,
        dashCardFilter: DashCardFilter(
            controllerFilter: controllerFilter,
            filterStatus: DashCardFilterStatus(
                onChanged: onChangedHandle, selectedValue: selectedValue)));
  }
}
