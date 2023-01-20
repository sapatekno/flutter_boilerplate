import 'package:alice/alice.dart';
import 'package:flutter_boilerplate/src/app/material.app/cubit/impl/material.app.cubit.impl.dart';
import 'package:flutter_boilerplate/src/app/material.app/cubit/material.app.cubit.dart';
import 'package:flutter_boilerplate/src/data/repository/impl/user.repository.impl.dart';
import 'package:flutter_boilerplate/src/data/repository/user.repository.dart';
import 'package:flutter_boilerplate/src/data/source/api/impl/reqres.api.impl.dart';
import 'package:flutter_boilerplate/src/data/source/api/reqres.api.dart';
import 'package:flutter_boilerplate/src/util/crypto.util.dart';
import 'package:flutter_boilerplate/src/util/http.util.dart';
import 'package:get_it/get_it.dart';

import '../presenter/user/cubit/home.cubit.dart';
import '../presenter/user/cubit/impl/home.cubit.impl.dart';
import '../util/logger.util.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// * Utilities
  sl.registerSingleton<Alice>(Alice());
  sl.registerSingleton<LoggerUtil>(LoggerUtil());
  sl.registerSingleton<HttpUtil>(HttpUtil(sl(), sl()));
  sl.registerSingleton<CryptoUtil>(CryptoUtil());

  /// * API
  sl.registerLazySingleton<ReqresApi>(() => ReqresApiImpl(sl()));

  /// * Repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  /// * Cubit
  sl.registerSingleton<MaterialAppCubit>(MaterialAppCubitImpl());
  sl.registerFactory<HomeCubit>(() => HomeCubitImpl(sl()));
}
