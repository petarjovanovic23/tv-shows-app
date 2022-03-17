import 'package:flutter/material.dart';

class Show {
  String name;
  String description;
  int numOfReviews;
  double averageRating;
  String imageUrl;

  Show({
    required this.name,
    required this.description,
    required this.numOfReviews,
    required this.averageRating,
    required this.imageUrl,
  });

  static final allShows = [
    Show(
      name: 'The Office',
      description: 'Ricky Gervais\' prime comedy',
      numOfReviews: 10,
      averageRating: 4.5,
      imageUrl: 'assets/images/ic_office.svg',
    ),
    Show(
      name: 'Krv nije voda',
      description: 'Samo neka drama',
      numOfReviews: 452,
      averageRating: 3.5,
      imageUrl: 'assets/images/krv_nije_voda.svg',
    ),
    Show(
      name: 'Stranger things',
      description: 'Televisa Netflix presenta',
      numOfReviews: 75,
      averageRating: 4.9,
      imageUrl: 'assets/images/stranger-things-poster.svg',
    ),
  ];
}

class ShowsProvider extends ChangeNotifier {}
