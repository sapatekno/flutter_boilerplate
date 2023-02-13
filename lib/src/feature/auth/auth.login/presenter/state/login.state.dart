import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/src/feature/auth/auth.login/data/entity/request/login.req.e.dart';

import '../../../../../config/config.dart';
import '../../../../../util/internet.util.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../data/repository/auth.repo.dart';

class LoginState extends Cubit<MainState> {
  final AuthRepo authRepo;
  final InternetUtil internet;

  LoginState(this.authRepo, this.internet) : super(InitState());

  void setPasswordObscureTextState(bool value) => emit(PasswordObscureTextState(value));

  void getToken() async {
    emit(DataState(true));
  }

  void doLogin(String user, String pass) async {
    emit(LoadState());
    if (!await internet.hasConnection()) {
      await Future.delayed(const Duration(seconds: 1));
      emit(DataState(true));
      emit(AlertState(Failure.fromNoInternetConnection()));
      return;
    }
    var loginData = LoginReqE(userapp: user, password: pass);
    var source = await authRepo.postAuthLogin(loginData);
    emit(DataState(true));
  }
}

class PasswordObscureTextState extends MainState {
  final bool value;

  PasswordObscureTextState(this.value);
}
