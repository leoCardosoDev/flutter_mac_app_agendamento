import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:app_agendamento/core/widgets/app_base_page.dart';
import 'package:app_agendamento/core/widgets/app_elevated_button.dart';
import 'package:app_agendamento/core/widgets/app_logo.dart';
import 'package:app_agendamento/core/widgets/app_text_field.dart';
import 'package:app_agendamento/features/auth/pages/signup/cubit/signup_cubit.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Builder(builder: (context) {
        return AppBasePage(
          title: 'Criar conta',
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
                onChanged: (t) {},
              ),
              const SizedBox(height: 24),
              AppTextField(
                title: 'E-mail',
                hint: 'Informe o e-mail',
                textInputType: TextInputType.emailAddress,
                onChanged: (t) {},
              ),
              const SizedBox(height: 24),
              AppTextField(
                title: 'Senha',
                hint: 'Informe a senha',
                obscure: true,
                onChanged: (t) {},
              ),
              const SizedBox(height: 24),
              AppElevatedButton(label: 'Cadatrar', onPressed: () {})
            ],
          ),
        );
      }),
    );
  }
}
