import 'package:app_agendamento/features/auth/models/email.dart';
import 'package:app_agendamento/features/auth/models/password.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState.empty());

  Future<void> onLoginPressed() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }

  Future<void> onEmailChanged(String value) async {
    emit(state.copyWith(email: Email.dirty(value)));
  }

  Future<void> onPasswordChanged(String value) async {
    emit(state.copyWith(password: Password.dirty(value, false)));
  }
}
