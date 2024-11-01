import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:app_agendamento/core/widgets/app_base_page.dart';
import 'package:app_agendamento/core/widgets/app_logo.dart';
import 'package:app_agendamento/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
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
            onChanged: (t) {},
          ),
        ],
      ),
    );
  }
}
