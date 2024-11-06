import 'package:app_agendamento/features/auth/data/results/sign_up_failed_result.dart';
import 'package:app_agendamento/features/auth/models/sign_up_dto.dart';
import 'package:dio/dio.dart';

import '../../../core/helpers/result.dart';
import './results/login_failed_result.dart';
import '../models/user.dart';
import 'results/validate_token_failed_result.dart';

abstract class AuthDataSource {
  Future<Result<LoginFailed, User>> login(
      {required String email, required String password});
  Future<Result<ValidateTokenFailed, User>> validateToken(String token);
  Future<Result<SignUpFailed, User>> signUp(SignUpDto signUpDto);
}

class RemoteAuthDataSource implements AuthDataSource {
  final Dio _dio;
  RemoteAuthDataSource(this._dio);

  @override
  Future<Result<LoginFailed, User>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio
          .post('/v1-sign-in', data: {'email': email, 'password': password});
      return Success(User.fromJson(response.data['result']));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return const Failure(LoginFailed.offline);
      } else if (e.response?.statusCode == 404) {
        return const Failure(LoginFailed.invalidCredentials);
      }
      return const Failure(LoginFailed.unknownError);
    } catch (_) {
      return const Failure(LoginFailed.unknownError);
    }
  }

  @override
  Future<Result<ValidateTokenFailed, User>> validateToken(String token) async {
    try {
      final response = await _dio.post('/v1-get-user',
          options: Options(headers: {
            'x-parse-session-token': token,
          }));
      return Success(User.fromJson(response.data['result']));
    } on DioException {
      return const Failure(ValidateTokenFailed.invalidToken);
    } catch (_) {
      return const Failure(ValidateTokenFailed.unknownError);
    }
  }

  @override
  Future<Result<SignUpFailed, User>> signUp(SignUpDto signUpDto) async {
    try {
      final response = await _dio.post('/v1-sign-up', data: signUpDto.toJson());
      return Success(User.fromJson(response.data['result']));
    } catch (_) {
      return const Failure(SignUpFailed.unknownError);
    }
  }
}
