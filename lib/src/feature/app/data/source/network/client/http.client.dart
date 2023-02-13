import 'package:alice/alice.dart';
import 'package:dio/dio.dart';

class HttpClient {
  final Alice alice;

  HttpClient(this.alice);

  Dio get client {
    Dio dio = Dio(_getOptions());
    dio.interceptors.add(alice.getDioInterceptor());
    return dio;
  }

  BaseOptions _getOptions() => BaseOptions(receiveTimeout: 30000);
}
