import 'package:app_agendamento/core/di/di.dart';
import 'package:app_agendamento/core/helpers/result.dart';
import 'package:app_agendamento/core/widgets/alert/cubit/alert_area_cubit.dart';
import 'package:app_agendamento/features/auth/data/auth_repository.dart';
import 'package:app_agendamento/features/auth/models/cell_phone.dart';
import 'package:app_agendamento/features/auth/models/cpf.dart';
import 'package:app_agendamento/features/auth/models/email.dart';
import 'package:app_agendamento/features/auth/models/full_name.dart';
import 'package:app_agendamento/features/auth/models/password.dart';
import 'package:app_agendamento/features/auth/models/sign_up_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;
  final AlertAreaCubit _alertAreaCubit;

  SignupCubit({
    AuthRepository? authRepository,
    AlertAreaCubit? alertAreaCubit,
  })  : _authRepository = authRepository ?? getIt(),
        _alertAreaCubit = alertAreaCubit ?? getIt(),
        super(const SignupState.empty());

  void onFullNameChanged(String s) {
    emit(state.copyWith(fullName: FullName.dirty(s)));
  }

  void onCpfChanged(String s) {
    emit(state.copyWith(cpf: Cpf.dirty(s)));
  }

  void onCellPhoneChanged(String s) {
    emit(state.copyWith(cellPhone: CellPhone.dirty(s)));
  }

  void onEmailChanged(String s) {
    emit(state.copyWith(email: Email.dirty(s)));
  }

  void onPasswordChanged(String s) {
    emit(state.copyWith(password: Password.dirty(s)));
  }

  Future<void> onSignUpPressed() async {
    emit(state.copyWith(isLoading: true));
    final result = await _authRepository.signUp(
      SignUpDto(
          fullName: state.fullName.value,
          cpf: state.cpf.value,
          cellPhone: state.cellPhone.value,
          email: state.email.value,
          password: state.password.value),
    );
    switch (result) {
      case Success(object: final _):
        break;
      case Failure(error: final error):
        _alertAreaCubit.showAlert(Alert.error(
            title:
                'Não foi possivel criar a sua conta! Tente mais tarde! ERROR: $error'));
    }
    emit(state.copyWith(isLoading: false));
  }
}
