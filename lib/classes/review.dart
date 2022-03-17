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
      imageUrl: 'assets/images/ic_profile_placeholder.svg',
    ),
    Review(
      comment: 'Sometimes maybe good sometimes maybe ...',
      rating: 3,
      userEmail: 'abasicuser@gmail.com',
      imageUrl: 'assets/images/ic_profile_placeholder.svg',
    ),
    Review(
      comment: 'OMG!! I can\'t believe they would add this on netflix',
      rating: 1,
      userEmail: 'angrycaren@gmail.com',
      imageUrl: 'assets/images/ic_profile_placeholder.svg',
    ),
    Review(
      comment: 'OMG!! I can\'t believe they would add this on netflix',
      rating: 1,
      userEmail: 'angrycaren@gmail.com',
      imageUrl: 'assets/images/ic_profile_placeholder.svg',
    ),
    Review(
      comment: 'OMG!! I can\'t believe they would add this on netflix',
      rating: 1,
      userEmail: 'angrycaren@gmail.com',
      imageUrl: 'assets/images/ic_profile_placeholder.svg',
    ),
  ];
}
