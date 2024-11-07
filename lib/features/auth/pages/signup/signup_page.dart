import 'package:app_agendamento/core/routes/app_routes.dart';
import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:app_agendamento/core/widgets/app_base_page.dart';
import 'package:app_agendamento/core/widgets/app_elevated_button.dart';
import 'package:app_agendamento/core/widgets/app_logo.dart';
import 'package:app_agendamento/core/widgets/app_text_field.dart';
import 'package:app_agendamento/features/auth/models/cell_phone.dart';
import 'package:app_agendamento/features/auth/models/cpf.dart';
import 'package:app_agendamento/features/auth/models/email.dart';
import 'package:app_agendamento/features/auth/models/full_name.dart';
import 'package:app_agendamento/features/auth/models/password.dart';
import 'package:app_agendamento/features/auth/pages/signup/cubit/signup_cubit.dart';
import 'package:app_agendamento/features/auth/pages/signup/signup_actions.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> implements SignupActions {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return BlocProvider(
      create: (context) => SignupCubit(this),
      child: BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
        return AppBasePage(
          title: 'Criar conta',
          isLoading: state.isLoading,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: AppLogo()),
              const SizedBox(height: 10),
              Text(
                'Cadastre-se',
                textAlign: TextAlign.center,
                style: theme.heading36Bold,
              ),
              const SizedBox(height: 32),
              AppTextField(
                title: 'Nome Completo',
                hint: 'Informe o nome completo',
                textInputType: TextInputType.text,
                onChanged: context.read<SignupCubit>().onFullNameChanged,
                error: switch (state.fullName.displayError) {
                  FullNameValidationError.empty => 'Campo obrigatório',
                  FullNameValidationError.incomplete =>
                    'Informe seu nome completo',
                  _ => null,
                },
              ),
              const SizedBox(height: 24),
              AppTextField(
                title: 'CPF',
                hint: 'Informe o CPF',
                textInputType: TextInputType.number,
                inputFormartters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                onChanged: context.read<SignupCubit>().onCpfChanged,
                error: switch (state.cpf.displayError) {
                  CpfValidationError.empty => 'Campo obrigatório',
                  CpfValidationError.invalid => 'Digite um cpf válido',
                  _ => null,
                },
              ),
              const SizedBox(height: 24),
              AppTextField(
                title: 'Telefone',
                hint: 'Informe o telefone',
                textInputType: TextInputType.phone,
                inputFormartters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter()
                ],
                onChanged: context.read<SignupCubit>().onCellPhoneChanged,
                error: switch (state.cellPhone.displayError) {
                  CellPhoneValidationError.empty => 'Campo obrigatório',
                  CellPhoneValidationError.invalid =>
                    'Digite um celular válido',
                  _ => null,
                },
              ),
              const SizedBox(height: 24),
              AppTextField(
                title: 'E-mail',
                hint: 'Informe o e-mail',
                textInputType: TextInputType.emailAddress,
                onChanged: context.read<SignupCubit>().onEmailChanged,
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
                onChanged: context.read<SignupCubit>().onPasswordChanged,
                error: switch (state.password.displayError) {
                  PasswordValidationError.empty => 'Campo obrigatório',
                  PasswordValidationError.tooShort =>
                    'Digite no mínimo 8 caracteres',
                  _ => null,
                },
              ),
              const SizedBox(height: 24),
              AppElevatedButton(
                  label: 'Cadatrar',
                  onPressed: state.isValid
                      ? () {
                          FocusScope.of(context).unfocus();
                          context.read<SignupCubit>().onSignUpPressed();
                        }
                      : null)
            ],
          ),
        );
      }),
    );
  }

  @override
  void navToHome() {
    context.go(AppRoutes.home);
  }
}
