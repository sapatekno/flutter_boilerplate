import 'package:alice/alice.dart';
import 'package:dio/dio.dart';

import 'logger.util.dart';
import 'util.dart';

class HttpUtil extends Util {
  final LoggerUtil _logger;
  final Alice _alice;

  HttpUtil(this._logger, this._alice);

  Dio getClient() {
    Dio dio = Dio(_getOptions());
    dio.interceptors.add(_alice.getDioInterceptor());
    return dio;
  }

  BaseOptions _getOptions() => BaseOptions(receiveTimeout: 30000);
}
