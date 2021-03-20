import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDateTime(String date, String dateFormat) {
    return DateFormat(dateFormat).format(
      DateTime.parse(date),
    );
  }

  static bool isExpiredCachingTime(DateTime lastUpdated) {
    return DateTime.now().difference(lastUpdated).inMinutes >= 5;
  }
}
