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
}

extension IntParsing on int? {
  DateTime? toDateTimeFromMicrosecondsSinceEpoch() {
    if (this == null) {
      return null;
    }
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(this!);
    return DateTime.utc(
        dateTime.year, dateTime.month, dateTime.day, 0, 0, 0, 0, 0);
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
