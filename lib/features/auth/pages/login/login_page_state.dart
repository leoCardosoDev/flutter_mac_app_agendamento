// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_page_cubit.dart';

enum LoginPageStatus { initial, loading, failure, success }

class LoginPageState extends Equatable {
  final LoginPageStatus status;
  final String email;
  final String password;
  const LoginPageState({ this.email = '', this.password = '', this.status = LoginPageStatus.initial });

  @override
  List<Object> get props => [];

  LoginPageState copyWith({
    LoginPageStatus? status,
    String? email,
    String? password,
  }) {
    return LoginPageState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
