import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcnafacul/components/atoms/logo.dart';
import 'package:vcnafacul/components/organism/drawer_list.dart';
import 'package:vcnafacul/entitys/user/auth.dart';
import 'package:vcnafacul/repositories/login_repository.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomeScreen extends StatefulWidget {
  final LoginRepository repository;
  const HomeScreen({Key? key, required this.repository}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Auth?> _authFuture;

  @override
  void initState() {
    initializeDateFormatting('pt_BR', null);
    super.initState();
    _authFuture = widget.repository.readAll();
  }

  String obterDataFormatada() {
    DateTime dataAtual = DateTime.now();
    DateFormat formato = DateFormat('dd MMM yyyy', 'pt_BR');
    String dataFormatada = formato.format(dataAtual);
    return dataFormatada;
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
              return Scaffold(
                appBar: AppBar(
                  title: const Logo(
                    darktheme: true,
                  ),
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                ),
                drawerScrimColor: const Color.fromRGBO(255, 255, 255, 0.6),
                endDrawer: Drawer(child: getListViewDrawer(auth)),
                body: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: Text('Olá, ${auth.user.firstName}!',
                            style: GoogleFonts.raleway(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(obterDataFormatada(),
                            style: GoogleFonts.raleway(fontSize: 14)),
                      )
                    ],
                  ),
                ),
              );
            } else {
              // Exibe um indicador ou mensagem se não houver dados de autenticação
              return const Text('Sem dados de autenticação');
            }
          }
        },
      );
}
