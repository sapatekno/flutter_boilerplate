import 'package:flutter_boilerplate/src/app/material.app/cubit/impl/material.app.cubit.impl.dart';
import 'package:flutter_boilerplate/src/app/material.app/cubit/material.app.cubit.dart';
import 'package:flutter_boilerplate/src/data/repository/impl/user.repository.impl.dart';
import 'package:flutter_boilerplate/src/data/repository/user.repository.dart';
import 'package:flutter_boilerplate/src/data/source/api/impl/reqres.api.impl.dart';
import 'package:flutter_boilerplate/src/data/source/api/reqres.api.dart';
import 'package:flutter_boilerplate/src/presenter/home/cubit/home.cubit.dart';
import 'package:flutter_boilerplate/src/presenter/home/cubit/impl/home.cubit.impl.dart';
import 'package:flutter_boilerplate/src/util/impl/http.util.impl.dart';
import 'package:flutter_boilerplate/src/util/impl/logger.util.impl.dart';
import 'package:get_it/get_it.dart';

import '../util/http.util.dart';
import '../util/logger.util.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// * Utilities
  sl.registerSingleton<LoggerUtil>(LoggerUtilImpl());
  sl.registerSingleton<HttpUtil>(HttpUtilImpl(sl()));

  /// * API
  sl.registerLazySingleton<ReqresApi>(() => ReqresApiImpl(sl()));

  /// * Repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  /// * Cubit
  sl.registerSingleton<MaterialAppCubit>(MaterialAppCubitImpl());
  sl.registerFactory<HomeCubit>(() => HomeCubitImpl(sl()));
}
