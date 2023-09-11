import 'package:flutter/material.dart';
import 'package:todo_report/providers/short_rating_provider.dart';
import 'package:todo_report/providers/todo_report_provider.dart';
import 'package:todo_report/ui/todo_report/top_widget.dart';

import 'rating_text_field.dart';
import 'table_widget.dart';

class ResultReportView extends StatelessWidget {
  const ResultReportView({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  Future<dynamic> _getTodoReport() async {
    await TodoReportProvider().getTodoReportList(dateTime);
  }

  Future<dynamic> _getShortRating() async {
    await ShortRatingProvider().getShortRating(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    Future.wait([_getTodoReport(), _getShortRating()]);
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
                const TableWidget(),
                const RatingTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
