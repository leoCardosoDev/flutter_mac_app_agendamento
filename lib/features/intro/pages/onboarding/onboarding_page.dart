// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:app_agendamento/core/widgets/app_elevated_button.dart';
import 'package:app_agendamento/core/widgets/app_text_button.dart';

import '../../../../core/theme/app_theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int page = 0;
  final pages = [
    OnboardingPageInfo(
      title: 'Seja bem-vindo(a)!',
      description:
          'Você poderá encontrar profissionais em sua região e agendar uma consulta com poucos cliques',
      imagePath: 'assets/onboarding/onboarding_2.svg',
    ),
    OnboardingPageInfo(
      title: 'Acesso à\nlocalização',
      description: 'Para facilitar a busca de profissionais em sua região',
      imagePath: 'assets/onboarding/onboarding_0.svg',
    ),
    OnboardingPageInfo(
      title: 'Ative as\nnotificações',
      description:
          'Para receber avisos importantes sobre os seus agendamentos.',
      imagePath: 'assets/onboarding/onboarding_1.svg',
    ),
    OnboardingPageInfo(
      title: 'Agende uma\nconsulta',
      description:
          'Você poderá encontrar profissionais em sua região e agendar uma consulta com poucos cliques',
      imagePath: 'assets/onboarding/onboarding_2.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (final p in pages)
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 2, child: SvgPicture.asset(p.imagePath)),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  p.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                    color: theme.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  p.description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
              onPageChanged: (p) {
                setState(() {
                  page = p;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 44),
            child: Row(
              children: [
                if (page > 0) ...[
                  AppTextButton(
                      label: 'Voltar',
                      onPressed: () {
                        _pageController.animateToPage(
                          page - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: AppElevatedButton(
                    label: 'Continuar',
                    iconPath: 'assets/icons/arrow_right.svg',
                    onPressed: () {
                      _pageController.animateToPage(
                        page + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
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

class OnboardingPageInfo {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPageInfo({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
