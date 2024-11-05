import 'package:app_agendamento/features/auth/models/cell_phone.dart';
import 'package:app_agendamento/features/auth/models/cpf.dart';
import 'package:app_agendamento/features/auth/models/email.dart';
import 'package:app_agendamento/features/auth/models/full_name.dart';
import 'package:app_agendamento/features/auth/models/password.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(const SignupState.empty());

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
}
