import 'package:todo_report/datasource/local/app_database.dart';
import 'package:todo_report/model/short_rating_model.dart';
import 'package:todo_report/model/todo_report_model.dart';
import 'package:todo_report/util/ext.dart';

class EventRepository {
  EventRepository._privateConstructor();

  static final EventRepository _instance =
      EventRepository._privateConstructor();

  factory EventRepository() {
    return _instance;
  }

  //todoReportModel나 shortRating이 있는 날짜의 map을 리턴
  Future<Map<DateTime, List<bool>>> getMapThatHaveEvent() async {
    List<DateTime> todoReportDays = await getTodoReportDays();
    List<DateTime> shortRatingForMonth = await getShortRatingForMonth();

    List<DateTime> allEventDays = [...todoReportDays, ...shortRatingForMonth];

    Map<DateTime, List<bool>> events = {
      for (var date in allEventDays) date: [true]
    };
    return events;
  }

  //todoReportModel가 있는 날짜 리스트를 리턴
  Future<List<DateTime>> getTodoReportDays() async {
    List<TodoReportModel> todoReportForMonth =
        await AppDatabase().getAllTodoReport();

    todoReportForMonth.removeWhere((e) =>
        (e.title?.isEmpty ?? true) &&
        ((e.stamp?.contains('도장없음') == true) || (e.stamp?.isEmpty ?? true)));

    List<DateTime> result = todoReportForMonth
        .map((e) => e.dateTime!.toDateTimeFromMicrosecondsSinceEpoch()!)
        .toList();
    return result;
  }

  //shortRating이 있는 날짜 리스트를 리턴
  Future<List<DateTime>> getShortRatingForMonth() async {
    List<ShortRatingModel> shortRatingForMonth =
        await AppDatabase().getAllShortRating();
    shortRatingForMonth.removeWhere((e) => e.rating?.isEmpty ?? true);

    List<DateTime> result = shortRatingForMonth
        .map((e) => e.dateTime!.toDateTimeFromMicrosecondsSinceEpoch()!)
        .toList();
    return result;
  }
}
