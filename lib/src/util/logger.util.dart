import 'package:dio/dio.dart';

import 'util.dart';

abstract class LoggerUtil extends Util {
  void showError(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void showInfo(dynamic message, [dynamic error, StackTrace? stackTrace]);

  void showWarning(dynamic message, [dynamic error, StackTrace? stackTrace]);

  InterceptorsWrapper getDioLogger();
}
