import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../router/sl.router.dart';
import '../../../../../../../util/crypto.util.dart';
import '../user.prefs.dart';

class UserPrefsImpl implements UserPrefs {
  CryptoUtil crypto;

  UserPrefsImpl(this.crypto);

  @override
  SharedPreferences get client => sl.get<SharedPreferences>();

  @override
  void setUser(String data) {
    client.setString(crypto.encrypt('user'), crypto.encrypt('data'));
  }
}
