import '../../../app/data/source/local/prefs/user.prefs.dart';
import '../../../auth/auth.login/data/entity/response/login.res.e.dart';

class Session {
  final UserPrefs userPrefs;
  LoginResE? user;

  Session(this.userPrefs) {
    user = userPrefs.getUser().fold((nodata) => null, (user) => user);
  }

  Future<bool> remove() async {
    user = null;
    return await userPrefs.removeUser();
  }

  Future<bool> update(LoginResE data) async {
    user = data;
    return await userPrefs.setUser(data);
  }
}
