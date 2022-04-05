import 'package:flutter/material.dart';

class RatingBarProvider extends ChangeNotifier {
  RatingBarProvider() : rating = 1;
  int rating;

  set setRating(int newRating) {
    rating = newRating;
    notifyListeners();
  }

  get getRating => rating;
}
