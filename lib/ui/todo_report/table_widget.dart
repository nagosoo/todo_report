import 'package:flutter/material.dart';
import 'package:todo_report/model/todo_report_model.dart';
import 'package:todo_report/providers/todo_report_viewmodel.dart';
import 'package:todo_report/ui/todo_report/stamp_container.dart';
import 'package:todo_report/ui/todo_report/todo_text_field.dart';

import '../../asset/asset_color.dart';
import '../../asset/asset_font.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TodoReportViewModel().getTodoReportList(dateTime),
      builder: (BuildContext context,
          AsyncSnapshot<List<TodoReportModel?>> snapshot) {
        if (snapshot.hasData == true) {
          return Table(
            border: TableBorder.symmetric(
              inside: const BorderSide(
                color: AssetColor.greyDivider,
                width: 1,
              ),
              outside: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            columnWidths: const {
              0: FlexColumnWidth(0.65),
              1: FlexColumnWidth(0.35),
            },
            children: [
              TableRow(
                children: [
                  SizedBox(
                    height: 28,
                    child: Center(
                      child: Text(
                        '계획 및 일정',
                        style: AssetFont.bareunBatang600.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                    child: Center(
                      child: Text(
                        '수행결과',
                        style: AssetFont.bareunBatang600.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ...List.generate(
                10,
                (index) => TableRow(
                  children: [
                    TodoTextField(
                      index: index,
                      dateTime: dateTime,
                      title: snapshot.data![index]?.title,
                    ),
                    StampContainer(
                        index: index,
                        dateTime: dateTime,
                        stamp: snapshot.data![index]?.stamp),
                  ],
                ),
              )
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
