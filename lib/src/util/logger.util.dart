import 'package:logger/logger.dart';

import 'util.dart';

class LoggerUtil extends Util {
  Logger get _log => Logger();

  void showError(message, [error, StackTrace? stackTrace]) =>
      _log.e(message, error, stackTrace);

  void showInfo(message, [error, StackTrace? stackTrace]) =>
      _log.i(message, error, stackTrace);

  void showWarning(message, [error, StackTrace? stackTrace]) =>
      _log.w(message, error, stackTrace);
}
