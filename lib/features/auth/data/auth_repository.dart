import 'package:app_agendamento/core/device/app_secure_storage.dart';
import 'package:app_agendamento/features/auth/data/results/sign_up_failed_result.dart';
import 'package:app_agendamento/features/auth/data/results/validate_token_failed_result.dart';
import 'package:app_agendamento/features/auth/models/sign_up_dto.dart';

import '../../../core/helpers/result.dart';
import '../models/user.dart';
import './results/login_failed_result.dart';
import './auth_datasource.dart';

class AuthRepository {
  final AuthDataSource _dataSource;
  final AppSecureStorage _appSecureStorage;

  AuthRepository(this._dataSource, this._appSecureStorage);
  User? user;
  Future<Result<LoginFailed, User>> login(
      {required String email, required String password}) async {
    final result = await _dataSource.login(email: email, password: password);
    if (result case Success(object: final user)) {
      this.user = user;
    }
    return result;
  }

  Future<Result<ValidateTokenFailed, User>> validateToken() async {
    final token = await _appSecureStorage.getSessionToken();
    if (token == null) {
      return const Failure(ValidateTokenFailed.invalidToken);
    }
    final result = await _dataSource.validateToken(token);
    if (result case Success(object: final user)) {
      this.user = user;
    }
    return result;
  }

  Future<Result<SignUpFailed, User>> signUp(SignUpDto signUpDto) async {
    final result = await _dataSource.signUp(signUpDto);
    if (result case Success(object: final user)) {
      this.user = user;
    }
    return result;
  }
}
