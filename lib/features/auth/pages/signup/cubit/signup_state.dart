part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final FullName fullName;
  final Cpf cpf;
  const SignupState({required this.fullName, required this.cpf});
  const SignupState.empty()
      : fullName = const FullName.pure(),
        cpf = const Cpf.pure();

  @override
  List<Object> get props => [fullName];

  SignupState copyWith({
    FullName? fullName,
    Cpf? cpf,
  }) {
    return SignupState(
      fullName: fullName ?? this.fullName,
      cpf: cpf ?? this.cpf,
    );
  }
}
