import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/helpers/result.dart';
import './results/login_failed_result.dart';
import '../models/user.dart';

class AuthDatasource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://parseapi.back4app.com/functions',
      headers: {
        'X-Parse-Application-Id': 'rC6gTn3o6JFMjSAnmKWTm7YFnKRWeOpEEHHcRoER',
        'X-Parse-REST-API-Key': 'M7zGDkCPUn1fAbbBMtgZIhxmeB1E1EIZNZV4sedd'
      }
    )
  )..interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));

  Future<Result<LoginFailedResult, User>> login({required String email, required String password}) async {
    try {
      final response = await _dio.post('/v1-sign-in', data: { 'email': email, 'password': password });
      return Success(User.fromMap(response.data['result']));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return const Failure(LoginFailedResult.offline);
      }
      else if (e.response?.statusCode == 404) {
        return const Failure(LoginFailedResult.invalidCredentials);
      }
      return const Failure(LoginFailedResult.unknowError);
    } catch (_) {
      return const Failure(LoginFailedResult.unknowError);
    }
  }
}
