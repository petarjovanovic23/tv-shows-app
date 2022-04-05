import 'package:dio/dio.dart';

import 'storage_repository.dart';

class AuthInfoInterceptor extends Interceptor {
  AuthInfoInterceptor(this._authInfoHolder);
  final StorageRepository _authInfoHolder;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_authInfoHolder.authInfo != null) {
      options.headers.addAll(_authInfoHolder.authInfo!.toHeaders());
    }
    super.onRequest(options, handler);
  }
}
