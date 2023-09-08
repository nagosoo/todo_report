import 'package:flutter/cupertino.dart';
import 'package:todo_report/model/short_rating_model.dart';
import 'package:todo_report/model/todo_report_model.dart';

class ShortRatingViewModel with ChangeNotifier {
  ShortRatingModel? _shortRating;

  ShortRatingModel? get shortRating => _shortRating;

  void modifyShortRating(ShortRatingModel shortRating) {
    _shortRating = shortRating;
    notifyListeners();
  }
}
