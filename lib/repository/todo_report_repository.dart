import 'package:flutter/cupertino.dart';
import 'package:todo_report/datasource/local/app_database.dart';
import 'package:todo_report/model/todo_report_model.dart';
import 'package:todo_report/util/ext.dart';

class TodoReportRepository with ChangeNotifier {
  TodoReportRepository._privateConstructor();

  static final TodoReportRepository _instance =
      TodoReportRepository._privateConstructor();

  factory TodoReportRepository() {
    return _instance;
  }

  Future<List<TodoReportModel>> getTodoReportDB(DateTime dateTime) async {
    return await AppDatabase().getTodoReportModelWithDate(
        dateTime.toMicrosecondsSinceEpochFromDateTime());
  }

  updateTodoReportDB(TodoReportModel todoReportModel) async {
    await AppDatabase().updateTodoReportModel(todoReportModel);
  }

  insertTodoReportDB(TodoReportModel todoReportModel) async {
    await AppDatabase().insertTodoReportModel(todoReportModel);
  }
}
