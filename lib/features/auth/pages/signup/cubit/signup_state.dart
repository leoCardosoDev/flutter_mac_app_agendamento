part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final FullName fullName;
  final Cpf cpf;
  final CellPhone cellPhone;
  const SignupState({
    required this.fullName,
    required this.cpf,
    required this.cellPhone,
  });
  const SignupState.empty()
      : fullName = const FullName.pure(),
        cpf = const Cpf.pure(),
        cellPhone = const CellPhone.pure();

  @override
  List<Object> get props => [fullName];

  SignupState copyWith({
    FullName? fullName,
    Cpf? cpf,
    CellPhone? cellPhone,
  }) {
    return SignupState(
      fullName: fullName ?? this.fullName,
      cpf: cpf ?? this.cpf,
      cellPhone: cellPhone ?? this.cellPhone,
    );
  }
}
