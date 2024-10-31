import 'package:app_agendamento/core/widgets/app_text_button.dart';
import 'package:app_agendamento/features/intro/widgets/intro_base_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: IntroBasePage(
              title: 'Página não encontrada!',
              body: '',
              imagePath: 'assets/intro/not-found.svg',
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
                left: 24,
                right: 24,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AppTextButton(
                  label: 'Voltar',
                  onPressed: context.pop,
                ),
              )),
        ],
      ),
    );
  }
}
