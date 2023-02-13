import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/src/feature/auth/auth.login/data/entity/response/login.res.e.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../router/sl.router.dart';
import '../../../../../../../util/crypto.util.dart';
import '../user.prefs.dart';

class UserPrefsImpl implements UserPrefs {
  CryptoUtil crypto;

  UserPrefsImpl(this.crypto);

  @override
  SharedPreferences get client => sl.get<SharedPreferences>();

  String get keyUser => crypto.encrypt('user');

  @override
  Future<bool> setUser(LoginResE data) async {
    return await client.setString(keyUser, crypto.encrypt(jsonEncode(data.toJson())));
  }

  @override
  Either<dynamic, LoginResE> getUser() {
    var source = client.getString(keyUser);
    if (source == null) {
      return const Left(null);
    } else {
      var result = LoginResE.fromJson(crypto.decrypt(source) as dynamic);
      return Right(result);
    }
  }
}
