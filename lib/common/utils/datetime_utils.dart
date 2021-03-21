import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDateTime(String date, String dateFormat) {
    return DateFormat(dateFormat).format(DateTime.parse(date),);
  }

  static bool isExpiredCachingTime(DateTime lastUpdated, {DateTime compareTime}) {
    compareTime = compareTime == null ? compareTime = DateTime.now() : compareTime;
    return compareTime.difference(lastUpdated).inMinutes >= 5;
  }
}
