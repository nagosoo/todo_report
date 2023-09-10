import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_report/asset/asset_color.dart';
import 'package:todo_report/providers/event_provider.dart';
import 'package:todo_report/ui/todo_report/result_report_view.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    EventProvider eventProvider = EventProvider();
    eventProvider.getEventDayList();
    return ListenableBuilder(
        listenable: eventProvider,
        builder: (BuildContext context, child) {
          return Scaffold(
            body: SafeArea(
              child: TableCalendar(
                focusedDay: DateTime.now(),
                shouldFillViewport: true,
                firstDay: today.subtract(const Duration(days: 365)),
                lastDay: today.add(const Duration(days: 365)),
                locale: 'ko_KR',
                daysOfWeekHeight: 30,
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.red),
                ),
                weekendDays: const [DateTime.saturday, DateTime.sunday],
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                eventLoader: EventProvider().isDayHaveEvent,
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    if (events.isNotEmpty) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.06,
                        decoration: const BoxDecoration(
                          color: AssetColor.greenLight,
                          shape: BoxShape.circle,
                        ),
                      );
                    }
                    return null;
                  },
                ),
                calendarStyle: const CalendarStyle(
                  weekendTextStyle: TextStyle(color: Colors.red),
                  holidayTextStyle: TextStyle(color: Colors.red),
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultReportView(
                        dateTime: selectedDay,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
