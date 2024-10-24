import 'package:app_agendamento/core/widgets/app_elevated_button.dart';
import 'package:app_agendamento/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: PageView()),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 44),
            child: Row(
              children: [
                AppTextButton(label: 'Voltar', onPressed: () {}),
                const SizedBox(width: 16),
                Expanded(
                  child: AppElevatedButton(
                    label: 'Continuar',
                    iconPath: 'assets/icons/arrow_right.svg',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
