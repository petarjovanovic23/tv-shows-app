import 'package:dio/dio.dart';

import 'auth_info_holder.dart';

class AuthInfoInterceptor extends Interceptor {
  AuthInfoInterceptor(this._authInfoHolder);
  final AuthInfoHolder _authInfoHolder;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_authInfoHolder.authInfo != null) {
      options.headers.addAll(_authInfoHolder.authInfo!.toHeaders());
    }
    super.onRequest(options, handler);
  }
}
