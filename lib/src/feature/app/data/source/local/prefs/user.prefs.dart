import 'package:dartz/dartz.dart';

import '../../../../../auth/auth.login/data/entity/response/login.res.e.dart';
import 'prefs.dart';

abstract class UserPrefs extends Prefs {
  Future<bool> setUser(LoginResE data);

  Either<dynamic, LoginResE> getUser();

  Future<bool> removeUser();
}
