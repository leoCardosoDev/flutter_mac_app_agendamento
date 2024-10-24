import 'package:app_agendamento/features/auth/data/results/validate_token_failed_result.dart';

import '../../../core/helpers/result.dart';
import '../models/user.dart';
import './results/login_failed_result.dart';
import './auth_datasource.dart';

class AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepository(this._dataSource);
  User? user;
  Future<Result<LoginFailed, User>> login(
      {required String email, required String password}) async {
    final result = await _dataSource.login(email: email, password: password);
    if (result case Success(object: final user)) {
      this.user = user;
    }
    return result;
  }

  Future<Result<ValidateTokenFailed, User>> getUser() async {
    final String token = 'sdfdff';
    final result = await _dataSource.validateToken(token);
    if (result case Success(object: final user)) {
      this.user = user;
    }
    return result;
  }
}
