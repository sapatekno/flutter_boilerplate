import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class HttpClient {

  HttpClient();

  Dio get client {
    Dio dio = Dio(_getOptions());
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ),
    );
    return dio;
  }

  BaseOptions _getOptions() => BaseOptions(receiveTimeout: 3000);
}
