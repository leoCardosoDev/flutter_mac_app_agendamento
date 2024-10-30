import 'package:app_agendamento/features/intro/widgets/intro_base_page.dart';
import 'package:flutter/material.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroBasePage(
        title: 'Aplicativo em Manutenção',
        body:
            'Nosso app está passando por melhorias. Acompanhe nossas redes sociais para receber novidades.',
        imagePath: 'assets/intro/maintenance.svg',
      ),
    );
  }
}
