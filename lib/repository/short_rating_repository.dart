import 'package:flutter/cupertino.dart';
import 'package:todo_report/model/short_rating_model.dart';
import 'package:todo_report/util/ext.dart';

import '../datasource/local/app_database.dart';

class ShortRatingRepository with ChangeNotifier {
  ShortRatingRepository._privateConstructor();

  static final ShortRatingRepository _instance =
      ShortRatingRepository._privateConstructor();

  factory ShortRatingRepository() {
    return _instance;
  }

  Future<ShortRatingModel> getShortRatingDB(DateTime dateTime) async {
    return await AppDatabase().getShortRatingModelWithDate(
        dateTime.toMicrosecondsSinceEpochFromDateTime());
  }

  updateShortRatingDB(ShortRatingModel shortRatingModel) async {
    await AppDatabase().updateShortRatingModel(shortRatingModel);
  }

  insertShortRatingDB(ShortRatingModel shortRatingModel) async {
    await AppDatabase().insertShortRatingModel(shortRatingModel);
  }
}
