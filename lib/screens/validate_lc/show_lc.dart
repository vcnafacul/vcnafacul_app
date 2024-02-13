import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/components/atoms/button.dart';
import 'package:vcnafacul/components/atoms/field_value.dart';
import 'package:vcnafacul/components/atoms/map_osm.dart';
import 'package:vcnafacul/components/atoms/show_dialog_error.dart';
import 'package:vcnafacul/components/templates/dash_card_template/dash_card_template_cubit.dart';
import 'package:vcnafacul/core/routes.dart';
import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/services/validate_lc_service.dart';
import 'package:vcnafacul/style/colors.dart';
import 'package:vcnafacul/entitys/geolocation/geolocation.dart';
import 'package:vcnafacul/types/geolocation/lat_lbg.dart';
import 'package:vcnafacul/utils/status.dart';

class ShowLC extends StatefulWidget {
  final Geolocation geo;
  final DashCardTemplateCubit<Geolocation> cubit;
  const ShowLC({Key? key, required this.geo, required this.cubit})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowLCState createState() => _ShowLCState();
}

class _ShowLCState extends State<ShowLC> {
  late Geolocation geo;
  late TextEditingController reasonController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    geo = widget.geo;
    reasonController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: const Text('Descreva o motivo da rejeição'),
            content: Form(
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'motivos',
                ),
                controller: reasonController,
                validator: (value) =>
                    value!.isEmpty ? 'Motivo de rejeição obrigatório' : null,
                minLines: 1,
                maxLines: 4,
              ),
            ),
            shape: const ContinuousRectangleBorder(),
            actions: [
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    (widget.cubit.service as ValidateLCService)
                        .changeStatus(
                            status: StatusEnum.rejected,
                            id: int.parse(geo.id),
                            reason: reasonController.text)
                        .then((value) {
                      Navigator.of(context).pop();
                      widget.cubit.removeCard(geo);
                    }).catchError((e) {
                      showDialogError(
                          message: e.message,
                          context: context,
                          routerBack: Routers.validateLC.name);
                    });
                  }
                },
                child: const Text('Enviar'),
              ),
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
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
                Row(children: [Status.getStatus(geo.status), Text(geo.name)])),
        backgroundColor: CustomColors.marine,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: CustomColors.white,
          child: Column(children: [
            MapOsm(center: LatLng(lat: geo.latitude, lng: geo.longitude)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FieldValue(field: 'Nome', value: geo.name, column: true),
                  FieldValue(field: 'Rua', value: geo.street, column: true),
                  FieldValue(
                      field: 'Bairro', value: geo.neighborhood, column: true),
                  FieldValue(field: 'Numero', value: geo.number, column: true),
                  FieldValue(
                      field: 'Complemento',
                      value: geo.complement,
                      column: true),
                  FieldValue(field: 'CEP', value: geo.cep, column: true),
                  FieldValue(field: 'Estado', value: geo.state, column: true),
                  FieldValue(field: 'Cidade', value: geo.city, column: true),
                  FieldValue(field: 'Telefone', value: geo.phone, column: true),
                  FieldValue(
                      field: 'Whatsapp', value: geo.whatsapp, column: true),
                  FieldValue(field: 'Email', value: geo.email, column: true),
                  FieldValue(
                      field: 'Categoria', value: geo.category, column: true),
                  FieldValue(field: 'Site', value: geo.site, column: true),
                  FieldValue(
                      field: 'Linkedin', value: geo.linkedin, column: true),
                  FieldValue(
                      field: 'Youtube', value: geo.youtube, column: true),
                  FieldValue(
                      field: 'Facebook', value: geo.facebook, column: true),
                  FieldValue(
                      field: 'Instagram', value: geo.instagram, column: true),
                  FieldValue(
                      field: 'Twitter', value: geo.twitter, column: true),
                  FieldValue(field: 'TikTok', value: geo.tiktok, column: true),
                  Text(
                    'Quem Cadastrou',
                    style: GoogleFonts.raleway(
                        color: CustomColors.marine,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  FieldValue(
                      field: 'Cadastrado Por',
                      value: geo.userFullName,
                      column: true),
                  FieldValue(
                      field: 'Telefone', value: geo.userPhone, column: true),
                  FieldValue(
                      field: 'Relação com o cursinho cadastrado',
                      value: geo.userConnection,
                      column: true),
                  FieldValue(
                      field: 'Email', value: geo.userEmail, column: true),
                  if (geo.status != StatusEnum.approved)
                    Button(
                      label: 'Aprovar',
                      onPressed: () {
                        (widget.cubit.service as ValidateLCService)
                            .changeStatus(
                                status: StatusEnum.approved,
                                id: int.parse(geo.id))
                            .then((value) {
                          widget.cubit.removeCard(geo);
                          Navigator.of(context).pop();
                        });
                      },
                      color: CustomColors.green2,
                    ),
                  if (geo.status != StatusEnum.rejected)
                    Button(
                      label: 'Rejeitar',
                      onPressed: _showDialog,
                      color: CustomColors.red,
                    )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
