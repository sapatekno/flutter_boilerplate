import 'package:alice/alice.dart';
import 'package:flutter_boilerplate/src/feature/app/data/source/local/client/local.client.dart';
import 'package:flutter_boilerplate/src/feature/app/data/source/local/prefs/impl/user.prefs.impl.dart';
import 'package:flutter_boilerplate/src/feature/app/data/source/local/prefs/user.prefs.dart';
import 'package:flutter_boilerplate/src/util/internet.util.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/config.dart';
import '../feature/app/data/source/network/api/impl/survey_ami.api.impl.dart';
import '../feature/app/data/source/network/api/survey_ami.api.dart';
import '../feature/app/data/source/network/client/http.client.dart';
import '../feature/auth/auth.login/presenter/state/login.state.dart';
import '../feature/auth/data/repository/auth.repo.dart';
import '../feature/auth/data/repository/impl/auth.repo.impl.dart';
import '../util/crypto.util.dart';
import '../util/logger.util.dart';

final sl = GetIt.instance;

Future<void> init(Config config) async {
  /// * Define Config Environment
  sl.registerSingleton<Config>(config);

  /// * Utilities
  sl.registerSingleton<Alice>(Alice());
  sl.registerSingleton<InternetUtil>(InternetUtil());
  sl.registerSingleton<LoggerUtil>(LoggerUtil());
  sl.registerSingleton<CryptoUtil>(CryptoUtil());

  /// * Client (Network & Local)
  sl.registerSingleton<HttpClient>(HttpClient(sl()));
  sl.registerSingleton<SharedPreferences>(await LocalClient().client);

  /// * Preferences
  sl.registerLazySingleton<UserPrefs>(() => UserPrefsImpl(sl()));

  /// * API
  sl.registerLazySingleton<SurveyAmiApi>(() => SurveyAmiApiImpl(sl(), sl()));

  /// * Repositories
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));

  /// * Cubit (State)
  /// sl.registerSingleton<MaterialAppCubit>(MaterialAppCubit());
  sl.registerFactory<LoginState>(() => LoginState(sl(), sl(), sl()));
}
