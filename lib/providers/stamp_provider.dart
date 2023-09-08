import 'package:flutter/cupertino.dart';

class StampProvider with ChangeNotifier {
  String? _stamp;

  String? get stamp => _stamp;

  void chooseStamp(String stampAsset) {
    if (stampAsset.contains('도장없음')) {
      clearStamp();
      return;
    }
    _stamp = stampAsset;
    notifyListeners();
  }

  void clearStamp() {
    _stamp = null;
    notifyListeners();
  }
}
