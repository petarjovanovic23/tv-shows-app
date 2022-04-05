import 'package:flutter/material.dart';

import '../models/show.dart';

class CurrentShowProvider extends ChangeNotifier {
  late Show _currentShow;

  set currentShow(Show show) {
    _currentShow = show;
  }

  Show get currentShow => _currentShow;
}
