import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';
import 'package:vcnafacul/components/atoms/button.dart';
import 'package:vcnafacul/components/atoms/input.dart';
import 'package:vcnafacul/components/atoms/login_background.dart';
import 'package:vcnafacul/components/atoms/logo.dart';
import 'package:vcnafacul/core/routes.dart';
import 'package:vcnafacul/screens/login/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String yellowTriangle = 'assets/icons/triangle-yellow2.svg';
  String greenTriangle = 'assets/icons/triangle-green2.svg';
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> _loginHandle(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;
    await context.read<LoginCubit>().login(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listenWhen: (context, state) {
      return state is LoginSucess;
    }, listener: (context, state) {
      Navigator.of(context).pushReplacementNamed(Routers.home.name);
    }, builder: (context, state) {
      return SingleChildScrollView(
          child: LoginBackground(
        component: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Form(
              key: _keyForm,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Logo(),
                    state is LoginError ? Text(state.error) : Container(),
                    Input(
                        placeholder: 'E-mail',
                        controller: _emailController,
                        validator: (value) =>
                            !isEmail(value!) ? "Email invalido" : null),
                    Input(
                        placeholder: 'Senha',
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) => value!.length < 8
                            ? "Dever possuir no mínimo 8 caracteres"
                            : null),
                    state is! LoginLoading || state is! LoginSucess
                        ? Button(
                            onPressed: () {
                              if (_keyForm.currentState!.validate()) {
                                _loginHandle(context);
                              }
                            },
                            label: 'Entrar',
                          )
                        : const CircularProgressIndicator()
                  ]),
            ),
          ),
        ),
      ));
    });
  }
}
