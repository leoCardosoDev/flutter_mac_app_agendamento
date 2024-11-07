import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:app_agendamento/core/widgets/app_base_page.dart';
import 'package:app_agendamento/core/widgets/app_elevated_button.dart';
import 'package:app_agendamento/core/widgets/app_logo.dart';
import 'package:app_agendamento/core/widgets/app_text_field.dart';
import 'package:app_agendamento/features/auth/models/email.dart';
import 'package:app_agendamento/features/auth/models/password.dart';
import 'package:app_agendamento/features/auth/pages/login/login_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return BlocProvider(
      create: (context) => LoginPageCubit(),
      child: BlocBuilder<LoginPageCubit, LoginPageState>(
          builder: (context, state) {
        return AppBasePage(
          title: 'Entrar',
          isLoading: state.isLoading,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: AppLogo()),
              const SizedBox(height: 10),
              Text(
                'Bem-vindo(a) de volta!',
                textAlign: TextAlign.center,
                style: theme.heading36Bold,
              ),
              const SizedBox(height: 32),
              AppTextField(
                title: 'E-mail',
                hint: 'Informe o e-mail',
                textInputType: TextInputType.emailAddress,
                onChanged: context.read<LoginPageCubit>().onEmailChanged,
                error: switch (state.email.displayError) {
                  EmailValidationError.empty => 'Campo obrigatório',
                  EmailValidationError.invalid => 'Digite um e-mail válido',
                  _ => null,
                },
              ),
              const SizedBox(height: 24),
              AppTextField(
                title: 'Senha',
                hint: 'Informe a senha',
                obscure: true,
                onChanged: context.read<LoginPageCubit>().onPasswordChanged,
                error: switch (state.password.displayError) {
                  PasswordValidationError.empty => 'Campo obrigatório',
                  _ => null,
                },
              ),
              const SizedBox(height: 24),
              AppElevatedButton(
                  label: 'Cadatrar',
                  onPressed: state.isValid
                      ? () {
                          FocusScope.of(context).unfocus();
                          context.read<LoginPageCubit>().onLoginPressed();
                        }
                      : null)
            ],
          ),
        );
      }),
    );
  }
}
