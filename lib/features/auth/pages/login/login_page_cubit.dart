import 'package:app_agendamento/core/di/di.dart';
import 'package:app_agendamento/core/helpers/result.dart';
import 'package:app_agendamento/core/widgets/alert/cubit/alert_area_cubit.dart';
import 'package:app_agendamento/features/auth/data/auth_repository.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed_result.dart';
import 'package:app_agendamento/features/auth/models/email.dart';
import 'package:app_agendamento/features/auth/models/password.dart';
import 'package:app_agendamento/features/auth/pages/login/login_page_actions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  final AuthRepository _authRepository;
  final AlertAreaCubit _alertAreaCubit;
  final LoginPageActions _actions;

  LoginPageCubit(
    this._actions, {
    AuthRepository? authRepository,
    AlertAreaCubit? alertAreaCubit,
  })  : _authRepository = authRepository ?? getIt(),
        _alertAreaCubit = alertAreaCubit ?? getIt(),
        super(const LoginPageState.empty());

  Future<void> onLoginPressed() async {
    emit(state.copyWith(isLoading: true));
    final result = await _authRepository.login(
      email: state.email.value,
      password: state.password.value,
    );
    switch (result) {
      case Success():
        _actions.navToHome();
      case Failure(error: final error):
        _alertAreaCubit.showAlert(Alert.error(
            title: switch (error) {
          LoginFailed.invalidCredentials => 'E-mail/Senha inválidos',
          LoginFailed.offline => 'Verifique sua conexão com a internet',
          _ =>
            'Falha desconhecida ao realizar o login. Tente novamente mais tarde!',
        }));
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> onEmailChanged(String value) async {
    emit(state.copyWith(email: Email.dirty(value)));
  }

  Future<void> onPasswordChanged(String value) async {
    emit(state.copyWith(password: Password.dirty(value, false)));
  }
}
