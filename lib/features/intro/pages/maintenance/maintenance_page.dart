import 'package:app_agendamento/features/intro/widgets/intro_base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: IntroBasePage(
              title: 'App em Manutenção',
              body:
                  'Nosso app está passando por melhorias. Acompanhe nossas redes sociais para receber novidades.',
              imagePath: 'assets/intro/maintenance.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset('assets/social/twitter.svg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
