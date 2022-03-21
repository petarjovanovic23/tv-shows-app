import 'package:dio/dio.dart';
import 'package:tv_shows/models/auth_info_holder.dart';
import 'package:tv_shows/models/auth_info_interceptor.dart';
import 'package:tv_shows/models/error_extractor_interceptor.dart';

class NetworkingRepository {
  NetworkingRepository(AuthInfoHolder authInfoHolder) {
    final options = BaseOptions(baseUrl: 'https://tv-shows.infinum.academy');

    _dio = Dio(options);
    _dio.interceptors.addAll([
      AuthInfoInterceptor(authInfoHolder),
      ErrorExtractorInterceptor(),
    ]);
  }

  late final Dio _dio;
}
