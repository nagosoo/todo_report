import 'package:flutter/material.dart';
import 'package:result_report/ui/result_report/result_report_view.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
          shouldFillViewport: true,
          firstDay: today.subtract(const Duration(days: 365)),
          lastDay: today.add(const Duration(days: 365)),
          focusedDay: DateTime.now(),
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
  }
}
