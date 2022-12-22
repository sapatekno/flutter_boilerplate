import 'package:dio/dio.dart';

import 'util.dart';

abstract class HttpUtil extends Util {
  Dio getClient();
}
