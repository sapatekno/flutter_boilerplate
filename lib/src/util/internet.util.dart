import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'util.dart';

class InternetUtil extends Util {
  final checkInterval = const Duration(seconds: 5);
  final checkTimeout = const Duration(seconds: 4);

  InternetConnectionCheckerPlus get _client {
    InternetConnectionCheckerPlus client = InternetConnectionCheckerPlus.createInstance(checkInterval: checkInterval, checkTimeout: checkTimeout);
    return client;
  }

  Future<bool> hasConnection() => _client.hasConnection;
}
