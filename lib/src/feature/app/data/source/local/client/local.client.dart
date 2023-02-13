import 'package:shared_preferences/shared_preferences.dart';

class LocalClient {
  Future<SharedPreferences> get client => SharedPreferences.getInstance();
}
