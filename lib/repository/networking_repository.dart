import 'package:dio/dio.dart';
import 'package:tv_shows/models/auth_info.dart';
import 'package:tv_shows/models/auth_info_holder.dart';
import 'package:tv_shows/models/auth_info_interceptor.dart';
import 'package:tv_shows/models/error_extractor_interceptor.dart';
import 'package:tv_shows/models/register_info.dart';
import 'package:tv_shows/models/review.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/models/sign_in_info.dart';
import 'package:tv_shows/models/user.dart';

import '../providers/review_provider.dart';

class NetworkingRepository {
  NetworkingRepository(this._authInfoHolder) {
    final options = BaseOptions(baseUrl: 'https://tv-shows.infinum.academy');

    _dio = Dio(options);
    _dio.interceptors.addAll([
      AuthInfoInterceptor(_authInfoHolder),
      ErrorExtractorInterceptor(),
    ]);
  }

  late final Dio _dio;
  final AuthInfoHolder _authInfoHolder;

  Future<User> registerUser(RegisterInfo registerInfo) async {
    try {
      var response = await _dio.post(
        '/users',
        data: registerInfo.toJson(),
      );

      final info = AuthInfo.fromHeaderMap(response.headers.map);
      _authInfoHolder.setInfo(info);

      print('This is the success register message');
      return User.fromJson(response.data['user']);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> loginUser(SignInInfo loginInfo) async {
    try {
      var response = await _dio.post(
        '/users/sign_in',
        data: loginInfo.toJson(),
      );

      final info = AuthInfo.fromHeaderMap(response.headers.map);
      _authInfoHolder.setInfo(info);

      print('This is the success login message');
      return User.fromJson(response.data['user']);
    } catch (error) {
      print('This is the error login message');
      print(error);
      rethrow;
    }
  }

  // TODO: showsPrvovider micati
  Future<List<Show>> fetchShows() async {
    try {
      var response = await _dio.get('/shows');
      var listResponse = response.data['shows'];

      return listResponse.map((element) => Show.fromJson(element)).toList();
    } catch (e) {
      print('This is the error fetchShows message');
      print(e);
      rethrow;
      // return [];
    }
  }

  // TODO:
  Future<List<Review>> fetchReviews(Show show, ReviewProvider reviewProvider) async {
    try {
      reviewProvider.clear();
      var response = await _dio.get('/shows/${show.id}/reviews');
      var listResponse = response.data['reviews'];

      listResponse.asMap().forEach((index, element) {
        Review review = Review.fromJson(listResponse[index]);
        reviewProvider.addReview(review);
      });

      return reviewProvider.getAllReviews();
    } catch (e) {
      print('This is the error fetchReviews message');
      print(e);
      return [];
    }
  }

  Future<Review> addReview(Review review) async {
    try {
      var response = await _dio.post('/reviews', data: {
        'comment': review.comment,
        'rating': review.rating,
        'show_id': review.showId,
      });

      // print(response.data['review']);
      return Review.fromJson(response.data['review']);
    } catch (e) {
      print("This is the error addReview message");
      print(e);

      return Review.empty();
    }
  }
}
