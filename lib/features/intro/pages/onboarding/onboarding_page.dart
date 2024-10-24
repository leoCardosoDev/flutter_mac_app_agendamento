import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: PageView()),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 44),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateColor.resolveWith((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.blueAccent;
                      }
                      return theme.primaryColor;
                    }),
                  ),
                  child: const Text('Continuar'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
