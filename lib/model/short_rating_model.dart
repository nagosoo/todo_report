class ShortRatingModel {
  final int? id;
  final int? dateTime;
  final String? rating;

  ShortRatingModel({
    this.id,
    this.dateTime,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateTime': dateTime,
      'rating': rating,
    };
  }

  ShortRatingModel copyWith({
    int? id,
    int? dateTime,
    String? rating,
  }) {
    return ShortRatingModel(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      rating: rating ?? this.rating,
    );
  }

  @override
  String toString() {
    return "ShortRatingModel(id: $id, dateTime: $dateTime, rating: $rating)";
  }
}
