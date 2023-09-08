import 'package:flutter/material.dart';
import 'package:todo_report/repository/todo_report_repository.dart';
import 'package:todo_report/util/ext.dart';

import '../model/todo_report_model.dart';

class TodoReportViewModel with ChangeNotifier {
  TodoReportViewModel._privateConstructor();

  static final TodoReportViewModel _instance =
      TodoReportViewModel._privateConstructor();

  factory TodoReportViewModel() {
    return _instance;
  }

  List<TodoReportModel> _todoReportList = List.generate(10, (index) => TodoReportModel());

  List<TodoReportModel> get todoReportList => _todoReportList;

  initTodoReportList() {
    _todoReportList = List.generate(10, (index) => TodoReportModel());
  }

   Future<List<TodoReportModel?>> getTodoReportList(DateTime datetime) async {
    List<TodoReportModel> todoReportList =
        await TodoReportRepository().getTodoReportDB(datetime);
    initTodoReportList();
    _todoReportList.addAll(todoReportList);
    return _todoReportList;
  }

  editTodoReportTitle(String? title, DateTime dateTime, int index) {
    todoReportList[index].title = title;
    todoReportList[index].dateTime =
        dateTime.toMicrosecondsSinceEpochFromDateTime();
  }

  editTodoReportStamp(String? stamp, DateTime dateTime, int index) {
    todoReportList[index].stamp = stamp;
    todoReportList[index].dateTime =
        dateTime.toMicrosecondsSinceEpochFromDateTime();
  }
}
