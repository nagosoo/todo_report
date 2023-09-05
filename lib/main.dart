import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_report/asset/asset_color.dart';

import 'ui/calendar_view.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData(
          trackColor:
              MaterialStateProperty.all<Color>(AssetColor.greyScrollbar),
          thumbColor: MaterialStateProperty.all<Color>(AssetColor.green),
        ),
      ),
      home: const CalendarView(),
    );
  }
}
