import 'package:intl/intl.dart';

extension DateTimeParsing on DateTime {
  String getDayFromDateFormat() {
    return DateFormat('EEE', 'ko_KR').format(this);
  }
}
