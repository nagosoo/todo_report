import 'package:intl/intl.dart';
import 'package:todo_report/util/enum.dart';

extension DateTimeParsing on DateTime {
  String getDayFromDateFormat() {
    return DateFormat('EEE', 'ko_KR').format(this);
  }

  int getMicrosecondsSinceEpochFromDateTime() {
    return microsecondsSinceEpoch;
  }
}

extension IntParsing on int {
  DateTime getDateTimeFromMicrosecondsSinceEpoch() {
    return DateTime.fromMicrosecondsSinceEpoch(this);
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
