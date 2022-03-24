import 'package:dio/dio.dart';
import 'package:tv_shows/models/auth_info.dart';
import 'package:tv_shows/models/auth_info_holder.dart';
import 'package:tv_shows/models/auth_info_interceptor.dart';
import 'package:tv_shows/models/error_extractor_interceptor.dart';
import 'package:tv_shows/models/show.dart';
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
  final AuthInfoHolder _authInfoHolder;

  Future<User?> registerUser(String email, String password) async {
    try {
      var response = await _dio.post('/users', data: {
        'email': email,
        'password': password,
        'password_confirmation': password,
      });

      final info = AuthInfo.fromHeaderMap(response.headers.map);
      _authInfoHolder.setInfo(info);

      print('This is the success register message');
      return User.fromJson(response.data['user']);
    } catch (e) {
      print('This is the error register message');
      print(e);
      return null;
    }
  }

  Future<User> loginUser(String email, String password) async {
    try {
      var response = await _dio.post('/users/sign_in', data: {
        'email': email,
        'password': password,
      });
      final info = AuthInfo.fromHeaderMap(response.headers.map);
      _authInfoHolder.setInfo(info);

      print('This is the success login message');
      return User.fromJson(response.data['user']);
    } catch (e) {
      print('This is the error login message');
      print(e);
      return User.empty();
    }
  }

  Future<List<Show>> fetchShows() async {
    try {
      var response = await _dio.get('/shows');
      print('radi li ovo');
      return [];
    } catch (e) {
      print('This is the error fetchShows message');
      print(e);
      return [];
    }
  }
}
