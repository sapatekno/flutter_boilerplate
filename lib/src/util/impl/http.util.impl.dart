import 'package:dio/dio.dart';

import '../http.util.dart';
import '../logger.util.dart';

class HttpUtilImpl extends HttpUtil {
  final LoggerUtil logger;

  HttpUtilImpl(this.logger);

  @override
  Dio getClient() {
    Dio dio = Dio(_getOptions());
    // dio.interceptors.add(logger.getDioLogger());
    return dio;
  }

  BaseOptions _getOptions() => BaseOptions(receiveTimeout: 30000);
}
