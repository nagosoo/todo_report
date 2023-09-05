import 'package:flutter/cupertino.dart';

class StampProvider with ChangeNotifier {
  String _stamp = '';

  String get stamp => _stamp;

  void chooseStamp(String stampAsset) {
    _stamp = stampAsset;
    notifyListeners();
  }
}
