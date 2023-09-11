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
    TodoReportProvider todoReportProvider = TodoReportProvider();
    TextEditingController textEditingController = TextEditingController();
    String inputText = '';
    return ListenableBuilder(
        listenable: todoReportProvider,
        builder: (BuildContext context, child) {
          TodoReportModel todoReportModel =
              TodoReportProvider().todoReportList[index];
          if (todoReportModel.title != null && inputText.isEmpty) {
            textEditingController.text = todoReportModel.title!;
          }
          return TextField(
            onChanged: (newText) {
              inputText = newText;
              TodoReportProvider().editTodoReport(
                todoReportModel.copyWith(title: newText),
                index,
              );
            },
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
        });
  }
}
