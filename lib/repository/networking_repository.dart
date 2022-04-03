// import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tv_shows/models/auth_info.dart';
import 'package:tv_shows/models/auth_info_interceptor.dart';
import 'package:tv_shows/models/error_extractor_interceptor.dart';
import 'package:tv_shows/models/register_info.dart';
import 'package:tv_shows/models/review.dart';
import 'package:tv_shows/models/show.dart';
import 'package:tv_shows/models/sign_in_info.dart';
import 'package:tv_shows/models/storage_repository.dart';
import 'package:tv_shows/models/user.dart';

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
  final StorageRepository _authInfoHolder;

  Future<User> registerUser(RegisterInfo registerInfo) async {
    try {
      var response = await _dio.post(
        '/users',
        data: registerInfo.toJson(),
      );

      final info = AuthInfo.fromHeaderMap(response.headers.map);
      _authInfoHolder.setInfo(info);

      _authInfoHolder.store(response.data['user'], response.data['user']['id']);

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

      _authInfoHolder.store(
          response.data['user'], response.data['user']['email']);

      print('This is the success login message');
      return User.fromJson(response.data['user']);
    } catch (error) {
      print('This is the error login message');
      print(error);
      rethrow;
    }
  }

  Future<List<Show>> fetchShows() async {
    try {
      Response response = await _dio.get('/shows');
      List<Map<String, dynamic>> listResponse =
          List<Map<String, dynamic>>.from(response.data['shows']);

      return listResponse.map((element) => Show.fromJson(element)).toList();
    } catch (exception) {
      print('This is the error fetchShows message');
      print(exception);
      rethrow;
    }
  }

  Future<List<Review>> fetchReviews(Show show) async {
    try {
      var response = await _dio.get('/shows/${show.id}/reviews');
      var listResponse =
          List<Map<String, dynamic>>.from(response.data['reviews']);

      print('fetch reviews success');
      return listResponse.map((element) => Review.fromJson(element)).toList();
    } catch (exception) {
      print('This is the error fetchReviews message');
      print(exception);
      rethrow;
    }
  }

  Future<Review> addReview(Review review) async {
    try {
      if (review.comment == '') {
        throw Exception('No comment');
      }

      var response = await _dio.post('/reviews', data: {
        'comment': review.comment,
        'rating': review.rating,
        'show_id': review.showId,
      });

      return Review.fromJson(response.data['review']);
    } catch (exception) {
      print("This is the error addReview message");
      print(exception);

      rethrow;
    }
  }

  Future<User> updateUserData(String? email, PickedFile? image) async {
    try {
      late Response response;

      if ((email == '' || email == _authInfoHolder.authInfo!.uid) &&
          image != null) {
        String fileName = image.path.split('/').last;
        response = await _dio.put('/users',
            data: FormData.fromMap(
              {
                'image': await MultipartFile.fromFile(image.path,
                    filename: fileName),
              },
            ));
      } else if (image == null) {
        response = await _dio.put(
          '/users',
          data: {'email': email},
        );
      } else {
        String fileName = image.path.split('/').last;
        response = await _dio.put('/users',
            data: FormData.fromMap(
              {
                'email': email,
                'image': await MultipartFile.fromFile(image.path,
                    filename: fileName),
              },
            ));
      }

      final info = AuthInfo.fromHeaderMap(response.headers.map);
      _authInfoHolder.setInfo(info);

      return User.fromJson(response.data['user']);
    } catch (exception) {
      print('update user 2 exception');
      print(exception);
      rethrow;
    }
  }
}
