import 'package:flutter/cupertino.dart';
import 'package:todo_report/model/todo_report_model.dart';
import 'package:todo_report/ui/todo_report/stamp_container.dart';

import '../todo_text_field.dart';

class TodoReportProvider with ChangeNotifier {

  static List<GlobalKey<TodoTextFieldState>> todoTextFieldKey =
  List.generate(10, (index) => GlobalKey<TodoTextFieldState>());

  static List<GlobalKey<StampContainerState>> stampKey =
  List.generate(10, (index) => GlobalKey<StampContainerState>());

  final List<TodoReportModel> _todoReportList = [];

  List<TodoReportModel> get todoReportList => _todoReportList;

  void modifyTodoReport(List<TodoReportModel> todoReportList) {
    _todoReportList.addAll(todoReportList);
    notifyListeners();
  }
}
