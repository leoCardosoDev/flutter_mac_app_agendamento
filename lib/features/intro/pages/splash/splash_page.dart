import 'package:app_agendamento/core/routes/app_routes.dart';
import 'package:app_agendamento/features/intro/pages/splash/splash_page_actions.dart';
import 'package:app_agendamento/features/intro/pages/splash/splash_page_cubit.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> implements SplashPageActions {
  Alignment logoAlignment = const Alignment(-2, -2);
  Alignment titleAlignment = const Alignment(2, 2);

  late final SplashPageCubit cubit = SplashPageCubit(this);
  @override
  void initState() {
    super.initState();
    cubit.initialize();

    Future.delayed(Duration.zero).then((value) {
      setState(() {
        logoAlignment = const Alignment(-0.28, 0);
        titleAlignment = const Alignment(0.28, 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedAlign(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceOut,
                alignment: logoAlignment,
                child: SvgPicture.asset('assets/brand/logo.svg')),
            AnimatedAlign(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceOut,
                alignment: titleAlignment,
                child: SvgPicture.asset('assets/brand/title.svg')),
          ],
        ),
      ),
    );
  }

  @override
  void navToMaintanence() {
    context.go('/maintanence');
  }

  @override
  void navToOnboarding() {
    context.go(AppRoutes.onboarding);
  }

  @override
  void navToAuth() {
    context.go('/auth');
  }

  @override
  void navToHome() {
    context.go('/home');
  }

  @override
  void navToForceUpadte() {
    context.go('/force-upadte');
  }

  @override
  void dispose() {
    super.dispose();
    cubit.dispose();
  }
}
