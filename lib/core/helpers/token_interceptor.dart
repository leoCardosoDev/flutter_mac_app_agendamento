import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: Remover comentário
    //options.headers['X-Parse-Session-Token'] = 'r:a7d593fb38abac5c912bbdfc94c7ebb5';
    handler.next(options);
  }
}
