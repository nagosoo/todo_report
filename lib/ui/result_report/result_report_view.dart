import 'package:flutter/material.dart';
import 'package:result_report/ui/result_report/top_widget.dart';

import 'list_widget.dart';

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
          child: Column(
            children:  [
              TopWidget(
                dateTime: dateTime,
              ),
              ListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
