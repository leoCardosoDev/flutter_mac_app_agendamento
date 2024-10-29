import 'package:app_agendamento/features/intro/pages/onboarding/onboarding_page.dart';
import 'package:app_agendamento/features/intro/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => Container(color: Colors.red),
    ),
  ],
);

class AppRoutes {
  static String get splash => '/';
  static String get onboarding => '/onboarding';
  static String get auth => '/auth';
}
