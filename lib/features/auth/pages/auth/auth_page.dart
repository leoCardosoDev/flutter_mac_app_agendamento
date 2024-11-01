import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:app_agendamento/core/widgets/app_elevated_button.dart';
import 'package:app_agendamento/core/widgets/app_outlined_button.dart';
import 'package:app_agendamento/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/brand/logo.svg'),
                  const SizedBox(width: 16),
                  SvgPicture.asset('assets/brand/title.svg'),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Olá! Como deseja acessar?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 50),
              AppElevatedButton(label: 'Entrar', onPressed: () {}),
              const SizedBox(height: 24),
              AppOutlinedButton(label: 'Cadastrar', onPressed: () {}),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: Divider(color: theme.gray)),
                  const Expanded(child: Center(child: Text('ou'))),
                  Expanded(child: Divider(color: theme.gray)),
                ],
              ),
              const SizedBox(height: 16),
              AppTextButton(
                label: 'Entrar como visitante',
                onPressed: () {},
                color: theme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
