import 'package:flutter/material.dart';
import 'package:todo_report/ui/todo_report/top_widget.dart';

import 'rating_text_field.dart';
import 'table_widget.dart';

class ResultReportView extends StatelessWidget {
  const ResultReportView({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopWidget(
                  dateTime: dateTime,
                ),
                TableWidget(
                  dateTime: dateTime,
                ),
                const RatingTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
