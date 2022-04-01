import 'package:flutter/material.dart';

class ShowsScreenContentProvider extends ChangeNotifier {
  bool _isHidden = false;

  bool get isHidden => _isHidden;

  void switchContent() {
    _isHidden = !_isHidden;
    notifyListeners();
  }
}
