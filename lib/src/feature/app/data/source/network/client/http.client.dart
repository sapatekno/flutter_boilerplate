import 'package:dio/dio.dart';

import '../../../../../../util/alice.util.dart';

class HttpClient {
  final AliceUtil aliceUtil;

  HttpClient(this.aliceUtil);

  Dio get client {
    Dio dio = Dio(_getOptions());
    dio.interceptors.add(aliceUtil.instance.getDioInterceptor());

    return dio;
  }

  BaseOptions _getOptions() => BaseOptions(receiveTimeout: 3000);
}
