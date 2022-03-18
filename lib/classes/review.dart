import 'package:flutter/cupertino.dart';
import 'package:tv_shows/gen/assets.gen.dart';

class Review {
  String comment;
  int rating;
  String userEmail;
  String imageUrl;

  Review({
    required this.comment,
    required this.rating,
    required this.userEmail,
    required this.imageUrl,
  });

  static final allReviews = [
    Review(
      comment: 'This show is so good!!!',
      rating: 5,
      userEmail: 'test@gmail.com',
      imageUrl: Assets.images.icProfilePlaceholderPng.path,
    ),
    Review(
      comment: 'Sometimes maybe good sometimes maybe ...',
      rating: 3,
      userEmail: 'abasicuser@gmail.com',
      imageUrl: Assets.images.icProfilePlaceholderPng.path,
    ),
    Review(
      comment: 'OMG!! I can\'t believe they would add this on netflix',
      rating: 1,
      userEmail: 'angrycaren@gmail.com',
      imageUrl: Assets.images.icProfilePlaceholderPng.path,
    ),
    Review(
      comment: 'OMG!! I can\'t believe they would add this on netflix',
      rating: 1,
      userEmail: 'angrycaren@gmail.com',
      imageUrl: Assets.images.icProfilePlaceholderPng.path,
    ),
    Review(
      comment: 'OMG!! I can\'t believe they would add this on netflix',
      rating: 1,
      userEmail: 'angrycaren@gmail.com',
      imageUrl: Assets.images.icProfilePlaceholderPng.path,
    ),
  ];
}

class ReviewProvider extends ChangeNotifier {
  List<Review> getAllReviews() {
    return Review.allReviews;
  }
}
