import 'package:app_agendamento/features/auth/models/cell_phone.dart';
import 'package:app_agendamento/features/auth/models/cpf.dart';
import 'package:app_agendamento/features/auth/models/full_name.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
}
