class TodoReportModel {
  final int id;
  final int dateTime;
  final String? title;
  final String? stamp;

  TodoReportModel({
    required this.id,
    required this.dateTime,
    this.title,
    this.stamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateTime': dateTime,
      'title': title,
      'stamp': stamp,
    };
  }
}
