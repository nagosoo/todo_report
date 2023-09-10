import 'package:flutter/material.dart';
import 'package:todo_report/model/short_rating_model.dart';
import 'package:todo_report/repository/short_rating_repository.dart';
import 'package:todo_report/util/ext.dart';

class ShortRatingProvider with ChangeNotifier {
  ShortRatingProvider._privateConstructor();

  static final ShortRatingProvider _instance =
      ShortRatingProvider._privateConstructor();

  factory ShortRatingProvider() {
    return _instance;
  }

  late ShortRatingModel _shortRating;

  ShortRatingModel get shortRating => _shortRating;

  getShortRating(DateTime datetime) async {
    _shortRating = ShortRatingModel();
    ShortRatingModel shortRatingModel =
        await ShortRatingRepository().getShortRatingDB(datetime);
    if (shortRatingModel.id != null) {
      _shortRating = shortRatingModel;
    } else {
      _shortRating = ShortRatingModel(
        dateTime: datetime.toMicrosecondsSinceEpochFromDateTime(),
      );
    }
    debugPrint('items: ${_shortRating.toString()}');
  }

  editTodoReport(ShortRatingModel shortRatingModel) {
    _shortRating = shortRatingModel;
  }

  saveShortRating() {
    if (_shortRating.id != null) {
      ShortRatingRepository().updateShortRatingDB(_shortRating);
    } else {
      ShortRatingRepository().insertShortRatingDB(_shortRating);
    }
  }
}
