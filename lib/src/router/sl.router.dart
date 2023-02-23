import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surveyami/src/feature/customer/customer.survey/presenter/state/customer_survey.state.dart';
import 'package:surveyami/src/feature/substation/data/repository/impl/subsatation.repo.impl.dart';
import 'package:surveyami/src/feature/substation/data/repository/substation.repo.dart';
import 'package:surveyami/src/feature/substation/substation.survey/presenter/state/substation_survey.state.dart';
import 'package:surveyami/src/util/alice.util.dart';

import '../config/config.dart';
import '../feature/app/data/session/session.dart';
import '../feature/app/data/source/local/client/local.client.dart';
import '../feature/app/data/source/local/prefs/impl/user.prefs.impl.dart';
import '../feature/app/data/source/local/prefs/user.prefs.dart';
import '../feature/app/data/source/network/api/impl/survey_ami.api.impl.dart';
import '../feature/app/data/source/network/api/survey_ami.api.dart';
import '../feature/app/data/source/network/client/http.client.dart';
import '../feature/auth/auth.login/presenter/state/login.state.dart';
import '../feature/auth/data/repository/auth.repo.dart';
import '../feature/auth/data/repository/impl/auth.repo.impl.dart';
import '../feature/customer/data/repository/customer.repo.dart';
import '../feature/customer/data/repository/impl/customer.repo.impl.dart';
import '../feature/file/data/repository/file.repo.dart';
import '../feature/file/data/repository/impl/file.repo.impl.dart';
import '../feature/location/presenter/state/location.state.dart';
import '../feature/substation/substation.trafo/presenter/state/trafo.state.dart';
import '../util/crypto.util.dart';
import '../util/internet.util.dart';

final sl = GetIt.instance;

Future<void> init(Config config) async {
  /// * Define Config Environment
  sl.registerSingleton<Config>(config);
  sl.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());

  /// * Define Third Parties Libraries
  sl.registerSingleton<Alice>(Alice());

  /// * Utilities
  sl.registerSingleton<AliceUtil>(AliceUtil(sl()));
  sl.registerSingleton<InternetUtil>(InternetUtil());
  sl.registerSingleton<CryptoUtil>(CryptoUtil());

  /// * Client (Network & Local)
  sl.registerSingleton<HttpClient>(HttpClient(sl()));
  sl.registerSingleton<SharedPreferences>(await LocalClient().client);

  /// * Preferences
  sl.registerLazySingleton<UserPrefs>(() => UserPrefsImpl(sl()));

  /// * API
  sl.registerLazySingleton<SurveyAmiApi>(() => SurveyAmiApiImpl(sl(), sl(), sl()));

  /// * Session (Global Data)
  sl.registerSingleton<Session>(Session(sl()));

  /// * Repositories
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
  sl.registerLazySingleton<SubStationRepo>(() => SubStationRepoImpl(sl()));
  sl.registerLazySingleton<FileRepo>(() => FileRepoImpl(sl()));
  sl.registerLazySingleton<CustomerRepo>(() => CustomerRepoImpl(sl()));

  /// * Cubit (State)
  sl.registerFactory<LoginState>(() => LoginState(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton<LocationState>(() => LocationState());
  sl.registerFactory<TrafoState>(() => TrafoState());
  sl.registerFactory<SubStationSurveyState>(() => SubStationSurveyState(sl(), sl(), sl()));
  sl.registerFactory<CustomerSurveyState>(() => CustomerSurveyState(sl(), sl(), sl()));
}
