import 'package:app_agendamento/core/routes/app_routes.dart';
import 'package:app_agendamento/features/intro/pages/splash/splash_page_actions.dart';
import 'package:app_agendamento/features/intro/pages/splash/splash_page_cubit.dart';
import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> implements SplashPageActions {
  late final SplashPageCubit cubit = SplashPageCubit(this);
  @override
  void initState() {
    super.initState();
    cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 200,
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
