import 'package:bloc/bloc.dart';
import 'package:vcnafacul/services/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.service}) : super(LoginInitial());

  final LoginService service;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await service.login(email: email, password: password);
      emit(LoginSucess());
    } on Exception catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }
}
