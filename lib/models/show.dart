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
          'Ricky Gervais\' prime comedy lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporcdconsectetur adipiscing elit, sed do eiusmod tempor consectetur adipiscing elit, sed do eiusmod tempor',
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
    Show(
      name: 'Show with zero reviews',
      description:
          'The Office is an American mockumentary sitcom television  series that depicts the everyday work lives of office employees in the Scranton, Pennsylvania, branch of the fictional Dunder Mifflin Paper Company. It aired on NBC from March 24, 2005, to May 16, 2013, lasting a total of nine seasons.',
      numOfReviews: 0,
      averageRating: 0,
      imageUrl: Assets.images.icStrangerThings.path,
    ),
  ];
}

class ShowsProvider extends ChangeNotifier {
  List<Show> getAllShows() {
    return Show.allShows;
  }
}
