import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../logger.util.dart';

class LoggerUtilImpl extends LoggerUtil {
  Logger get log => Logger();

  @override
  void showError(message, [error, StackTrace? stackTrace]) {
    log.e(message, error, stackTrace);
  }

  @override
  void showInfo(message, [error, StackTrace? stackTrace]) {
    log.i(message, error, stackTrace);
  }

  @override
  void showWarning(message, [error, StackTrace? stackTrace]) {
    log.w(message, error, stackTrace);
  }

  @override
  InterceptorsWrapper getDioLogger() {
    return InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
      String headers = "";
      options.headers.forEach((key, value) {
        headers += "| $key: $value";
      });

      showInfo("┌------------------------------------------------------------------------------");
      showInfo('''| [DIO] Request: ${options.method} ${options.uri}
| ${options.data.toString()}
| Headers:\n$headers''');
      showInfo("├------------------------------------------------------------------------------");
      handler.next(options); //continue
    }, onResponse: (Response response, handler) async {
      showInfo("| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
      showInfo("└------------------------------------------------------------------------------");
      handler.next(response);
      // return response; // continue
    }, onError: (DioError error, handler) async {
      showError("| [DIO] Error: ${error.error}: ${error.response.toString()}");
      showError("└------------------------------------------------------------------------------");
      handler.next(error); //continue
    });
  }
}
