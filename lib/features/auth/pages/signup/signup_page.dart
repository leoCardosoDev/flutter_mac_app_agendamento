import 'package:app_agendamento/core/widgets/app_base_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      title: 'Cadastre-se',
      body: Container(
        color: Colors.greenAccent,
        height: 2000,
      ),
    );
  }
}
