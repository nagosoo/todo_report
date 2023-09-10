import 'package:todo_report/datasource/local/app_database.dart';
import 'package:todo_report/model/short_rating_model.dart';
import 'package:todo_report/model/todo_report_model.dart';
import 'package:todo_report/util/ext.dart';

class EventsRepository {
  EventsRepository._privateConstructor();

  static final EventsRepository _instance =
      EventsRepository._privateConstructor();

  factory EventsRepository() {
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
        .map((e) => e.dateTime!.toDateTimeFromMicrosecondsSinceEpoch())
        .toList();
    return result;
  }

  //shortRating이 있는 날짜 리스트를 리턴
  Future<List<DateTime>> getShortRatingForMonth() async {
    List<ShortRatingModel> shortRatingForMonth =
        await AppDatabase().getAllShortRating();
    shortRatingForMonth.removeWhere((e) => e.rating?.isEmpty ?? true);

    List<DateTime> result = shortRatingForMonth
        .map((e) => e.dateTime!.toDateTimeFromMicrosecondsSinceEpoch())
        .toList();
    return result;
  }

// //특정 달에 todoReportModel나 shortRating이 있는 날짜에 eventForModel을 리턴
// Future<Set<EventDayModel>> getEventsDayModelForMonth(
//   int year,
//   int month,
// ) async {
//   Set<EventDayModel> daysHaveEventList = {};
//   List<List<DateTime>> list = await Future.wait([
//     getTodoReportForMonth(
//       year,
//       month,
//     ),
//     getShortRatingForMonth(
//       year,
//       month,
//     )
//   ]);
//   for (var dateTimeListThatHaveEvent in list) {
//     for (var a in dateTimeListThatHaveEvent){
//       debugPrint('이벤트 있는 날 : ${a.toString()}');
//     }
//     daysHaveEventList.addAll(dateTimeListThatHaveEvent.map((dateTime) => EventDayModel(dateTime: dateTime)));
//   }
//   daysHaveEventList = daysHaveEventList.toSet();
//    daysHaveEventList.toList().sort((a, b) => a.dateTime.compareTo(b.dateTime));
//   for (var e in daysHaveEventList) {
//   }
//
//   return daysHaveEventList;
// }
//
// //특정 달에 todoReportModel가 있는 날짜 리스트를 리턴
// Future<List<DateTime>> getTodoReportForMonth(
//   int year,
//   int month,
// ) async {
//   List<TodoReportModel> todoReportForMonth =
//       await AppDatabase().getTodoReportForMonth(year, month);
//   for (var e in todoReportForMonth) {
//     if (e.title?.isEmpty == true && e.stamp?.isEmpty == true) {
//       todoReportForMonth.remove(e);
//     }
//   }
//
//   return todoReportForMonth
//       .map((e) => e.dateTime!.toDateTimeFromMicrosecondsSinceEpoch())
//       .toList();
// }
//
// //특정 달에 shortRating이 있는 날짜 리스트를 리턴
// Future<List<DateTime>> getShortRatingForMonth(
//   int year,
//   int month,
// ) async {
//   List<ShortRatingModel> shortRatingForMonth =
//       await AppDatabase().getShortRatingForMonth(year, month);
//   for (var e in shortRatingForMonth) {
//     if (e.rating?.isEmpty == true) {
//       shortRatingForMonth.remove(e);
//     }
//   }
//
//   return shortRatingForMonth
//       .map((e) => e.dateTime!.toDateTimeFromMicrosecondsSinceEpoch())
//       .toList();
// }
}
