import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/components/atoms/field_value.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template_cubit.dart';
import 'package:vcnafacul/entitys/question/question.dart';
import 'package:vcnafacul/style/colors.dart';
import 'package:vcnafacul/types/actions/action.dart';
import 'package:vcnafacul/utils/status.dart';

class ShowQt extends StatelessWidget {
  final Question question;
  final DashCardTemplateCubit<Question> cubit;
  const ShowQt({Key? key, required this.question, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [Status.getStatus(question.status), Text(question.title)],
          ),
        ),
        backgroundColor: CustomColors.marine,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: CustomColors.white,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FieldValue(
                field: 'id',
                value: question.id,
              ),
              FieldValue(
                field: 'Prova',
                value: question.prova ?? '',
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Enem Area',
                value: question.enemArea,
                column: true,
              ),
              FieldValue(
                field: 'Disciplina',
                value: question.materia,
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Numero',
                value: question.numero.toString(),
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Frente Principal',
                value: question.frente1,
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Frente Secundária',
                value: question.frente2 ?? '',
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Frente Terciária',
                value: question.frente3 ?? '',
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Texto Questão',
                value: question.textoQuestao,
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Alternativa A',
                value: question.textoAlternativaA,
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Alternativa B',
                value: question.textoAlternativaB,
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Alternativa C',
                value: question.textoAlternativaC,
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Alternativa D',
                value: question.textoAlternativaD,
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
              FieldValue(
                field: 'Alternativa E',
                value: question.textoAlternativaE,
                column: true,
                actions: [MyAction(onTap: () {}, icon: Icons.edit_note_sharp)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
