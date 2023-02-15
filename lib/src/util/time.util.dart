import 'package:intl/intl.dart';

class TimeUtil {
  /// * Example Indonesian WIB Time offset is +07:00
  static String timeZoneOffsetServerFormat(DateTime time) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final duration = time.timeZoneOffset, hours = duration.inHours, minutes = duration.inMinutes.remainder(60).abs().toInt();
    return '${hours > 0 ? '+' : '-'}${twoDigits(hours.abs())}:${twoDigits(minutes)}';
  }

  /// * Desired server format is YYYY-MM-DDThh:mm:ssTZD
  static String dateServerFormat(DateTime time) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(time);
  }
}
