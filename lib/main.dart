import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'ui/calendar_view.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalendarView(),
    );
  }
}
