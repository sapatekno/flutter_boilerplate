import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/config.dart';
import '../../../../../util/internet.util.dart';
import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/session/session.dart';
import '../../../../app/data/source/local/prefs/user.prefs.dart';
import '../../../data/repository/auth.repo.dart';
import '../../data/entity/request/login.req.e.dart';

class LoginState extends Cubit<MainState> {
  final AuthRepo authRepo;
  final UserPrefs userPrefs;
  final InternetUtil internet;
  final Session session;

  LoginState(this.authRepo, this.userPrefs, this.internet, this.session) : super(InitState());

  void setPasswordObscureTextState(bool value) => emit(PasswordObscureTextState(value));

  void getToken() async {
    emit(LoadState());

    /// * Cek koneksi internet client
    if (!await internet.hasConnection()) {
      await Future.delayed(const Duration(seconds: 1));
      emit(DataState(true));
      emit(FailState(Failure.failNoInternet()));
      return;
    }

    /// * Cek jika user sudah login (ada data, termasuk token) pindah ke halaman utama
    var user = session.user;
    if (session.user == null) {
      emit(DataState(true));
    } else {
      emit(GoToHomeState());
    }
  }

  void doLogin(String user, String pass) async {
    emit(LoadState());

    if (!await internet.hasConnection()) {
      await Future.delayed(const Duration(seconds: 1));
      emit(DataState(true));
      emit(AlertState(Failure.failNoInternet()));
      return;
    }

    var loginData = LoginReqE(userapp: user, password: pass);
    var source = await authRepo.postAuthLogin(loginData);

    source.fold((failure) {
      emit(DataState(true));
      emit(AlertState(Failure.doProccess(failure)));
      return;
    }, (data) async {
      bool saveLogin = await session.update(data);
      if (saveLogin) {
        TextInput.finishAutofillContext(shouldSave: true);
        emit(GoToHomeState());
      } else {
        emit(DataState(true));
        emit(AlertState(Failure.doProccess(Failure.failNoInternet())));
      }
      return;
    });
  }
}

class PasswordObscureTextState extends MainState {
  final bool value;

  PasswordObscureTextState(this.value);
}

class GoToHomeState extends MainState {}
