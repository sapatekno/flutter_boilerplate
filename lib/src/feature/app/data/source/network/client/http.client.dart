import 'package:dio/dio.dart';
import 'package:dio_log/dio_log.dart';

class HttpClient {
  HttpClient();

  Dio get client {
    Dio dio = Dio(_getOptions());
    dio.interceptors.add(DioLogInterceptor());

    return dio;
  }

  BaseOptions _getOptions() => BaseOptions(receiveTimeout: 3000);
}
