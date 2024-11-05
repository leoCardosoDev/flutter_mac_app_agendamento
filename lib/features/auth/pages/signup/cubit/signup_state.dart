part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final FullName fullName;
  const SignupState({required this.fullName});
  const SignupState.empty() : fullName = const FullName.pure();

  @override
  List<Object> get props => [fullName];

  SignupState copyWith({FullName? fullName}) {
    return SignupState(fullName: fullName ?? this.fullName);
  }
}
