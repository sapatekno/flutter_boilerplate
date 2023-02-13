import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/config.dart';
import '../../../../../util/internet.util.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/source/local/prefs/user.prefs.dart';
import '../../../data/repository/auth.repo.dart';
import '../../data/entity/request/login.req.e.dart';

class LoginState extends Cubit<MainState> {
  final AuthRepo authRepo;
  final UserPrefs userPrefs;
  final InternetUtil internet;

  LoginState(this.authRepo, this.userPrefs, this.internet) : super(InitState());

  void setPasswordObscureTextState(bool value) => emit(PasswordObscureTextState(value));

  void getToken() async {
    emit(LoadState());

    /// * Cek koneksi internet client
    if (!await internet.hasConnection()) {
      await Future.delayed(const Duration(seconds: 1));
      emit(DataState(true));
      emit(FailState(Failure.fromNoInternetConnection()));
      return;
    }

    /// * Cek jika user sudah login (ada data, termasuk token) pindah ke halaman utama
    var user = userPrefs.getUser();
    user.fold((nodata) {
      emit(DataState(true));
    }, (data) {});
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

    source.fold((failure) {
      emit(DataState(true));
      emit(AlertState(Failure.proccess(failure)));
      return;
    }, (data) {
      emit(GoToHomeState());
      return;
    });
  }
}

class PasswordObscureTextState extends MainState {
  final bool value;

  PasswordObscureTextState(this.value);
}

class GoToHomeState extends MainState {}
