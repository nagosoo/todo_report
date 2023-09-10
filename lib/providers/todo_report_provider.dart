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
    _todoReportList = List.generate(10, (index) => TodoReportModel());
    List<TodoReportModel> todoReportList =
        await TodoReportRepository().getTodoReportDB(datetime);
    _todoReportList.clear();
    _todoReportList.addAll(todoReportList);
    for (int i = _todoReportList.length; i < 10; i++) {
      _todoReportList.add(TodoReportModel(
          dateTime: datetime.toMicrosecondsSinceEpochFromDateTime()));
    }

    for (var e in _todoReportList) {
      debugPrint('items: ${e.toString()}');
    }
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
