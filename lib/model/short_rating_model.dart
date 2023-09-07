class ShortRatingModel {
  final int id;
  final int dateTime;
  final String? description;

  ShortRatingModel({
    required this.id,
    required this.dateTime,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateTime': dateTime,
      'description': description,
    };
  }
}
