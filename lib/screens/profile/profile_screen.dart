import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/entitys/user/auth.dart';
import 'package:vcnafacul/repositories/login_repository.dart';
import 'package:vcnafacul/style/colors.dart';

class ProfileScreen extends StatefulWidget {
  final LoginRepository repository;
  const ProfileScreen({Key? key, required this.repository}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Auth?> _authFuture;

  @override
  void initState() {
    super.initState();
    _authFuture = widget.repository.readAll();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<Auth?>(
        future: _authFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Exibe um indicador de carregamento enquanto a operação assíncrona está em andamento
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Exibe uma mensagem de erro se ocorrer algum erro durante a operação assíncrona
            return const Text('Erro ao carregar os dados de autenticação');
          } else {
            // Se a operação assíncrona for concluída com sucesso, exibe o conteúdo da tela principal
            final auth = snapshot.data;
            if (auth != null) {
              return Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              CustomColors.marine,
                              Color.fromARGB(255, 63, 93, 127),
                            ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 80,
                                backgroundImage:
                                    AssetImage('assets/1705778628836.png')),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                '${auth.user.firstName} ${auth.user.lastName} \n ${auth.user.email}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.none,
                                    color: CustomColors.white),
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: CustomColors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 32),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sobre',
                                    style: GoogleFonts.raleway(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        color: CustomColors.marine),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      auth.user.about ??
                                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the reLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the reLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the re',
                                      style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none,
                                          color: CustomColors.marine),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      )),
                ],
              );
            } else {
              // Exibe um indicador ou mensagem se não houver dados de autenticação
              return const Text('Sem dados de autenticação');
            }
          }
        },
      );
}
