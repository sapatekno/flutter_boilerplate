import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../router/sl.router.dart';
import '../../../../../../../util/crypto.util.dart';
import '../../../../../../auth/auth.login/data/entity/response/login.res.e.dart';
import '../user.prefs.dart';

class UserPrefsImpl implements UserPrefs {
  CryptoUtil crypto;

  UserPrefsImpl(this.crypto);

  @override
  SharedPreferences get client => sl.get<SharedPreferences>();

  String get keyUser => crypto.encrypt('user');

  @override
  Future<bool> setUser(LoginResE data) async {
    String source = jsonEncode(data);
    return await client.setString(keyUser, crypto.encrypt(source));
  }

  @override
  Either<dynamic, LoginResE> getUser() {
    var source = client.getString(keyUser);
    if (source == null) {
      return const Left(null);
    } else {
      source = crypto.decrypt(source);
      var result = LoginResE.fromJson(jsonDecode(source));
      return Right(result);
    }
  }

  @override
  Future<bool> removeUser() async => await client.remove(keyUser);
}
