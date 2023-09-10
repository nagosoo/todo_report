import 'package:intl/intl.dart';
import 'package:todo_report/util/enum.dart';

extension DateTimeParsing on DateTime {
  String getDayFromDateFormat() {
    return DateFormat('EEE', 'ko_KR').format(this);
  }

  int toMicrosecondsSinceEpochFromDateTime() {
    DateTime dateTime = DateTime(year, month, day, 0, 0, 0, 0, 0);
    return dateTime.microsecondsSinceEpoch;
  }

  int toFirstDayOfMonth() {
    DateTime dateTime = DateTime(year, month, 1, 0, 0, 0, 0, 0);
    return dateTime.microsecondsSinceEpoch;
  }

  int toLastDayOfMonth() {
    DateTime dateTime =
        DateTime(year, month, getLastDayOfMonth(year, month), 0, 0, 0, 0, 0);
    return dateTime.microsecondsSinceEpoch;
  }

  bool checkLeapYear(int year) {
    if (year % 4 != 0) {
      // 4의 배수가 아닌 경우 윤년이 아닙니다.
      return false;
    } else if (year % 100 != 0) {
      // 4의 배수이지만 100의 배수가 아닌 경우 윤년입니다.
      return true;
    } else if (year % 400 != 0) {
      // 100의 배수이지만 400의 배수가 아닌 경우 윤년이 아닙니다.
      return false;
    } else {
      // 400의 배수인 경우 윤년입니다.
      return true;
    }
  }

  int getLastDayOfMonth(int year, int month) {
    bool isLeapYear = checkLeapYear(year);

    // 해당 달의 다음 달의 첫 날을 구합니다.
    DateTime nextMonth = DateTime(year, month + 1, 1);

    // 다음 달의 첫 날에서 하루를 빼서 현재 달의 마지막 날을 얻습니다.
    DateTime lastDayOfMonth = nextMonth.subtract(Duration(days: 1));

    // 윤년인 경우 2월의 마지막 날은 29일이므로 29일보다 큰 경우 29를 반환합니다.
    if (isLeapYear && month == DateTime.february) {
      return 29;
    }

    // 그 외의 경우에는 해당 달의 마지막 날을 반환합니다.
    return lastDayOfMonth.day;
  }
}

extension IntParsing on int {
  DateTime toDateTimeFromMicrosecondsSinceEpoch() {
    DateTime dateTime= DateTime.fromMicrosecondsSinceEpoch(this);
    return DateTime.utc(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0, 0, 0);
  }
}

extension GetImgType on String {
  ImgType getImgType() {
    if (contains('svg')) {
      return ImgType.svg;
    } else {
      return ImgType.png;
    }
  }
}
