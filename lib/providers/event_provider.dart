import 'package:flutter/material.dart';
import 'package:todo_report/repository/event_repository.dart';

class EventProvider with ChangeNotifier {
  EventProvider._privateConstructor();

  static final EventProvider _instance = EventProvider._privateConstructor();

  factory EventProvider() {
    return _instance;
  }

  final Map<DateTime, List<bool>> _eventDayList = {};

  List<bool> isDayHaveEvent(DateTime dateTime) {
    return _eventDayList[dateTime] ?? [];
  }

  getEventDayList() async {
    _eventDayList.clear();
    Map<DateTime, List<bool>> eventsDayModelForMonth =
        await EventRepository().getMapThatHaveEvent();
    debugPrint('이벤트 있는 날 : ${eventsDayModelForMonth.toString()}');
    _eventDayList.addAll(eventsDayModelForMonth);
    notifyListeners();
  }
}
