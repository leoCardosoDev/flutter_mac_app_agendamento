part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final FullName fullName;
  final Cpf cpf;
  final CellPhone cellPhone;
  final Email email;
  final Password password;
  final bool isLoading;

  const SignupState({
    required this.fullName,
    required this.cpf,
    required this.cellPhone,
    required this.email,
    required this.password,
    this.isLoading = false,
  });
  const SignupState.empty()
      : fullName = const FullName.pure(),
        cpf = const Cpf.pure(),
        cellPhone = const CellPhone.pure(),
        email = const Email.pure(),
        password = const Password.pure(),
        isLoading = false;

  bool get isValid => Formz.validate([
        fullName,
        cpf,
        cellPhone,
        email,
        password,
      ]);

  @override
  List<Object> get props =>
      [fullName, cpf, cellPhone, email, password, isLoading];

  SignupState copyWith({
    FullName? fullName,
    Cpf? cpf,
    CellPhone? cellPhone,
    Email? email,
    Password? password,
    bool? isLoading,
  }) {
    return SignupState(
      fullName: fullName ?? this.fullName,
      cpf: cpf ?? this.cpf,
      cellPhone: cellPhone ?? this.cellPhone,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
