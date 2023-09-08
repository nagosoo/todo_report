import 'package:flutter/material.dart';
import 'package:todo_report/providers/todo_report_viewmodel.dart';

import '../../asset/asset_font.dart';

class TodoTextField extends StatelessWidget {
  const TodoTextField({super.key, required this.index, required this.dateTime, this.title});

  final int index;
  final DateTime dateTime;
  final  String? title;

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    if(title!=null) {textEditingController.text = title!;}
    textEditingController.addListener(() {
      TodoReportViewModel()
          .editTodoReportTitle(textEditingController.text, dateTime, index);
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
