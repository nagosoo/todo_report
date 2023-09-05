import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_report/ui/todo_report/result_report_view.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {

  DateTime? _selectedDay;

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
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              DateTime _date = DateTime(date.year, date.month, date.day);
              // if ( isSameDay(_date, _selectedDay )) {
              //   return Container(
              //     width: MediaQuery.of(context).size.width * 0.11,
              //     padding: const EdgeInsets.only(bottom: 5),
              //     decoration:  BoxDecoration(
              //       color: Colors.orange.withOpacity(0.7),
              //       shape: BoxShape.circle,
              //     ),
              //   );
              // }
              return null;
            },
          ),
          calendarStyle: const CalendarStyle(
            weekendTextStyle: TextStyle(color: Colors.red),
            holidayTextStyle: TextStyle(color: Colors.red),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
              });
            }
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
