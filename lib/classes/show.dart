import 'package:flutter/material.dart';
import 'package:tv_shows/gen/assets.gen.dart';

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
      description:
          'Ricky Gervais\' prime comedy lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
      numOfReviews: 10,
      averageRating: 4.5,
      imageUrl: Assets.images.icOffice.path,
    ),
    Show(
      name: 'Krv nije voda',
      description: 'Samo neka drama',
      numOfReviews: 452,
      averageRating: 3.5,
      imageUrl: Assets.images.krvNijeVoda.path,
    ),
    Show(
      name: 'Stranger things',
      description: 'Televisa Netflix presenta',
      numOfReviews: 75,
      averageRating: 4.9,
      imageUrl: Assets.images.icStrangerThings.path,
    ),
  ];
}

class ShowsProvider extends ChangeNotifier {
  List<Show> getAllShows() {
    return Show.allShows;
  }
}
