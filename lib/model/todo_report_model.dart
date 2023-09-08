class TodoReportModel {
  final int? id;
  int? dateTime;
  String? title;
  String? stamp;

  TodoReportModel({
    this.id,
    this.dateTime,
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
