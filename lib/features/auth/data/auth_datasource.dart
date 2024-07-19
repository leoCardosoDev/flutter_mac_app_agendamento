import 'package:dio/dio.dart';

import '../../../core/helpers/result.dart';
import './results/login_failed_result.dart';
import '../models/user.dart';

abstract class AuthDataSource {
  Future<Result<LoginFailedResult, User>> login({required String email, required String password});
}

class RemoteAuthDataSource implements AuthDataSource {
  final Dio _dio;
  RemoteAuthDataSource(this._dio);

  @override
  Future<Result<LoginFailedResult, User>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio
          .post('/v1-sign-in', data: {'email': email, 'password': password});
      return Success(User.fromMap(response.data['result']));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return const Failure(LoginFailedResult.offline);
      } else if (e.response?.statusCode == 404) {
        return const Failure(LoginFailedResult.invalidCredentials);
      }
      return const Failure(LoginFailedResult.unknowError);
    } catch (_) {
      return const Failure(LoginFailedResult.unknowError);
    }
  }
}
