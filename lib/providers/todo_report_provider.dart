import 'package:flutter/material.dart';
import 'package:todo_report/repository/todo_report_repository.dart';
import 'package:todo_report/util/ext.dart';

import '../model/todo_report_model.dart';

class TodoReportProvider with ChangeNotifier {
  TodoReportProvider._privateConstructor();

  static final TodoReportProvider _instance =
      TodoReportProvider._privateConstructor();

  factory TodoReportProvider() {
    return _instance;
  }

  late List<TodoReportModel> _todoReportList;

  List<TodoReportModel> get todoReportList => _todoReportList;

  getTodoReportList(DateTime datetime) async {
    List<TodoReportModel> todoReportList =
        await TodoReportRepository().getTodoReportDB(datetime);
    if (todoReportList.isEmpty) {
      _todoReportList = List.generate(
          10,
          (index) => TodoReportModel(
                dateTime: datetime.toMicrosecondsSinceEpochFromDateTime(),
              ));
      return;
    }
    _todoReportList = todoReportList;
    notifyListeners();
  }

  editTodoReport(TodoReportModel todoReportModel, int index) {
    _todoReportList[index] = todoReportModel;
    notifyListeners();
  }

  saveTodoReport() {
    for (TodoReportModel e in _todoReportList) {
      if (e.id != null) {
        TodoReportRepository().updateTodoReportDB(e);
      } else {
        TodoReportRepository().insertTodoReportDB(e);
      }
    }
  }
}
