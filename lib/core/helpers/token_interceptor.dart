import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: Remover comentário
    // options.headers['X-Parse-Session-Token'] = '123';
    handler.next(options);
  }
}
