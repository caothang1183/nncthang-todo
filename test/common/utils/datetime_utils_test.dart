import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:nncthang_todoapp/common/utils/datetime_utils.dart';

void main() {
  group('DateTimeUtils Test Functions', () {
    test('String DateTime value should be return exactly DateFormat type', () {
      String dateTimeTest = "2020-11-27T22:22:00.000Z";
      String dateFormat = DateTimeUtils.formatDateTime(dateTimeTest, DateFormat.YEAR_MONTH_DAY);
      expect(dateFormat, "November 27, 2020");

      String dateFormat2 = DateTimeUtils.formatDateTime(dateTimeTest, DateFormat.HOUR24_MINUTE);
      expect(dateFormat2, "22:22");

      String dateFormat3 = DateTimeUtils.formatDateTime(dateTimeTest, DateFormat.WEEKDAY);
      expect(dateFormat3, "Friday");
    });

    test('Return value checking time expired', () {
      DateTime dateTimeTest = DateTime.parse("2020-11-27T22:22:00.000Z");
      DateTime lastTime = DateTime.parse("2020-11-27T22:20:00.000Z");

      bool isExpired = DateTimeUtils.isExpiredCachingTime(lastTime, compareTime: dateTimeTest);
      expect(isExpired, false);

      lastTime =  DateTime.parse("2020-11-27T22:15:00.000Z");
      isExpired = DateTimeUtils.isExpiredCachingTime(lastTime, compareTime: dateTimeTest);
      expect(isExpired, true);
    });
  });
}