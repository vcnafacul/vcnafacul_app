import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcnafacul/components/molecules/dash_card_filter_status.dart';
import 'package:vcnafacul/components/organism/dash_card_filter.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template_cubit.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/screens/validate_lc/show_lc.dart';
import 'package:vcnafacul/types/card_dash/card_cash.dart';
import 'package:vcnafacul/entitys/geolocation/geolocation.dart';

class ValidateLCScreen extends StatefulWidget {
  const ValidateLCScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ValidateLCScreenState createState() => _ValidateLCScreenState();
}

class _ValidateLCScreenState extends State<ValidateLCScreen> {
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

  CardDashType convert<T extends Geolocation>(T geo) {
    InfoCard infoState = InfoCard(field: 'Estado', value: geo.state);
    InfoCard infoCity = InfoCard(field: 'Cidade', value: geo.city);
    InfoCard infoTwitter =
        InfoCard(field: 'Data de Cadastro', value: geo.createdAt);
    InfoCard infoTikTok =
        InfoCard(field: 'Ultima Atualização', value: geo.updatedAt ?? '');

    return CardDashType(
        id: geo.id,
        title: geo.name,
        status: geo.status,
        infos: [infoState, infoCity, infoTwitter, infoTikTok]);
  }

  void onChangedHandle(StatusEnum? status) {
    setState(() {
      selectedValue = status!;
    });
  }

  bool filterCard(Geolocation geo) {
    return geo.name.toLowerCase().contains(controllerFilter.text.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashCardTemplateCubit<Geolocation>>();

    controllerFilter.addListener(() => {
          if (controllerFilter.text.isNotEmpty)
            {cubit.filterCard(filterCard)}
          else
            {cubit.filterCard(null)}
        });

    Future<void> openCardHandle(Geolocation card) async {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowLC(
                geo: card,
                cubit: cubit),
          ));
    }

    return DashCardTemplate<Geolocation>(
        title: 'Validação LC',
        convert: convert,
        selectedStatus: selectedValue,
        openCardHandle: openCardHandle,
        dashCardFilter: DashCardFilter(
            controllerFilter: controllerFilter,
            filterStatus: DashCardFilterStatus(
                onChanged: onChangedHandle, selectedValue: selectedValue)));
  }
}
