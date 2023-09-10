import 'package:flutter/material.dart';
import 'package:todo_report/model/todo_report_model.dart';
import 'package:todo_report/providers/todo_report_provider.dart';

import '../../asset/asset_font.dart';

class TodoTextField extends StatelessWidget {
  const TodoTextField({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    TodoReportModel todoReportModel =
        TodoReportProvider().todoReportList[index];
    if (todoReportModel.title != null) {
      textEditingController.text = todoReportModel.title!;
    }
    textEditingController.addListener(() {
      TodoReportProvider().editTodoReport(
        todoReportModel.copyWith(title: textEditingController.text),
        index,
      );
    });
    return TextField(
      minLines: 1,
      maxLines: 2,
      controller: textEditingController,
      textAlign: TextAlign.center,
      style: AssetFont.mapoAgape400.copyWith(
        fontSize: 20,
        overflow: TextOverflow.ellipsis,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}
