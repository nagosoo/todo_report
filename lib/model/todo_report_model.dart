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

  TodoReportModel copyWith({
    int? id,
    int? dateTime,
    String? title,
    String? stamp,
  }) {
    return TodoReportModel(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      title: title ?? this.title,
      stamp: stamp ?? this.stamp,
    );
  }

  @override
  String toString() {
    return "TodoReportModel(id: $id, dateTime: $dateTime, title: $title, stamp: $stamp)";
  }
}
