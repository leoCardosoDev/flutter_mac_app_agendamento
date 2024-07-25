import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState());
  Future<void> login() async {
    emit(const LoginPageState(status: LoginPageStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(const LoginPageState(status: LoginPageStatus.failure));
  }
}
